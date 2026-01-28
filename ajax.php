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
			$where = "WHERE pr.stock_type=:stock_type AND pr.status=:status AND pr.seller_id =:seller_id AND p.barcode = :barcode GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
			$params = [
				':status'	=>	1,
				':stock_type'	=>	1,
				':seller_id'	=>	$_SESSION['USER_ID'],
				':barcode'	=>	$barcode
			];
			$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
			
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
					$barcode = $val->barcode;
					$barcode = !empty($barcode) ?  '(' . $barcode .') ' : '';
								
					$productArr[] = [
						'id'               => $val->product_variant_id,
						'discounted_price' => $val->selling_price,
						'name'             => $general_cls_call->cart_product_name($val->name),
						'imagePath'        => $imagePath,
						'barcode'          => $barcode,
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
			
			foreach($product_variant_id as $k=>$val)
			{
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id", array(':id'=> $val), 1);
				
				// check from product_stock_transaction 
				$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id AND seller_id=:seller_id AND stock_type=:stock_type", array(':product_variant_id'=> $val, 'status'=>1, 'product_id'=> $product_variant_dtls->product_id, 'seller_id'=> $_SESSION['USER_ID'], 'stock_type'=>1), 'stock');
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
				$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id AND seller_id=:seller_id AND stock_type=:stock_type", array(':product_variant_id'=> $val, 'status'=>1, 'product_id'=> $product_variant_dtls->product_id, 'seller_id'=> $_SESSION['USER_ID'], 'stock_type'=>1), 'stock');
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
		
		case "onlineProductStock":
				//$pv_id = $_POST['pvid'];
				$pid = $_POST['pid'];
				$stockArr = [];
				
				$fld = "distinct(product_variant_id)";
				$wh = "WHERE product_id=:product_id AND status=:status AND seller_id =:seller_id GROUP BY product_variant_id HAVING SUM(stock) > 0";
				$para = [
					':product_id' => $pid,
					':seller_id' => $_SESSION['USER_ID'],
					':status' => 1
				];
				
				$product_variant_id = $general_cls_call->select_join_query($fld, PRODUCT_STOCK_TRANSACTION, $wh, $para, 2);
				
				//echo "<pre>";print_r($product_variant_id);die;
				//-------------------------------------------
				
				//$product_variant_id = array(0=>$pv_id);
				foreach($product_variant_id as $k=>$val)
				{
					$Where = "WHERE id=:id AND product_id=:product_id";
					$params = [
						':id'	=>	$val->product_variant_id,
						':product_id'	=>	$pid
					];
					$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, $Where, $params, 1);
					//echo "<pre>";print_r($product_variant_dtls);die;
					
					$where = "WHERE product_variant_id=:product_variant_id AND product_id=:product_id AND status=:status AND stock_type=:stock_type AND seller_id=:seller_id";
					
					$params = [
						':product_variant_id'	=>	$val->product_variant_id,
						':product_id'	=>	$product_variant_dtls->product_id,
						':status'	=>	1,
						':stock_type'	=>	1,
						':seller_id'	=>	$_SESSION['USER_ID']
					];
					// check from product_stock_transaction 
					$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $where, $params, 'stock');
					
					// after cart add check stock
					
					$product_dtls = $general_cls_call->select_query("*", PRODUCTS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->product_id), 1);
					$product_name = $general_cls_call->cart_product_name($product_dtls->name);
					
					$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->stock_unit_id), 1);
					$unitname = $unit_dtls->name;
					
					$p_variant_name = $product_variant_dtls->measurement.' '.$unitname;
					
					$available_stock = $stock_used->total;
					
					$stockArr[] = [
						"product_name" => $product_name,
						"product_variant_id" => $val->product_variant_id,
						"variant_name" => $p_variant_name,
						"variant_stock" => $stock_used->total == null ? 0 : $stock_used->total,
					];
				}
				echo json_encode($stockArr);
		break;
		case "getProductVariant";
			 
			$fields = "pv.id, pv.measurement, u.name as unit_name";
			$tables = PRODUCT_VARIANTS . " pv
			INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
			
			$where ="WHERE pv.product_id=:product_id";
			$params = [
				':product_id' => $_POST['pid']
			];
			$sqlQuery = $general_cls_call->select_query($fields, $tables, $where, $params, 2);
			$varianrArr = [];
			if($sqlQuery[0] != '')
			{
				foreach($sqlQuery as $arr)
				{
					$varianrArr[] = [
						'id' => $arr->id,
						'measurement' => $arr->measurement,
						'unitname' => $arr->unit_name
					];
				}
			}
			echo json_encode($varianrArr); 
		break;
		case "operatorList":			
			$fields = "po.id, po.name, po.mobile";
			$tables = PACKAGING_OPERATORS . " po
			INNER JOIN " . ADMIN_MASTER . " a ON a.id = po.admin_id
			LEFT JOIN " . PACKAGING_OPERATORS_ASSIGN . " poa ON poa.packaging_operator_id = po.id";
			$where = "WHERE po.status = :status
			AND a.created_by = :created_by
			AND a.role_id = :role_id
			AND (poa.status IS NULL OR poa.status != :poastatus)";
			$params = [
			  ':status'      => 1,
			  ':role_id'     => 5,
			  ':poastatus'   => 3,
			  ':created_by'  => $_SESSION['USER_ID']
			];
			$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);		
			
			if (!empty($sqlQuery)) {
				$data['status'] = 200;
				$rec = [];
				foreach($sqlQuery as $arr)
				{	
					$rec[] = [
						'id' => $arr->id,
						'name' => $arr->name
					];
				}
				$data['rec'] = $rec;
			} else {
				$data['status'] = 400;
				$data['msg'] = '<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
					<div class="text-white"><strong>Error!</strong> No operator found.</div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>';
			} 	
			echo json_encode($data);
			exit;
		break;
		
		case "assign_operator_save":
			extract($_POST);
			
			$check_exists = $general_cls_call->select_query("id, status", PACKAGING_OPERATORS_ASSIGN, "WHERE order_id =:order_id", array(':order_id'=> $order_id), 1);
			if(!empty($check_exists)) {
				$data['status'] = 200;
				$data['msg'] = '<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
					<div class="text-white"><strong>Error!</strong> Operator already assigned to this order.</div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>';
			} else {
				$field = "order_id, packaging_operator_id, assign_by, status, created_at, updated_at";
				$value = ":order_id, :packaging_operator_id, :assign_by, :status, :created_at, :updated_at";
				
				$addExecute=array(
					':order_id'					=> $order_id,
					':packaging_operator_id'	=> $packaging_operator_id,
					':assign_by'				=> $_SESSION['USER_ID'],
					':status'					=> 3,
					':created_at'				=> date("Y-m-d H:i:s"),
					':updated_at'				=> date("Y-m-d H:i:s")
				);
				
				$ok = $general_cls_call->insert_query(PACKAGING_OPERATORS_ASSIGN, $field, $value, $addExecute);
				if($ok) {
					//insert order statuses
					$field = "order_id, status, created_by, user_type, created_at";
					$value = ":order_id, :status, :created_by, :user_type, :created_at";
					$addExecute=array(
						':order_id'				=> $order_id,
						':status'				=> 3,
						':created_by'			=> $_SESSION['USER_ID'],
						':user_type'			=> $_SESSION['ROLE_ID'],
						':created_at'			=> date("Y-m-d H:i:s")
					);
					$general_cls_call->insert_query(ORDERS_STATUSES, $field, $value, $addExecute);
					//update orders
					$setValues="active_status=:active_status";
					$updateExecute=array(
						':active_status'	=> 3,
						':order_id'			=> $order_id
					);
					$whereClause=" WHERE id = :order_id";
					$general_cls_call->update_query(ORDERS, $setValues, $whereClause, $updateExecute);
					//update orders items
					$setValues="active_status=:active_status";
					$updateExecute=array(
						':active_status'	=> 3,
						':order_id'			=> $order_id
					);
					$whereClause=" WHERE order_id = :order_id";
					$general_cls_call->update_query(ORDERS_ITEMS, $setValues, $whereClause, $updateExecute);
				
					$data['status'] = 200;
					$data['msg'] = '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
						<div class="text-white"><strong>Success!</strong> Operator assigned successfully.</div>
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>';
				} else {
					$data['status'] = 400;
					$data['msg'] = '<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
						<div class="text-white"><strong>Error!</strong> Something went wrong.</div>
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>';
				}
			}
			echo json_encode($data);
			exit;
		break;
		
		case "orderStatusList":			
			$fields = "id, status";
			$tables = ORDERS_STATUS_LISTS;
			$where = "WHERE id=:id";
			$params = [':id'=>5];
			$sqlQuery = $general_cls_call->select_query($fields, $tables, $where, $params, 2);		
			
			if (!empty($sqlQuery)) {
				$data['status'] = 200;
				$rec = [];
				foreach($sqlQuery as $arr)
				{	
					$rec[] = [
						'id' => $arr->id,
						'name' => $arr->status
					];
				}
				$data['rec'] = $rec;
			} else {
				$data['status'] = 400;
				$data['msg'] = '<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
					<div class="text-white"><strong>Error!</strong> No status found.</div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>';
			} 	
			echo json_encode($data);
			exit;
		break;
		
		case "order_status_change_save":
			extract($_POST);
			
				//update PACKAGING OPERATORS ASSIGN
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
					':created_by'			=> $_SESSION['USER_ID'],
					':user_type'			=> $_SESSION['ROLE_ID'],
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
				$data['msg'] = '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
					<div class="text-white"><strong>Success!</strong> Order status changed successfully.</div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>';
				
		
			echo json_encode($data);
			
		break;
		
		case "packaging_operator_order_status":
			extract($_POST);
			$dataArray = $general_cls_call->callAPI("POST", SITE_URL."api/packaging-operator-orders-save", ["status"=>$order_status_id, 'order_id'=>$order_id, 'role_id'=>$_SESSION['ROLE_ID']], $_SESSION['API_TOKEN']);
			//echo $data['msg'];
			//echo "<pre>";print_r($dataArray);die;
			if($dataArray['status'] == 200)
			{
				$data['status'] = $dataArray['status'];
				$data['msg'] = '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
					<div class="text-white"><strong>Success!</strong> '. $dataArray['msg'].'</div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>';
			}
			echo json_encode($data);
			
		break;
		case "onlineCheckVariant":
				$pv_id = $_POST['pvid'];
				$pid = $_POST['pid'];
				$stockArr = [];
				
				$product_variant_id = array(0=>$pv_id);
				foreach($product_variant_id as $k=>$val)
				{
					$Where = "WHERE id=:id AND product_id=:product_id";
					$params = [
						':id'	=>	$val,
						':product_id'	=>	$pid
					];
					$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, $Where, $params, 1);
					//echo "<pre>";print_r($product_variant_dtls);die;
					
					$where = "WHERE product_variant_id=:product_variant_id AND product_id=:product_id AND status=:status AND stock_type=:stock_type AND seller_id=:seller_id";
					
					$params = [
						':product_variant_id'	=>	$val,
						':product_id'	=>	$product_variant_dtls->product_id,
						':status'	=>	1,
						':stock_type'	=>	1,
						':seller_id'	=>	$_SESSION['USER_ID']
					];
					// check from product_stock_transaction 
					$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $where, $params, 'stock');
					
					// after cart add check stock
					
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
				echo json_encode($stockArr);
		break;
    }
?>