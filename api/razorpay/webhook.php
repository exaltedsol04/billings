<?php
include_once '../../init.php';
include_once '../../includes/razorpay.php';

$data = verifySignature();
$event = $data['event'] ?? '';

if ($event === 'payment.captured') {
	//global $general_cls_call;
    $p = $data['payload']['payment']['entity'];
    //markOrderPaid($p['order_id'], $p['id']);
	
	$setValues = "cod_payment_status = :cod_payment_status";

	$updateExecute = array(
		':cod_payment_status' => 'UPI Paid',
		':id' => $p['order_id']
	);

	$whereClause = " WHERE id = :id";

	$general_cls_call->update_query(
		ORDERS_TESTS,
		$setValues,
		$whereClause,
		$updateExecute
	);
	
}

if ($event === 'refund.processed') {
	//global $general_cls_call;
    $r = $data['payload']['refund']['entity'];
    //markOrderRefunded($r['payment_id'], $r['id']);
	
	$setValues = "cod_payment_status = :cod_payment_status";

	$updateExecute = array(
		':cod_payment_status' => 'refunded',
		':id' => $r['payment_id']
	);

	$whereClause = " WHERE id = :id";

	$general_cls_call->update_query(
		ORDERS_TESTS,
		$setValues,
		$whereClause,
		$updateExecute
	);
}

http_response_code(200);
