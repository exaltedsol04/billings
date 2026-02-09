<?php
require_once __DIR__ . '../../init.php';
require_once __DIR__ . '/../../includes/razorpay.php';

$order_id = $_POST['order_id'];

$stmt = $pdo->prepare("SELECT razorpay_payment_id, amount FROM orders WHERE id=?");
$stmt->execute([$order_id]);
$order = $stmt->fetch();

if (!$order || empty($order['razorpay_payment_id'])) {
    exit(json_encode(['error' => 'Payment not found']));
}

$response = razorpayRequest(
    'POST',
    '/v1/payments/' . $order['razorpay_payment_id'] . '/refund',
    [
        'amount' => $order['amount'] * 100,
        'notes' => ['reason' => 'Order cancelled']
    ]
);

markOrderRefunded($order['razorpay_payment_id'], $response['id']);

/*function markOrderRefunded($razorpay_payment_id, $refund_id)
{
    global $pdo;
    $stmt = $pdo->prepare(
        "UPDATE orders
         SET payment_status='refunded',
             razorpay_refund_id=?
         WHERE razorpay_payment_id=?"
    );
    $stmt->execute([$refund_id, $razorpay_payment_id]);
}*/
echo json_encode([
    'refund_id' => $response['id'],
    'status' => $response['status']
]);
