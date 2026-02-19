<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

include_once '../../init.php';
include_once '../../includes/razorpay.php';

global $general_cls_call;

try {

    $data = verifySignature();
    $event = $data['event'] ?? '';

    /* ================= PAYMENT SUCCESS ================= */

    if ($event === 'payment.captured') {

        $p = $data['payload']['payment']['entity'];
		$transaction_id = $p['id'];
		$method = $p['method'] ?? '';


        // YOUR ORDER ID (from notes)
        $orderId = $p['notes']['order_id'] ?? null;

        if (!$orderId) {
            throw new Exception("Order ID missing in notes");
        }

        $setValues = "cod_payment_status = :cod_payment_status, transaction_id = :transaction_id";

        $updateExecute = [
            //':payment_details' => json_encode($data),
            ':transaction_id' => $transaction_id,
            ':cod_payment_status' => 'UPI Paid',
            ':id' => $orderId
        ];

        $whereClause = " WHERE id = :id";

        $general_cls_call->update_query(
            ORDERS_TESTS,
            $setValues,
            $whereClause,
            $updateExecute
        );
    }

    /* ================= REFUND ================= */

    if ($event === 'refund.processed') {

        $r = $data['payload']['refund']['entity'];

        $orderId = $r['notes']['order_id'] ?? null;

        if (!$orderId) {
            throw new Exception("Order ID missing in refund notes");
        }

        $setValues = "cod_payment_status = :cod_payment_status,
                      payment_details = :payment_details";

        $updateExecute = [
            ':payment_details' => json_encode($data),
            ':cod_payment_status' => 'refunded',
            ':id' => $orderId
        ];

        $whereClause = " WHERE id = :id";

        $general_cls_call->update_query(
            ORDERS_TESTS,
            $setValues,
            $whereClause,
            $updateExecute
        );
    }

    http_response_code(200);
    echo "OK";

} catch (Exception $e) {

    file_put_contents(
        __DIR__.'/webhook_error_log.txt',
        date('Y-m-d H:i:s').' '.$e->getMessage()."\n",
        FILE_APPEND
    );

    http_response_code(500);
}
/*{"entity":"event","account_id":"acc_S3FaHtCswJFm5e","event":"payment.captured","contains":["payment"],"payload":{"payment":{"entity":{"id":"pay_SI0YOvdhMf0Edt","entity":"payment","amount":100,"currency":"INR","base_amount":100,"status":"captured","order_id":"order_SI0Y9ShnrQbiJe","invoice_id":null,"international":false,"method":"upi","amount_refunded":0,"amount_transferred":0,"refund_status":null,"captured":true,"description":"#SI0Xl3T5YDruwp","card_id":null,"bank":null,"wallet":null,"vpa":"exaltedsol@okhdfcbank","email":"void@razorpay.com","contact":"+917003009400","notes":{"order_id":"1","razorpay_order_id":"order_SI0XXvNCrKeHIG"},"fee":3,"tax":0,"error_code":null,"error_description":null,"error_source":null,"error_step":null,"error_reason":null,"acquirer_data":{"rrn":"118879027885"},"created_at":1771504899,"provider":null,"upi":{"payer_account_type":"bank_account","vpa":"exaltedsol@okhdfcbank","flow":"intent"},"reward":null}}},"created_at":1771504925}*/