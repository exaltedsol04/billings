<?php
require_once __DIR__ . '../../init.php';
require_once __DIR__ . '/../../includes/razorpay.php';

$razorpay_order_id = $_POST['razorpay_order_id'];

$stmt = $pdo->prepare("SELECT amount FROM orders WHERE razorpay_order_id=?");
$stmt->execute([$razorpay_order_id]);
$order = $stmt->fetch();

if (!$order) {
    exit(json_encode(['error' => 'Order not found']));
}

$response = razorpayRequest('POST', '/v1/payments/qr_codes', [
    'type' => 'upi_qr',
    'name' => 'Delivery App',
    'usage' => 'single_use',
    'fixed_amount' => true,
    'payment_amount' => $order['amount'] * 100,
    'description' => 'Doorstep Payment',
    'close_by' => time() + 900
]);

echo json_encode([
    'qr_image' => $response['image_url'],
    'qr_id' => $response['id']
]);
