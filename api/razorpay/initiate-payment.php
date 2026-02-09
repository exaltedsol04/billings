<?php
require_once __DIR__ . '../../init.php';
require_once __DIR__ . '/../../includes/razorpay.php';

$order_id = $_POST['order_id'];

$stmt = $pdo->prepare("SELECT * FROM orders WHERE id=?");
$stmt->execute([$order_id]);
$order = $stmt->fetch();

if (!$order || $order['payment_status'] === 'paid') {
    exit(json_encode(['error' => 'Invalid order']));
}

$response = razorpayRequest('POST', '/v1/orders', [
    'amount' => $order['amount'] * 100,
    'currency' => 'INR',
    'receipt' => 'order_' . $order_id,
    'notes' => ['order_id' => $order_id]
]);

saveRazorpayOrder($order_id, $response['id']);

/*function saveRazorpayOrder($order_id, $razorpay_order_id)
{
    global $pdo;
    $stmt = $pdo->prepare(
        "UPDATE orders SET razorpay_order_id=?, payment_status='initiated' WHERE id=?"
    );
    $stmt->execute([$razorpay_order_id, $order_id]);
}*/
echo json_encode(['razorpay_order_id' => $response['id']]);
