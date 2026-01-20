<?php 
//error_reporting(0);
    include_once 'init.php';
    @session_start();
    $action = $_POST['action'];

    switch($action)
    {
		case "deleteRecord":
			$where=" WHERE id=:id";
			$data_array = [
				':id' => $_POST['id']
			];
			$update = $general_cls_call->delete_query($_POST['table'], $where, $data_array);
			if($update) {
				echo 1;
			}
		break;
		case "deleteRecordTwoTable":
			$setValues="isDeleted=:isDeleted";
			$updateExecute=array(':isDeleted'=>1);
			$whereClause=" WHERE id=".$_POST['id'];
			$update = $general_cls_call->update_query($_POST['table1'], $setValues, $whereClause, $updateExecute);
			if($update){
				if($_POST['table1']=='table1_name_static'){
					$table_name = 1;
				}if($_POST['table1']=='table2_name_static'){
					$table_name = 2;
				}
				$whereClause1=" WHERE table_id=".$_POST['id']." AND table_name=".$table_name;
				$general_cls_call->update_query($_POST['table2'], $setValues, $whereClause1, $updateExecute);
			}
			if($update) {
				echo 1;
			}
		break;
		
		case "productbarcord":
			$barcode = $_POST['barcode'];
			$fields = "pr.id, pr.product_id, pr.product_variant_id, pr.status, SUM(pr.stock) as total_stock, pr.selling_price, u.name as stock_unit_name, pv.measurement, p.name, p.image, p.barcode";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
						$where = "WHERE pr.status=:status AND pr.seller_id =:seller_id AND p.barcode = :barcode GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
						$params = [
							':status'	=>	1,
							':seller_id'	=>	$_SESSION['USER_ID'],
							':barcode'	=>	$barcode
						];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
			/*$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, pv.stock_unit_id ,p.name, p.image, p.barcode, u.name as unit_name";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
						INNER JOIN " . PRODUCT_STOCK_TRANSACTION . " pst ON pst.product_id = pv.product_id AND pst.product_variant_id = pv.id AND pst.status=1";
						$where = "WHERE p.barcode = '".$barcode."' ORDER BY p.name";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);*/
			//echo "<pre>";print_r($sqlQuery);die;
			$productArr = [];

			foreach ($sqlQuery as $val) {
				$imagePath = MAIN_SERVER_PATH . $val->image;
				if (!empty($val->image) && file_exists($imagePath)) {
					$imagePath = MAIN_SERVER_PATH . $val->image;
				} else {
					$imagePath = IMG_PATH . 'noImg.jpg';
				}
				
				// get unit 
				//$stock_unit_id = $general_cls_call->select_query("*", UNITS, "WHERE id=:id", array(':id'=>$val->stock_unit_id), 1);
				
				$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id AND seller_id=:seller_id", array(':product_variant_id'=> $val->product_variant_id, 'status'=>1, 'product_id'=> $val->product_id, 'seller_id'=> $_SESSION['USER_ID']), 'stock');
				
				if($stock_used->total > 0)
				{
					$productArr[] = [
						'id'               => $val->product_variant_id,
						'discounted_price' => $val->selling_price,
						'name'             => $general_cls_call->cart_product_name($val->name),
						'imagePath'        => $imagePath,
						'barcode'          => $val->barcode,
						'measurement'      => $val->measurement,
						'product_id'       => $val->product_id,
						'stock'            => $val->total_stock,
						'image'            => $val->image,
						'stock_unit_id'    => $val->stock_unit_name,
					];
				}
			}
			//echo "<pre>";print_r($productArr);die;
			echo json_encode($productArr);
		break;
		
		case "userdetails":
		
			$mobile = $_POST['phone'];
			$user_details = $general_cls_call->select_query("id, name, country_code, mobile", USERS, "WHERE mobile=:mobile", array(':mobile'=>$mobile), 1);
			//echo "<pre>";print_r($user_details);die;
			$userArray = [];
			if(!empty($user_details))
			{
				$userArray[] = [
					'id' => $user_details->id,
					'name' => $user_details->name,
					'mobile' => $user_details->mobile,
				];
			}
			echo json_encode($userArray);
			
		break;
		
		case "paynow":
			//echo "<pre>";print_r($_POST);die;
			$stockArr =[];
			$barcode = '';
			if(isset($_POST['id']) && isset($_POST['barcode']))
			{
				$pv_id = $_POST['id'];
				$barcode = $_POST['barcode'];
				$product_variant_id = array(0=>$pv_id);
			}
			else{
				$product_variant_id = $_POST['product_variant_id'];
			}
			//echo "<pre>";print_r($product_variant_id);die;
			/*$fields = "pv.id";
			$tables = PRODUCT_VARIANTS . " pv INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id";
			$where = "WHERE p.barcode = '".$barcode."' ORDER BY p.name";
			$params = [];
			$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
			echo "<pre>";print_r($sqlQuery);die;*/
			
			foreach($product_variant_id as $k=>$val)
			{
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id", array(':id'=> $val), 1);
				
				// check from product_stock_transaction 
				$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id AND seller_id=:seller_id", array(':product_variant_id'=> $val, 'status'=>1, 'product_id'=> $product_variant_dtls->product_id, 'seller_id'=> $_SESSION['USER_ID']), 'stock');
				//echo $stock_used->price; die;
				$remainingStock = $stock_used->total;
				//echo $remainingStock; die;
				//if($remainingStock <= 0)
				// if only barcode send check stock
				if($barcode == 1)
				{
					//echo 'stock->'.$remainingStock;die;
					if($remainingStock > 0 || $remainingStock == '')
					{
						$product_dtls = $general_cls_call->select_query("*", PRODUCTS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->product_id), 1);
						$product_name = $general_cls_call->cart_product_name($product_dtls->name);
						
						$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->stock_unit_id), 1);
						$unitname = $unit_dtls->name;
						
						$p_variant_name = $product_variant_dtls->measurement.' '.$unitname;
						
						$available_stock = $stock_used->total;
						
						$stockArr[] = [
							"product_name" => $product_name,
							"variant_name" => $p_variant_name,
							"variant_stock" => $stock_used->total == null ? 0 : $stock_used->total,
						];
					}
				}
					
				// after cart add check stock
				if($barcode == '')
				{
					if($remainingStock < $_POST['qty'][$k])
					{
						$product_dtls = $general_cls_call->select_query("*", PRODUCTS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->product_id), 1);
						$product_name = $general_cls_call->cart_product_name($product_dtls->name);
						
						$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->stock_unit_id), 1);
						$unitname = $unit_dtls->name;
						
						$p_variant_name = $product_variant_dtls->measurement.' '.$unitname;
						
						$available_stock = $stock_used->total;
						
						$stockArr[] = [
							"product_name" => $product_name,
							"variant_name" => $p_variant_name,
							"variant_stock" => $stock_used->total == null ? 0 : $stock_used->total,
						];
						
					}
				}
				
			}
			
			//echo "<pre>";print_r($stockArr);die;
			echo json_encode($stockArr);
		break;
		
		case "paynowsave":
			 
			//echo "<pre>";print_r($_POST);die;
			$sellers_details = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id=:admin_id", array(':admin_id'=>$_SESSION['USER_ID']), 1);
			$store_id = $sellers_details->admin_id;
			
			$field = "pos_user_id, user_id, store_id, total_amount, discount_amount, discount_percentage, payment_method, created_at, updated_at";
			$value = ":pos_user_id, :user_id, :store_id, :total_amount, :discount_amount, :discount_percentage, :payment_method, :created_at, :updated_at";
			
			$addExecute=array(
				':pos_user_id'			=> $_SESSION['USER_ID'],
				':user_id'				=> $_POST['user_hidden_id'],
				':store_id'				=> $general_cls_call->specialhtmlremover($store_id),
				':total_amount'			=> $_POST['cart_total_amt'],
				':discount_amount'			=> '0.00',
				':discount_percentage'		=> '0.00',
				':payment_method'		=> $_POST['payment_method'],
				':created_at'			=> date("Y-m-d H:i:s"),
				':updated_at'			=> date("Y-m-d H:i:s")
			);
			
			$last_insert_id = $general_cls_call->insert_query(POS_ORDERS, $field, $value, $addExecute);
			//echo $last_insert_id; die;
			foreach($_POST['product_variant_id'] as $k=>$val) {
				
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $val), 1);
				//echo "<pre>";print_r($product_variant_dtls);die;
				$product_id = $product_variant_dtls->product_id;
				
				$unit_price = $product_variant_dtls->discounted_price;
				$total_price = $_POST['qty'][$k] * $unit_price;
				
				$field = "pos_order_id, product_id, product_variant_id, quantity, unit_price, total_price, created_at, updated_at";
				$value = ":pos_order_id, :product_id, :product_variant_id, :quantity, :unit_price, :total_price, :created_at, :updated_at";
				
				
				$addExecute=array(
					':pos_order_id'			=> $general_cls_call->specialhtmlremover($last_insert_id),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':quantity'				=> $_POST['qty'][$k],
					':unit_price'			=> $general_cls_call->specialhtmlremover($unit_price),
					':total_price'			=> $general_cls_call->specialhtmlremover($total_price),
					':created_at'			=> date("Y-m-d H:i:s"),
					':updated_at'			=> date("Y-m-d H:i:s")
				);
				$general_cls_call->insert_query(POS_ORDERS_ITEMS, $field, $value, $addExecute);
			}
			
			// insert into product_stock_transaction
			if($last_insert_id)
			{
				foreach($_POST['product_variant_id'] as $k=>$val) {
					
					$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $val), 1);
					//echo "<pre>";print_r($product_variant_dtls);die;
					$product_id = $product_variant_dtls->product_id;
					//echo $val.'-> '.$product_id; die;
					$unit_price = $product_variant_dtls->discounted_price;
					$total_price = $_POST['qty'][$k] * $unit_price;
					
					$field = "seller_id, product_variant_id, product_id,  stock, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id, approved_by, approved_date, order_id";
					$value = ":seller_id, :product_variant_id, :product_id, :stock, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id";
					
					//parent_id
					$addExecute=array(
						':seller_id'			=> $_SESSION['USER_ID'],
						':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
						':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
						
						':stock'				=> -($_POST['qty'][$k]),
						':created_date'			=> date("Y-m-d H:i:s"),
						':status'				=> 1,
						':selling_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->discounted_price),
						':purchase_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->price),
						':transaction_type'		=> 2,
						':received_selled_id'	=> 0,
						':parent_id'	=> 0,
						':approved_by'			=> 0,
						':approved_date' 		=> '0000-00-00 00:00:00',
						':order_id'		       => $general_cls_call->specialhtmlremover($last_insert_id),
					);
					$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
				}
			}
				
		echo json_encode($last_insert_id);
			
		break;
		
		case "checkStockTransferItem":
			//echo "<pre>";print_r($_POST);die;
			$stockArr =[];
			foreach($_POST['product_variant_id'] as $k=>$val)
			{
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id", array(':id'=> $val), 1);
				
				// check from product_stock_transaction 
				$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id AND seller_id=:seller_id", array(':product_variant_id'=> $val, 'status'=>1, 'product_id'=> $product_variant_dtls->product_id, 'seller_id'=> $_SESSION['USER_ID']), 'stock');
				//echo $stock_used->price; die;
				$remainingStock = $stock_used->total;
				//echo $remainingStock; die;
				//if($remainingStock <= 0)
				if($remainingStock < $_POST['qty'][$k])
				{
					$product_dtls = $general_cls_call->select_query("*", PRODUCTS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->product_id), 1);
					$product_name = $general_cls_call->cart_product_name($product_dtls->name);
					
					$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->stock_unit_id), 1);
					$unitname = $unit_dtls->name;
					
					$p_variant_name = $product_variant_dtls->measurement.' '.$unitname;
					
					$available_stock = $stock_used->total;
					/*if($available_stock == 0)
					{
						$variant_stock = 'Out of stock';
					}
					else{
						$variant_stock = $available_stock;
					}*/
					
					
					$stockArr[] = [
						"product_name" => $product_name,
						"variant_name" => $p_variant_name,
						"variant_stock" => $stock_used->total,
					];
					
				}
				
			}
			
			//echo "<pre>";print_r($stockArr);die;
			echo json_encode($stockArr);
		break;
		
		case "stockTransferSave":
			
			
			// insert into product_stock_transaction
		if(!empty($_POST['product_variant_id']))
		{
			foreach($_POST['product_variant_id'] as $k=>$val) {
					
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $val), 1);
				//echo "<pre>";print_r($product_variant_dtls);die;
				$product_id = $product_variant_dtls->product_id;
				//echo $val.'-> '.$product_id; die;
				$unit_price = $product_variant_dtls->discounted_price;
				$total_price = $_POST['qty'][$k] * $unit_price;
				
				$field = "seller_id, product_variant_id, product_id,  stock, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id,approved_by, approved_date, order_id";
				$value = ":seller_id, :product_variant_id, :product_id, :stock, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id";
				
				
				$addExecute=array(
					':seller_id'			=> $_SESSION['USER_ID'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					
					':stock'				=> -($_POST['qty'][$k]),
					':created_date'			=> date("Y-m-d H:i:s"),
					':status'				=> 1,
					':selling_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->discounted_price),
					':purchase_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->price),
					':transaction_type'		=> 4,
					':received_selled_id'	=> $_POST['hid_seller_id'],
					':parent_id'			=> 0,
					':approved_by'			=> 0,
					':approved_date' 		=> '0000-00-00 00:00:00',
					':order_id'		       => 0,
				);
				
				$last_insert_id = $general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
				
				//$product_transaction_detls = $general_cls_call->select_query("*", PRODUCT_STOCK_TRANSACTION, "WHERE id =:id ", array(':id'=> $last_insert_id), 1);
				$addExecute=array(
					':seller_id'			=> $_POST['hid_seller_id'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					
					':stock'				=> ($_POST['qty'][$k]),
					':created_date'			=> date("Y-m-d H:i:s"),
					':status'				=> 1,
					':selling_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->discounted_price),
					':purchase_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->price),
					':transaction_type'		=> 4,
					':received_selled_id'	=> 0,
					':parent_id'			=> $last_insert_id,
					':approved_by'			=> 0,
					':approved_date' 		=> '0000-00-00 00:00:00',
					':order_id'		       => 0,
				);
				
				$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
			}
		}
		$status = 1;
		echo json_encode($status);
		break;
		
		case "productprint":
				$barcode = $_POST['barcode'];
				$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, pv.stock_unit_id ,p.name, p.image, p.barcode";
				$tables = PRODUCT_VARIANTS . " pv INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id"; $where = "WHERE p.barcode = '".$barcode."' ORDER BY p.name";
				$params = [];
				$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 1);
				//echo "<pre>";print_r($sqlQuery);die;
				
				$stock_unit_data = $general_cls_call->select_query("*", UNITS, "WHERE id=:id", array(':id'=>$sqlQuery->stock_unit_id), 1);
				
				//echo "<pre>";print_r($stock_unit_data);die;
				$measurement = $sqlQuery->measurement;
				$unitname = $stock_unit_data->name;
				
				$stockArr = [
						"measurement" => $measurement,
						"unitname" => $unitname,
					];
				echo json_encode($stockArr);
		break;
    }
?>