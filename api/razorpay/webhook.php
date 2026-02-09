<?php
require_once __DIR__ . '../../init.php';
require_once __DIR__ . '/../../includes/razorpay.php';

$data = verifySignature();
$event = $data['event'] ?? '';

if ($event === 'payment.captured') {
    $p = $data['payload']['payment']['entity'];
    markOrderPaid($p['order_id'], $p['id']);
}

if ($event === 'refund.processed') {
    $r = $data['payload']['refund']['entity'];
    markOrderRefunded($r['payment_id'], $r['id']);
}

/*function markOrderPaid($razorpay_order_id, $payment_id)
{
    global $pdo;
    $stmt = $pdo->prepare(
        "UPDATE orders
         SET payment_status='paid',
             razorpay_payment_id=?
         WHERE razorpay_order_id=?"
    );
    $stmt->execute([$payment_id, $razorpay_order_id]);
}

function markOrderRefunded($razorpay_payment_id, $refund_id)
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

http_response_code(200);
