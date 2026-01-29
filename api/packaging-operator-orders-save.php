<?PHP 
	//error_reporting(0);
	include_once '../init.php';


 $data = json_decode(file_get_contents("php://input"), true);
	$authData = $general_cls_call->checkAuth();	
	
	$order_status_id = 4;
	$role_id = 5;
	if($authData['token_type'] == 'app') {
		
	    $order_id = $_POST['order_id'] ?? 0;
	    
	} else {
		header("Content-Type: application/json");
	    // Read JSON body
	   // $data = json_decode(file_get_contents("php://input"), true);
		//print_r($data);

    	$order_id = $data['order_id'] ?? 0;
	}

	
	/*echo $order_status_id.'<br/>';
	echo $order_id.'<br/>';
	echo $role_id.'<br/>';
	echo json_encode($data);exit;*/
	
	$setValues="status=:status";
	$updateExecute=array(
		':status'		=> $order_status_id,
		':order_id'		=> $order_id
	);
	$whereClause=" WHERE order_id = :order_id";
	$okOne = $general_cls_call->update_query(PACKAGING_OPERATORS_ASSIGN, $setValues, $whereClause, $updateExecute);
	if($okOne) {
		//insert order statuses
		$field = "order_id, status, created_by, user_type, created_at";
		$value = ":order_id, :status, :created_by, :user_type, :created_at";
		$addExecute=array(
			':order_id'				=> $order_id,
			':status'				=> $order_status_id,
			//':created_by'			=> $_POST['user_id'],
			':created_by'			=> $authData['packaging_operator_admin_id'],
			':user_type'			=> $role_id,
			':created_at'			=> date("Y-m-d H:i:s")
		);
		$okTwo = $general_cls_call->insert_query(ORDERS_STATUSES, $field, $value, $addExecute);		
	}
	if($okTwo) {	
		//update orders
		$setValues="active_status=:active_status";
		$updateExecute=array(
			':active_status'	=> $order_status_id,
			':order_id'			=> $order_id
		);
		$whereClause=" WHERE id = :order_id";
		$okThree = $general_cls_call->update_query(ORDERS, $setValues, $whereClause, $updateExecute);
	}
	if($okThree) {	
		//update orders items
		$setValues="active_status=:active_status";
		$updateExecute=array(
			':active_status'	=> $order_status_id,
			':order_id'			=> $order_id
		);
		$whereClause=" WHERE order_id = :order_id";
		$okFour = $general_cls_call->update_query(ORDERS_ITEMS, $setValues, $whereClause, $updateExecute);
	}
	if($okFour) {
		$data['status'] = 200;
		$data['msg'] = 'Packaging completed successfully.';
	} else {
		$data['status'] = 400;
		$data['msg'] = 'Something went wrong.';
	}	
	echo json_encode($data);exit;

?>