<?PHP 
	error_reporting(0);
	include_once '../init.php';
			
	$authData = $general_cls_call->checkAuth($_SESSION['TOKEN_TYPE']);
	//print_r($authData);die;
	
	if($authData['token_type'] == 'app') {
		$operatorId = $authData['packaging_operator_id'] ?? 0;
	} else {
		header("Content-Type: application/json");
		// Read JSON body
		$data = json_decode(file_get_contents("php://input"), true);
		$operatorId = $data['operator_id'] ?? 0;
	}	
	
	//echo $operatorId;die;
	if (!$operatorId) {
		echo json_encode(["status"=>false, "message"=>"Operator ID missing"]);
		exit;
	}	

	if (!$operatorId) {
		$data['status'] = 400;
		$data['message'] = 'operator_id required';
	}
	else{
		
		//$data['status'] = 400;
		//$data['message'] = $operatorId.'found';
		
		$fields = "";
		$tables = ORDERS_ITEMS . " oi
		INNER JOIN " . PACKAGING_OPERATORS_ASSIGN . " po ON po.order_id = oi.order_id";
		$where = "WHERE 1 ORDER BY p.name";
		$params = [];
		$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
	}
	
	echo json_encode($data);
	exit;
	
?>