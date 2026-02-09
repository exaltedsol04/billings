<?php
	//FIREBASE PROJECT ID 
	define('FIREBASE_PROJECT_ID', 'ecofresh-ca549');
	
	//RAZORPAY CREDENTIAL
	define('RAZORPAY_KEY_ID', 'rzp_test_xxxxx');
	define('RAZORPAY_KEY_SECRET', 'xxxxxxxxxx');
	define('RAZORPAY_WEBHOOK_SECRET', 'your_webhook_secret');
	
	/* used in online-packaging-operator-orders*/
	$operator_array[] = [
		'id' => 4,
		'value' => 'Packed'
	]; 
	
	$purchase_accept_array = [
		'1'=> 'All Right',
		'2'=> 'Damaged',
		'3'=> 'Exceed',
		'4'=> 'Short fall'
	];
	
	$auto_update = 2; // if 1 auto on and 2 then off
	$auto_time= 10000; // time set for assign operator
	
	$deductreason = [
		'1'=> 'Processing',
		'2'=> 'Damage',
		'3'=> 'Wrong entry'
	];
 
?>