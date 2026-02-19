<?php
ini_set('display_errors', 1);
error_reporting(0);
include_once '../../init.php';
include_once '../../includes/razorpay.php';

$order_id = $_POST['order_id'];

$order = $general_cls_call->select_query("cod_payment_status, razorpay_transaction_id, payment_method, total, final_total", ORDERS_TESTS, "WHERE id=:id", array(':id'=>$order_id), 1);

if (empty($order)) {
    exit(json_encode(['error' => 'Order not found']));
}

if($order->payment_method = 'wallet')
{
	$amount = $order->total;
}
else{
	$amount = $order->final_total;
}

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
        'razorpay_order_id' => $order->razorpay_transaction_id
    ]
]);


/*$qr = razorpayRequest('POST', '/v1/payment_links', [
    "amount" => $amount * 100,
    "currency" => RAZORPAY_CURRENCY,  //from config
    "accept_partial" => false,
    "description" => "Payment for Order ".$order_id,
    "reference_id" => 'ORDER_'.$order_id.'_' . uniqid(),
    "notify" => [
        "sms" => false,
        "email" => false
    ],
    "reminder_enable" => false,
    "options" => [
        "upi_qr" => true
    ]
]);*/



$short_url = $qr['short_url'];

echo '<img src="https://api.qrserver.com/v1/create-qr-code/?size=300x300&data='.urlencode($short_url).'">';

//echo json_encode($qr);
