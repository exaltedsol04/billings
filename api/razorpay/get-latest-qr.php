<?php
include_once '../../init.php';
header('Content-Type: application/json');
$machine_id = $_GET['machine_id'] ?? null;

$qr_data = $general_cls_call->select_query("id,total_amount,qr_url", POS_ORDERS, "WHERE status=:status AND machine_id=:machine_id ORDER BY qr_date DESC", array(':status'=>0, 'machine_id'=>$machine_id), 1);

if (!$qr_data) {
    echo json_encode([
        'qr_url' => '',
        'total_amount' => '',
        'id' => ''
    ]);
    exit;
}

$data['qr_url'] = $qr_data->qr_url;
$qr = $qr_data->qr_url ? $qr_data->qr_url : '';



echo json_encode([
    'qr_url' => $qr,
    'total_amount' => $qr_data->total_amount ? $qr_data->total_amount : '',
    'id' => $qr_data->id ? $qr_data->id : ''
]);
exit;
//echo json_encode($data ?: []);
?>
