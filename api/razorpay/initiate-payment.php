<?php
//ini_set('display_errors', 1);
//error_reporting(E_ALL);
include_once '../../init.php';
include_once '../../includes/razorpay.php';
//include_once('../../includes/config.php');

$order_id = $_POST['order_id'];

//----get order details-----------
$order = $general_cls_call->select_query("*", ORDERS, "WHERE id=:id", array(':id'=>$order_id), 1);
//-------------------------------


if (empty($order) || $order->payment_status == 2) {
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
    'currency' => 'INR',
    'receipt' => 'order_' . $order_id,
    'notes' => ['order_id' => $order_id]
]);
//echo $response['id'];
//echo "<pre>";print_r($response);die;

if(!empty($response['id']))
{
	saveRazorpayOrder($order_id, $response['id']);
}

function saveRazorpayOrder($order_id, $razorpay_order_id)
{
	 global $general_cls_call;
    /*global $pdo;
    $stmt = $pdo->prepare(
        "UPDATE orders SET razorpay_order_id=?, payment_status='initiated' WHERE id=?"
    );
    $stmt->execute([$razorpay_order_id, $order_id]);*/
	
	$setValues = "payment_status = :payment_status";

	$updateExecute = array(
		':payment_status' => 1,
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


/*{
    "amount": 100,
    "amount_due": 100,
    "amount_paid": 0,
    "attempts": 0,
    "created_at": 1770704819,
    "currency": "INR",
    "entity": "order",
    "id": "order_SELMXaQbvXnecw",
    "notes": {
        "order_id": "22222222"
    },
    "offer_id": null,
    "receipt": "order_22222222",
    "status": "created"
}*/
