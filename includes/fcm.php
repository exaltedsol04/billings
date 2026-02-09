<?php
include_once 'init.php';

function getFirebaseCredentialsFromDB()
{	
	$row = $this->select_query("value", SETTINGS, "WHERE variable=:variable", array(':variable'=>'jsonFile'), 1);

    if (!empty($row)) {
        throw new Exception("Firebase credentials not found");
    }

    return json_decode($row->value, true);
}


function getFirebaseAccessToken()
{
    $key = getFirebaseCredentialsFromDB();

    $now = time();
    $payload = [
        'iss' => $key['client_email'],
        'scope' => 'https://www.googleapis.com/auth/firebase.messaging',
        'aud' => $key['token_uri'],
        'iat' => $now,
        'exp' => $now + 3600
    ];

    $jwtHeader = base64UrlEncode(json_encode([
        'alg' => 'RS256',
        'typ' => 'JWT'
    ]));

    $jwtPayload = base64UrlEncode(json_encode($payload));
    $jwt = $jwtHeader . '.' . $jwtPayload;

    openssl_sign($jwt, $signature, $key['private_key'], 'SHA256');
    $jwt .= '.' . base64UrlEncode($signature);

    $ch = curl_init($key['token_uri']);
    curl_setopt_array($ch, [
        CURLOPT_POST => true,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTPHEADER => ['Content-Type: application/x-www-form-urlencoded'],
        CURLOPT_POSTFIELDS => http_build_query([
            'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
            'assertion' => $jwt
        ])
    ]);

    $res = json_decode(curl_exec($ch), true);
    curl_close($ch);

    return $res['access_token'];
}


function base64UrlEncode($data)
{
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

/**
 * Send Firebase notification to a user
 */
function sendUserNotification(
    int $userId,
    string $title,
    string $body,
    array $data = []
) {

	$user = $this->select_query("fcm_token", USER_TOKENS, "WHERE user_id=:user_id", array(':user_id'=>$userId), 1);

    if (!empty($user) || empty($user->fcm_token)) {
        return [
            'status' => false,
            'message' => 'FCM token not found'
        ];
    }

    $accessToken = getFirebaseAccessToken();
    $projectId = FIREBASE_PROJECT_ID;

    $payload = [
        "message" => [
            "token" => $user->fcm_token,
            "notification" => [
                "title" => $title,
                "body" => $body
            ],
            "data" => array_merge(
                [
                    "click_action" => "OPEN_APP"
                ],
                array_map('strval', $data)
            )
        ]
    ];

    $ch = curl_init(
        "https://fcm.googleapis.com/v1/projects/$projectId/messages:send"
    );

    curl_setopt_array($ch, [
        CURLOPT_POST => true,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTPHEADER => [
            "Authorization: Bearer $accessToken",
            "Content-Type: application/json"
        ],
        CURLOPT_POSTFIELDS => json_encode($payload)
    ]);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    return [
        'status' => $httpCode === 200,
        'response' => $response
    ];
}


/*sendUserNotification(
    $userId,
    "Title for the notification",
    "Body for the notification",
    [
        "screen" => "notification"
    ]
);*/

