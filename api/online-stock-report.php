<?PHP 
	//error_reporting(0);
	include_once '../init.php';
	
	extract($_POST);
	
	//echo $seller_id; die;
	$seller_details = $general_cls_call->select_query("admin_id", SELLERS, "WHERE id=:id", array(':id'=>$seller_id), 1);
	if(!empty($seller_details))
	{
		$fields = "pr.id, pr.product_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode ,pv.id as product_variant_id, p.id as p_id";
		$tables = PRODUCT_STOCK_TRANSACTION . " pr
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
		$where = "WHERE pr.stock_type=2 AND pr.status=1 AND pr.seller_id ='" .$seller_details->admin_id. "' GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
		$params = [];
		$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
		//echo "<pre>"; print_r($sqlQuery);die;
		if(!empty($sqlQuery))
		{
			foreach($sqlQuery as $k=>$arr)
			{	
					$whereOrdItm = "WHERE product_variant_id=:product_variant_id AND active_status!=:active_status AND seller_id=:seller_id";
					$paramsOrdItm = [
						':product_variant_id' => $arr->product_variant_id,
						':seller_id' => $seller_id,
						'active_status' => 7
					];
				  
					$qty_used = $general_cls_call->select_query_sum( ORDERS_ITEMS, $whereOrdItm, $paramsOrdItm, 'quantity');
				 
					$qty_used = !empty($qty_used->total) ? $qty_used->total : 0;
					$result['data'][] =
						[ 
							'product_id' => $arr->p_id,
							'product_variant_id' => $arr->product_variant_id,
							'stock' => $arr->total_stock - $qty_used
						];
								  
			}
			$result['status'] = 200;
		}
		else{
			$result['status'] = 400;
			$result['msg'] = 'Stock not available';
		}
	}
	else{
		$result['status'] = 400;
		$result['msg'] = 'Seller not found';
	}
	echo json_encode($result);
	
	exit;

?>