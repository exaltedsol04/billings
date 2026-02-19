<?php
//ini_set('display_errors', 1);
//error_reporting(0);
include_once '../../init.php';
include_once '../../includes/razorpay.php';

$order_id = $_POST['order_id'];
//----get order details-----------
$order = $general_cls_call->select_query("cod_payment_status, payment_method, total, final_total", ORDERS_TESTS, "WHERE id=:id", array(':id'=>$order_id), 1);
//-------------------------------

if (empty($order) || $order->cod_payment_status == 'UPI Paid') {
    exit(json_encode(['error' => 'Invalid order']));
}

if($order->payment_method = 'wallet')
{
	$amount = $order->total;
}
else{
	$amount = $order->final_total;
}


$response = razorpayRequest('POST', '/v1/orders', [
    'amount' => $amount * 100,
    'currency' => RAZORPAY_CURRENCY,  //from config
    'receipt' => 'order_' . $order_id,
    'notes' => ['order_id' => $order_id]
]);
//echo $response['id'];
//echo "<pre>";print_r($response);die;

if(!empty($response['id']))
{
	//global $general_cls_call;
	$setValues = "cod_payment_status = :cod_payment_status, razorpay_transaction_id = :razorpay_transaction_id";

	$updateExecute = array(
		':cod_payment_status' => 'initiated',
		':razorpay_transaction_id' => $response['id'],		
		':id' => $order_id
	);

	$whereClause = " WHERE id = :id";

	$general_cls_call->update_query(
		ORDERS_TESTS,
		$setValues,
		$whereClause,
		$updateExecute
	);
	
	$referenceId = $order_id . '_' . time(); // must be unique

	$qr = razorpayRequest('POST', '/v1/payment_links', [
		'amount' => $amount * 100,
		'currency' => 'INR',
		'reference_id' => $referenceId,
		'description' => 'Order #' . $order_id,
		'notify' => ['sms' => false, 'email' => false],
		'reminder_enable' => false,
		'notes' => [
			'order_id' => $order_id,
			'razorpay_order_id' => $response['id']
		]
	]);

}

$short_url = $qr['short_url'];

echo '<img src="https://api.qrserver.com/v1/create-qr-code/?size=300x300&data='.urlencode($short_url).'">';

//echo json_encode(['razorpay_order_id' => $response['id']]);
//echo json_encode($response);

