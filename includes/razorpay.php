<?php

define('RAZORPAY_KEY_ID', 'rzp_test_xxxxx');
define('RAZORPAY_KEY_SECRET', 'xxxxxxxxxx');
define('RAZORPAY_WEBHOOK_SECRET', 'your_webhook_secret');

function razorpayRequest($method, $endpoint, $data = [])
{
    $ch = curl_init("https://api.razorpay.com" . $endpoint);
    curl_setopt_array($ch, [
        CURLOPT_USERPWD => RAZORPAY_KEY_ID . ":" . RAZORPAY_KEY_SECRET,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => $method,
        CURLOPT_HTTPHEADER => ['Content-Type: application/json']
    ]);

    if (!empty($data)) {
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    }

    $res = curl_exec($ch);
    curl_close($ch);
    return json_decode($res, true);
}


function verifySignature()
{
    $payload = file_get_contents('php://input');
    $sig = $_SERVER['HTTP_X_RAZORPAY_SIGNATURE'] ?? '';
    $expected = hash_hmac('sha256', $payload, RAZORPAY_WEBHOOK_SECRET);

    if (!hash_equals($expected, $sig)) {
        http_response_code(401);
        exit('Invalid signature');
    }
    return json_decode($payload, true);
}
