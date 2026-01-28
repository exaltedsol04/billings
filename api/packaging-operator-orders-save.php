<?PHP 
	//error_reporting(0);
	include_once '../init.php';
	
	$authData = $general_cls_call->checkAuth();
	header("Content-Type: application/json");
	// Read JSON body
	$data = json_decode(file_get_contents("php://input"), true);
	
	//print_r($data);die;
	
	$order_status_id = $data['status'] ?? 0;
	$order_id = $data['order_id'] ?? 0;
	$role_id = $data['role_id'] ?? 0;
	//$order_status_id = $_POST['status'];
	//$order_id = $_POST['order_id'];
	
	$setValues="status=:status";
	$updateExecute=array(
		':status'		=> $order_status_id,
		':order_id'		=> $order_id
	);
	$whereClause=" WHERE order_id = :order_id";
	$general_cls_call->update_query(PACKAGING_OPERATORS_ASSIGN, $setValues, $whereClause, $updateExecute);
	
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
	$general_cls_call->insert_query(ORDERS_STATUSES, $field, $value, $addExecute);				
	//update orders
	$setValues="active_status=:active_status";
	$updateExecute=array(
		':active_status'	=> $order_status_id,
		':order_id'			=> $order_id
	);
	$whereClause=" WHERE id = :order_id";
	$general_cls_call->update_query(ORDERS, $setValues, $whereClause, $updateExecute);
	//update orders items
	$setValues="active_status=:active_status";
	$updateExecute=array(
		':active_status'	=> $order_status_id,
		':order_id'			=> $order_id
	);
	$whereClause=" WHERE order_id = :order_id";
	$general_cls_call->update_query(ORDERS_ITEMS, $setValues, $whereClause, $updateExecute);

	$data['status'] = 200;
	$data['msg'] = 'Packaging completed successfully.';
	echo json_encode($data);exit;

?>