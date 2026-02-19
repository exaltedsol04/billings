<?php
//ini_set('display_errors', 1);
//error_reporting(0);
include_once '../../init.php';
include_once '../../includes/razorpay.php';

$order_id = $_POST['order_id'];
//----get order details-----------
$order = $general_cls_call->select_query("cod_payment_status, payment_method, total, final_total", ORDERS, "WHERE id=:id", array(':id'=>$order_id), 1);
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
	global $general_cls_call;
	$setValues = "cod_payment_status = :cod_payment_status";

	$updateExecute = array(
		':cod_payment_status' => 'initiated',
		':id' => $order_id
	);

	$whereClause = " WHERE id = :id";

	$general_cls_call->update_query(
		ORDERS,
		$setValues,
		$whereClause,
		$updateExecute
	);
}

//echo json_encode(['razorpay_order_id' => $response['id']]);
echo json_encode($response);

