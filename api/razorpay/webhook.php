<?php
include_once '../../init.php';
include_once '../../includes/razorpay.php';

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

function markOrderPaid($razorpay_order_id, $payment_id)
{
    global $general_cls_call;
    /*$stmt = $pdo->prepare(
        "UPDATE orders
         SET payment_status='paid',
             razorpay_payment_id=?
         WHERE razorpay_order_id=?"
    );
    $stmt->execute([$payment_id, $razorpay_order_id]);*/
	
	
	$setValues = "cod_payment_status = :cod_payment_status";

	$updateExecute = array(
		':cod_payment_status' => 'UPI Paid',
		':id' => $razorpay_order_id
	);

	$whereClause = " WHERE id = :id";

	$general_cls_call->update_query(
		ORDERS,
		$setValues,
		$whereClause,
		$updateExecute
	);
	
}

function markOrderRefunded($razorpay_payment_id, $refund_id)
{
    global $general_cls_call;
     /*$stmt = $pdo->prepare(
        "UPDATE orders
         SET payment_status='refunded',
             razorpay_refund_id=?
         WHERE razorpay_payment_id=?"
    );
    $stmt->execute([$refund_id, $razorpay_payment_id]);*/
	
	
	$setValues = "cod_payment_status = :cod_payment_status";

	$updateExecute = array(
		':cod_payment_status' => 'refunded',
		':id' => $razorpay_payment_id
	);

	$whereClause = " WHERE id = :id";

	$general_cls_call->update_query(
		ORDERS,
		$setValues,
		$whereClause,
		$updateExecute
	);
}

http_response_code(200);
