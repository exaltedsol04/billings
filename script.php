<?PHP
	include_once 'init.php';
	
	
	$payload = '{
  "event": "payment.captured",
  "payload": {
    "payment": {
      "entity": {
        "id": "pay_test123",
        "amount": 100,
        "notes": {
          "order_id": "1"
        }
      }
    }
  }
}
';

$secret = 'Eco123leaf';

echo hash_hmac('sha256', $payload, $secret);die;



	//update ADMIN_STOCK_PURCHASE_LIST
	$fields = "st.id, st.product_variant_id, st.stock, pv.type, pv.stock_unit_id, pv.measurement";
	$tables = ADMIN_STOCK_PURCHASE_LIST . " st
	INNER JOIN " . PRODUCT_VARIANTS . " pv ON pv.id = st.product_variant_id";
	
	$where ="WHERE 1";
	$params = [];
	$sqlQuerya = $general_cls_call->select_query($fields, $tables, $where, $params, 2);
	$totArr = [];
	if($sqlQuerya[0] != '')
	{
		foreach($sqlQuerya as $arr)
		{
			if($arr->type == 'loose') {
				$unit = $general_cls_call->select_query("name, conversion", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
				$loose_stock_quantity = ($arr->stock * $arr->measurement) / $unit->conversion;
				
				$setValues="loose_stock_quantity=:loose_stock_quantity";
				$updateExecute=array(
					':loose_stock_quantity'	=> $loose_stock_quantity,
					':id'			=> $arr->id
				);
				$whereClause=" WHERE id=:id";
				$general_cls_call->update_query(ADMIN_STOCK_PURCHASE_LIST, $setValues, $whereClause, $updateExecute);
				
				$totArr['ADMIN_STOCK_PURCHASE_LIST'] = [
					'id' => $arr->id,
					'loose_stock_quantity' => $loose_stock_quantity,
					'unitname' => $unit->name,
					'type' => $arr->type
				];
			}
		}
	}
	//update PRODUCT_STOCK_TRANSACTION
	$fields = "pr.id, pr.product_variant_id, pr.stock, pv.type, pv.stock_unit_id, pv.measurement";
	$tables = PRODUCT_STOCK_TRANSACTION . " pr
	INNER JOIN " . PRODUCT_VARIANTS . " pv ON pv.id = pr.product_variant_id";
	
	$where ="WHERE 1";
	$params = [];
	$sqlQueryc = $general_cls_call->select_query($fields, $tables, $where, $params, 2);
	$totArr = [];
	if($sqlQueryc[0] != '')
	{
		foreach($sqlQueryc as $arr)
		{
			if($arr->type == 'loose') {
				$unit = $general_cls_call->select_query("name, conversion", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
				$loose_stock_quantity = ($arr->stock * $arr->measurement) / $unit->conversion;
				
				$setValues="loose_stock_quantity=:loose_stock_quantity";
				$updateExecute=array(
					':loose_stock_quantity'	=> $loose_stock_quantity,
					':id'			=> $arr->id
				);
				$whereClause=" WHERE id=:id";
				$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
				
				$totArr['PRODUCT_STOCK_TRANSACTION'] = [
					'id' => $arr->id,
					'loose_stock_quantity' => $loose_stock_quantity,
					'unitname' => $unit->name,
					'type' => $arr->type
				];
			}
		}
	}
	//update POS_ORDERS_ITEMS
	$fields = "oi.id, oi.product_variant_id, oi.quantity, pv.type, pv.stock_unit_id, pv.measurement";
	$tables = POS_ORDERS_ITEMS . " oi
	INNER JOIN " . PRODUCT_VARIANTS . " pv ON pv.id = oi.product_variant_id";
	
	$where ="WHERE 1";
	$params = [];
	$sqlQueryd = $general_cls_call->select_query($fields, $tables, $where, $params, 2);
	$totArr = [];
	if($sqlQueryd[0] != '')
	{
		foreach($sqlQueryd as $arr)
		{
			if($arr->type == 'loose') {
				$unit = $general_cls_call->select_query("name, conversion", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
				$loose_stock_quantity = ($arr->quantity * $arr->measurement) / $unit->conversion;
				
				$setValues="loose_stock_quantity=:loose_stock_quantity";
				$updateExecute=array(
					':loose_stock_quantity'	=> $loose_stock_quantity,
					':id'			=> $arr->id
				);
				$whereClause=" WHERE id=:id";
				$general_cls_call->update_query(POS_ORDERS_ITEMS, $setValues, $whereClause, $updateExecute);
				
				$totArr['POS_ORDERS_ITEMS'] = [
					'id' => $arr->id,
					'loose_stock_quantity' => $loose_stock_quantity,
					'unitname' => $unit->name,
					'type' => $arr->type
				];
			}
		}
	}
	
	echo '<pre>'; print_r($totArr); echo '</pre>'; die;

?>