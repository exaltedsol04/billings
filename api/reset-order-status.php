<?PHP 
	//error_reporting(0);
	include_once '../init.php';
	
	extract($_POST);
	
	$order_check = $general_cls_call->select_query("id", ORDERS, "WHERE id =:id ", array(':id'=> $_POST['order_id']), 1);
	if(!empty($order_check->id))
	{
		// update status table packaging_operators_assign
		$setValuesPac="status=:status";
		$whereClausePac=" WHERE order_id=:order_id";
		$updateExecutePac=array(
			':status'=>3,
			':order_id'=>$_POST['order_id']
		);
		$updatePac=$general_cls_call->update_query(PACKAGING_OPERATORS_ASSIGN, $setValuesPac, $whereClausePac, $updateExecutePac);
		
		// update status table order
		$setValuesOrd="active_status=:active_status";
		$whereClauseOrd=" WHERE id=:id";
		$updateExecuteOrd=array(
			':active_status'=>3,
			':id'=>$_POST['order_id']
		);
		$updateOrd=$general_cls_call->update_query(ORDERS, $setValuesOrd, $whereClauseOrd, $updateExecuteOrd);
		
		// update status table order_item
		$setValuesOrdItm="active_status=:active_status";
		$whereClauseOrdItm=" WHERE order_id=:order_id";
		$updateExecuteOrdItm=array(
			':active_status'=>3,
			':order_id'=>$_POST['order_id']
		);
		$updateOrd=$general_cls_call->update_query(ORDERS_ITEMS, $setValuesOrdItm, $whereClauseOrdItm, $updateExecuteOrdItm);
		
		// update status table order_statuses
		$where=" WHERE order_id=:order_id and status>:status";
		$data_array = [
			':order_id' => $_POST['order_id'],
			':status' => 3
		];
		$update = $general_cls_call->delete_query(ORDERS_STATUSES, $where, $data_array);
		
		echo json_encode([
			"status" => 200,
			"msg" => 'Updated successfully.'
		]);
	}		
	else
	{
		echo json_encode([
			"status" => 300,
			"msg" => 'Order not found.'
		]);
	}
	exit;

?>
