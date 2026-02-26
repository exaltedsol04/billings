<?php
	//FIREBASE PROJECT ID 
	define('FIREBASE_PROJECT_ID', 'ecofresh-ca549');
	
	//RAZORPAY CREDENTIAL
	define('RAZORPAY_KEY_ID', 'rzp_live_S4ZlQI0kKeRgzo');
	define('RAZORPAY_KEY_SECRET', 'Sui3jI6YzsAweOuLXHtfZF6m');
	define('RAZORPAY_WEBHOOK_SECRET', 'Eco123leaf');
	define('RAZORPAY_CURRENCY', 'INR');
	
	define('IP_ADDRESS', $_SERVER['REMOTE_ADDR']);
	
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
		'3'=> 'Wrong entry',
		'4'=> 'Others'
	];
	
	// stock quantity input validation
	$allowedZeroDecimals = [
		0.01, 0.02, 0.025, 0.05,
		0.1, 0.2, 0.25, 0.5, 0.75
	];
 
?>