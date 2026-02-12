<?php
	include_once '../init.php';
	
	extract($_POST);
	//echo $user_id;die;
	$ch = $fcm->sendUserNotification(
		$userId,
		"Title for the notification-23",
		"Body for the notification",
		[
			"screen" => "TEST notification"
		]
	);
	
	echo "<pre>";print_r($ch);
?>