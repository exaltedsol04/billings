<?php
include_once '../../init.php';
include_once '../../includes/razorpay.php';

$order_id = $_POST['order_id'];
//----get order details-----------
$order = $general_cls_call->select_query("status, payment_status, total_amount", POS_ORDERS, "WHERE id=:id", array(':id'=>$order_id), 1);
//-------------------------------

if (empty($order) || $order->status == 1) {
    exit(json_encode(['error' => 'Invalid order']));
}
$amount = $order->total_amount;


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
	$setValues = "payment_status = :payment_status, razorpay_order_id = :razorpay_order_id, updated_at=:updated_at";

	$updateExecute = array(
		':payment_status' => 'initiated',
		':razorpay_order_id' => $response['id'],		
		':updated_at' => date("Y-m-d H:i:s"),		
		':id' => $order_id
	);

	$whereClause = " WHERE id = :id";

	$general_cls_call->update_query(
		POS_ORDERS,
		$setValues,
		$whereClause,
		$updateExecute
	);
	

	if(!empty($qr['image_url']))
	{
		$setValuesUrl = "qr_url = :qr_url, razorpay_order_id = :razorpay_order_id, updated_at=:updated_at";

		$updateExecuteUrl = array(
			':qr_url' => 'initiated',
			':razorpay_order_id' => $response['id'],		
			':updated_at' => date("Y-m-d H:i:s"),		
			':id' => $order_id
		);

		$whereClauseUrl = " WHERE id = :id";

		$general_cls_call->update_query(
			POS_ORDERS,
			$setValuesUrl,
			$whereClauseUrl,
			$updateExecuteUrl
		);
	}
	else{
		echo json_encode(['status' => false]);
	}
	exit;

}


//echo json_encode(['razorpay_order_id' => $response['id']]);
//echo json_encode($response);

