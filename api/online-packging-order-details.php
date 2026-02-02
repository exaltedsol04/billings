<?php
	include_once '../init.php';
	
	extract($_POST);
	
	//$order_id = 165;
	
	
	$where = "WHERE o.id=:id GROUP BY oi.order_id";
	
	$params = [
		':id' => $order_id
	];
	
	$fields = "o.id, o.final_total as order_total, o.address, o.mobile, o.packing_charge, o.created_at, o.active_status, o.order_type, s.name as seller_name, s.store_name, s.email AS seller_email, s.mobile AS seller_mobile, s.street AS seller_address, u.id AS customer_id, u.name AS customer_name, u.email AS customer_email, db.name AS delivery_boy_name, db.mobile AS delivery_boy_mobile, db.address AS delivery_boy_address, osl.status AS orders_status_list_status";
	
	$tables = ORDERS . " o
	INNER JOIN " . ORDERS_ITEMS . " oi ON oi.order_id = o.id
	INNER JOIN " . SELLERS . " s ON s.id = oi.seller_id
	INNER JOIN " . ORDERS_STATUS_LISTS . " osl ON osl.id = o.active_status
	LEFT JOIN " . USERS . " u ON u.id = o.user_id
	LEFT JOIN " . DELIVERY_BOYS . " db ON db.id = o.delivery_boy_id";
	
	$orderArr = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
	if(!empty($orderArr))
	{
		$orderData = $orderArr[0];
		
		$order = [
			'order_id'				=> $orderData->id,
			'mobile'				=> $orderData->mobile,
			'order_status'			=> $orderData->orders_status_list_status,
			'packing_charge'		=> $orderData->packing_charge,
			'order_date'			=> $general_cls_call->change_date_format($orderData->created_at, 'j M Y g:i A'),
			'customer_id'			=> $orderData->customer_id,
			'customer_name'			=> $orderData->customer_name,
			'customer_email'		=> $orderData->customer_email,
			'shipping_address'		=> $orderData->address,
			'seller_name'			=> $orderData->seller_name,
			'seller_email'			=> $orderData->seller_email,
			'seller_mobile'			=> $orderData->seller_mobile,
			'seller_address'		=> $orderData->seller_address,
			'delivery_boy_name'		=> $orderData->delivery_boy_name,
			'delivery_boy_address'	=> $orderData->delivery_boy_address
		];

		$whereOitems = "WHERE order_id=:order_id";
		$paramsOitems = [
			':order_id' => $order_id
		];
		$sqlQuery = $general_cls_call->select_query("*", ORDERS_ITEMS, $whereOitems, $paramsOitems, 2);	
		$items = [];
		if($sqlQuery[0] != '')
		{
			$subtotal = 0;
			foreach($sqlQuery as $k=>$arr)
			{
				
				$items[] = [
					'product_name'	=> $general_cls_call->cart_product_name($arr->product_name),
					'variant_name'	=> $arr->variant_name,
					'quantity'		=> $arr->quantity,
					'price'			=> $arr->discounted_price,
					'total_price'	=> $arr->quantity * $arr->discounted_price,
				];
				$subtotal = $subtotal + $arr->quantity * $arr->discounted_price;
			}					
		}
		$order['subtotal'] = $subtotal;
		$order['items'] = $items;
		//echo '<pre>'; print_r($order); echo '</pre>'; die;
		echo json_encode([
			"status" => 200,
			"data" => $order
		]);
	}		
	else
	{
		echo json_encode([
			"status" => 400,
			"msg" => 'Order not found.'
		]);
	}
	exit;
?>