<?PHP 
	//error_reporting(0);
	include_once '../init.php';
	//============= for api =========
	header('Content-Type: application/json');
	//echo $_POST['operator_id'];die;
	$operatorId = $_POST['operator_id'];

	if ($operatorId == 0) {
		$data['status'] = 400;
		$data['message'] = 'operator_id required';
	}
	else{

		$where = "WHERE poa.packaging_operator_id = :packaging_operator_id
				  AND poa.status = :status
				  ORDER BY poa.created_at DESC";

		$params = [
			':packaging_operator_id' => $operatorId,
			':status' => 3
		];

		$fields = "o.id, o.orders_id, o.final_total, o.user_id, o.delivery_time, o.packing_charge, o.created_at, po.name AS packaging_operator_name, osl.status AS orders_status_list_status
		";

		$tables = PACKAGING_OPERATORS_ASSIGN . " poa
			INNER JOIN " . ORDERS . " o ON o.id = poa.order_id
			LEFT JOIN " . PACKAGING_OPERATORS . " po ON po.id = poa.packaging_operator_id
			INNER JOIN " . ORDERS_STATUS_LISTS . " osl ON osl.id = poa.status";

		$dataArr = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
		$data['status'] = 200;
		$data['data'] = $dataArr;
	}
	
	echo json_encode($data);
	exit;
	
?>