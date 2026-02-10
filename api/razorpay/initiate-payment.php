<?php
//ini_set('display_errors', 1);
//error_reporting(E_ALL);
include_once '../../init.php';
include_once '../../includes/razorpay.php';

$order_id = $_POST['order_id'];
$amount = $_POST['amount'];
$currency = $_POST['currency'];

/*$stmt = $pdo->prepare("SELECT * FROM orders WHERE id=?");
$stmt->execute([$order_id]);
$order = $stmt->fetch();

if (!$order || $order['payment_status'] === 'paid') {
    exit(json_encode(['error' => 'Invalid order']));
}*/

$response = razorpayRequest('POST', '/v1/orders', [
    'amount' => $amount * 100,
    'currency' => $currency,
    'receipt' => 'order_' . $order_id,
    'notes' => ['order_id' => $order_id]
]);

//saveRazorpayOrder($order_id, $response['id']);

/*function saveRazorpayOrder($order_id, $razorpay_order_id)
{
    global $pdo;
    $stmt = $pdo->prepare(
        "UPDATE orders SET razorpay_order_id=?, payment_status='initiated' WHERE id=?"
    );
    $stmt->execute([$razorpay_order_id, $order_id]);
}*/
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
