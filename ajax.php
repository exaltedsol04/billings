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
			$fields = "pr.id, pr.product_id, pr.product_variant_id, pr.status, SUM(pr.stock) as total_stock, pr.selling_price, u.name as stock_unit_name, pv.measurement, pv.type, p.name, p.image, p.barcode";
			$tables = PRODUCT_STOCK_TRANSACTION . " pr
			INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
			INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
			INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
			$where = "WHERE pr.stock_type=:stock_type AND pr.status=:status AND pr.seller_id =:seller_id AND p.barcode = :barcode GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
			$params = [
				':status'	=>	1,
				':stock_type'	=>	1,
				':seller_id'	=>	$_SESSION['SELLER_ID'],
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
				
				$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id AND seller_id=:seller_id", array(':product_variant_id'=> $val->product_variant_id, 'status'=>1, 'product_id'=> $val->product_id, 'seller_id'=> $_SESSION['SELLER_ID']), 'stock');
				
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
						'product_type'    	=> $val->type,
						'product_id'    	=> $val->product_id,
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

			$stockArr = [];
			$barcode  = '';
			$pid      = [];
			$total_stock       = '';
			$isBulkCheck = !isset($_POST['id']); // bulk = cart validation

			if (isset($_POST['id']) && isset($_POST['barcode'])) {
				$pv_id = $_POST['id'];
				$barcode = $_POST['barcode'];
				$rw = (float)($_POST['rw'] ?? 0);
				$product_variant_id = [0 => $pv_id];
			} else {
				$product_variant_id = $_POST['product_variant_id'] ?? [];
				$pid = $_POST['pid'] ?? [];
			}


			/*
			=====================================================
			STEP 1 → COLLECT VARIANT DATA
			=====================================================
			*/
			$variant_rows = [];

			foreach ($product_variant_id as $k => $variant_id)
			{
				$qty = (float)($_POST['qty'][$k] ?? 1);
				if ($qty <= 0) continue;

				$variant = $general_cls_call->select_query(
					"*",
					PRODUCT_VARIANTS,
					"WHERE id = :id",
					[':id' => $variant_id],
					1
				);

				if (!$variant) continue;

				$variant_rows[] = [
					'variant'    => $variant,
					'product_id' => $variant->product_id,
					'qty'        => $qty
				];
			}


			/*
			=====================================================
			STEP 2 → TOTAL LOOSE WEIGHT PER PRODUCT (FIXED)
			=====================================================
			*/
			$requested_loose_weight = [];

			/*
			-----------------------------------------
			PRIORITY 1 → grouped cart weights (pid[])
			-----------------------------------------
			*/
			if (!empty($pid)) {
				foreach ($pid as $product_id => $weights) {
					$requested_loose_weight[$product_id] =
						array_sum(array_map('floatval', (array)$weights));
				}
			}

			/*
			-----------------------------------------
			PRIORITY 2 → barcode weight (single scan)
			-----------------------------------------
			*/
			elseif (!empty($rw)) {

				foreach ($variant_rows as $row) {
					$variant = $row['variant'];
					if ($variant->type == 'loose') {
						$requested_loose_weight[$variant->product_id] = (float)$rw;
					}
				}
			}

			/*
			-----------------------------------------
			PRIORITY 3 → calculate from variant qty
			-----------------------------------------
			*/
			else {

				foreach ($variant_rows as $row) {

					$variant    = $row['variant'];
					$product_id = $row['product_id'];
					$qty        = $row['qty'];

					if ($variant->type != 'loose') continue;

					$requested_loose_weight[$product_id] =
						($requested_loose_weight[$product_id] ?? 0)
						+ ((float)$variant->measurement * $qty);
				}
			}



			/*
			=====================================================
			STEP 3 → TOTAL NORMAL QTY PER VARIANT
			=====================================================
			*/
			$requested_normal_qty = [];

			foreach ($variant_rows as $row)
			{
				$variant = $row['variant'];
				if ($variant->type == 'loose') continue;

				$vid = $variant->id;
				$requested_normal_qty[$vid] =
					($requested_normal_qty[$vid] ?? 0) + $row['qty'];
			}


			/*
			=====================================================
			STEP 4 → GET TOTAL LOOSE STOCK FROM DB
			=====================================================
			*/
			$total_loose_stock = [];

			foreach ($requested_loose_weight as $product_id => $dummy)
			{
				$stock = $general_cls_call->select_query_sum(
					PRODUCT_STOCK_TRANSACTION,
					"WHERE product_id = :product_id
					 AND status = :status
					 AND seller_id = :seller_id
					 AND stock_type = :stock_type",
					[
						'status'     => 1,
						'product_id' => $product_id,
						'seller_id'  => $_SESSION['SELLER_ID'],
						'stock_type' => 1
					],
					'loose_stock_quantity'
				);

				$total_loose_stock[$product_id] = (float)($stock->total ?? 0);
			}


			/*
			=====================================================
			STEP 5 → VALIDATE EACH VARIANT
			=====================================================
			*/
			foreach ($variant_rows as $row)
			{
				$variant    = $row['variant'];
				$product_id = $row['product_id'];
				$qty        = $row['qty'];

				$remainingStock = 0;

				/*
				===============================
				LOOSE PRODUCT VALIDATION
				===============================
				*/
				if ($variant->type == 'loose')
				{
					$variant_size = (float)$variant->measurement;
					$total_stock  = (float)($total_loose_stock[$product_id] ?? 0);
					$total_used   = (float)($requested_loose_weight[$product_id] ?? 0);

					// fully used or exceeded
					if (round($total_used,4) > round($total_stock,4))
					{
						$remainingStock = 0;
					}
					else
					{
						$current_weight   = $variant_size * $qty;
						$other_weight     = $total_used - $current_weight;
						$remaining_weight = max(0, $total_stock - $other_weight);

						$remainingStock =
							($variant_size > 0)
							? floor($remaining_weight / $variant_size)
							: 0;
					}
				}

				/*
				===============================
				NORMAL PRODUCT VALIDATION
				===============================
				*/
				else
				{
					$stock_used = $general_cls_call->select_query_sum(
						PRODUCT_STOCK_TRANSACTION,
						"WHERE product_variant_id = :product_variant_id
						 AND product_id = :product_id
						 AND status = :status
						 AND seller_id = :seller_id
						 AND stock_type = :stock_type",
						[
							':product_variant_id'=> $variant->id,
							'product_id'         => $product_id,
							'status'             => 1,
							'seller_id'          => $_SESSION['SELLER_ID'],
							'stock_type'         => 1
						],
						'stock'
					);

					$dbStock = (int)($stock_used->total ?? 0);
					$usedQty = $requested_normal_qty[$variant->id] ?? 0;

					$remainingStock = max(0, $dbStock - $usedQty);
				}


				/*
				===============================
				RESPONSE RULE
				===============================
				*/

				// bulk check → return ONLY when stock not available
				if ($isBulkCheck && $remainingStock > 0) {
					continue;
				}

				$product_dtls = $general_cls_call->select_query(
					"*",
					PRODUCTS,
					"WHERE id = :id",
					[':id'=> $product_id],
					1
				);

				$unit_dtls = $general_cls_call->select_query(
					"*",
					UNITS,
					"WHERE id = :id",
					[':id'=> $variant->stock_unit_id],
					1
				);

				$stockArr[] = [
					"product_name"  => $general_cls_call->cart_product_name($product_dtls->name),
					"variant_name"  => $variant->measurement.' '.$unit_dtls->name,
					"variant_stock" => $remainingStock,
					"product_type"  => $variant->type,
					"total_stock"  => $total_stock
				];
			}

		echo json_encode($stockArr);
		break;

		case "paynowsave":
			 
			//echo "<pre>";print_r($_POST);die;
			$sellers_details = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id=:admin_id", array(':admin_id'=>$_SESSION['USER_ID']), 1);
			//$store_id = $sellers_details->admin_id;
			
			$field = "pos_user_id, user_id, total_amount, discount_amount, discount_percentage, payment_method, created_at, updated_at";
			$value = ":pos_user_id, :user_id, :total_amount, :discount_amount, :discount_percentage, :payment_method, :created_at, :updated_at";
			
			$addExecute=array(
				':pos_user_id'			=> $_SESSION['SELLER_ID'],
				':user_id'				=> $_POST['user_hidden_id'],
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
				$loose_stock_quantity = 0.00;
				if($product_variant_dtls->type == 'loose') {
					$loose_stock_quantity = -($_POST['pid'][$product_id][$k]);
				}
				
				$field = "pos_order_id, product_id, product_variant_id, type, loose_stock_quantity, quantity, unit_price, total_price, created_at, updated_at";
				$value = ":pos_order_id, :product_id, :product_variant_id, :type, :loose_stock_quantity, :quantity, :unit_price, :total_price, :created_at, :updated_at";
				
				
				$addExecute=array(
					':pos_order_id'			=> $general_cls_call->specialhtmlremover($last_insert_id),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':type'					=> $product_variant_dtls->type,
					':loose_stock_quantity'	=> $general_cls_call->specialhtmlremover($loose_stock_quantity),
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
					$loose_stock_quantity = 0.00;
					if($product_variant_dtls->type == 'loose') {
						$loose_stock_quantity = -($_POST['pid'][$product_id][$k]);
					}
					
					$field = "seller_id, product_variant_id, product_id, stock, loose_stock_quantity, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id, approved_by, approved_date, order_id";
					$value = ":seller_id, :product_variant_id, :product_id, :stock, :loose_stock_quantity, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id";
					
					//parent_id
					$addExecute=array(
						':seller_id'			=> $_SESSION['SELLER_ID'],
						':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
						':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
						':stock'				=> -($_POST['qty'][$k]),
						':loose_stock_quantity'	=> $loose_stock_quantity,
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
				$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id AND seller_id=:seller_id AND stock_type=:stock_type", array(':product_variant_id'=> $val, 'status'=>1, 'product_id'=> $product_variant_dtls->product_id, 'seller_id'=> $_SESSION['SELLER_ID'], 'stock_type'=>1), 'stock');
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
					':seller_id'			=> $_SESSION['SELLER_ID'],
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
				$pvid = $_POST['product_variant_id'];
				$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, pv.stock_unit_id ,p.name, p.image, p.barcode";
				$tables = PRODUCT_VARIANTS . " pv INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id"; 
				$where = "WHERE p.barcode=:barcode AND pv.id=:id ORDER BY p.name";
				$params = [
					':barcode' => $barcode,
					':id' => $pvid
				];
				$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 1);
				//echo "<pre>";print_r($sqlQuery);die;
				
				$stock_unit_data = $general_cls_call->select_query("*", UNITS, "WHERE id=:id", array(':id'=>$sqlQuery->stock_unit_id), 1);
				
				//echo "<pre>";print_r($stock_unit_data);die;
				$measurement = $sqlQuery->measurement;
				$unitname = $stock_unit_data->name;
				
				$stockArr = [
						"measurement" => $measurement,
						"unitname" => $unitname,
						"productname" => $general_cls_call->cart_product_name($sqlQuery->name)
					];
				echo json_encode($stockArr);
		break;
		
		case "onlineProductStock":
				//$pv_id = $_POST['pvid'];
				$pid = $_POST['pid'];
				$stockArr = [];
				
				$fld = "distinct(product_variant_id)";
				$wh = "WHERE product_id=:product_id AND status=:status AND seller_id =:seller_id AND stock_type=:stock_type GROUP BY product_variant_id HAVING SUM(stock) > 0";
				$para = [
					':product_id' => $pid,
					':stock_type'	=>	1,
					':seller_id' => $_SESSION['SELLER_ID'],
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
						':seller_id'	=>	$_SESSION['SELLER_ID']
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
						"variant_name" => $p_variant_name .' ('. $product_variant_dtls->type .')',
						"variant_stock" => $stock_used->total == null ? 0 : $stock_used->total,
					];
				}
				echo json_encode($stockArr);
		break;
		case "getProductVariant";
			 
			$fields = "pv.id, pv.measurement, u.name as unit_name, pv.type";
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
						'unitname' => $arr->unit_name,
						'ptype' => $arr->type
					];
				}
			}
			echo json_encode($varianrArr); 
		break;
		case "getMaxProductVariant";
			 
			$fields = "pv.id, pv.measurement, u.name as unit_name, pv.type";
			$tables = PRODUCT_VARIANTS . " pv
			INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
			
			$where ="WHERE pv.product_id=:product_id AND u.parent_id=:parent_id GROUP BY pv.stock_unit_id";
			$params = [
				':product_id' => $_POST['pid'],
				':parent_id' => 0
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
						'unitname' => $arr->unit_name,
						'ptype' => $arr->type
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
			AND (poa.status IS NULL OR poa.status != :poastatus) GROUP BY po.id";
			$params = [
			  ':status'      => 1,
			  ':role_id'     => 5,
			  ':poastatus'   => 3,
			  ':created_by'  => $_SESSION['SELLER_ID']
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
			//echo "<pre>";print_r($_POST);die;
			$check_exists = $general_cls_call->select_query("id, status", PACKAGING_OPERATORS_ASSIGN, "WHERE order_id =:order_id", array(':order_id'=> $order_id), 1);
			if(!empty($check_exists)) {
				$data['status'] = 200;
				$data['msg'] = '<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
					<div class="text-white"><strong>Error!</strong> Operator already assigned to this order.</div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>';
			} else {
				
				$status = $packed_status == 'true' ? 4 : 3;
				$field = "order_id, packaging_operator_id, assign_by, status, created_at, updated_at";
				$value = ":order_id, :packaging_operator_id, :assign_by, :status, :created_at, :updated_at";
				
				$addExecute=array(
					':order_id'					=> $order_id,
					':packaging_operator_id'	=> $packaging_operator_id,
					':assign_by'				=> $_SESSION['SELLER_ID'],
					':status'					=> $status,
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
					if($status == 4)
					{
						$fieldOs = "order_id, status, created_by, user_type, created_at";
						$valueOs = ":order_id, :status, :created_by, :user_type, :created_at";
						$addExecuteOs=array(
							':order_id'				=> $order_id,
							':status'				=> 4,
							':created_by'			=> $_SESSION['USER_ID'],
							':user_type'			=> $_SESSION['ROLE_ID'],
							':created_at'			=> date("Y-m-d H:i:s")
						);
						$general_cls_call->insert_query(ORDERS_STATUSES, $fieldOs, $valueOs, $addExecuteOs);
					}
					//update orders
					$setValues="active_status=:active_status";
					$updateExecute=array(
						':active_status'	=> $status,
						':order_id'			=> $order_id
					);
					$whereClause=" WHERE id = :order_id";
					$general_cls_call->update_query(ORDERS, $setValues, $whereClause, $updateExecute);
					//update orders items
					$setValues="active_status=:active_status";
					$updateExecute=array(
						':active_status'	=> $status,
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
			$params = [':id'=>4];
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
			$dataArray = $general_cls_call->callAPI("POST", SITE_URL."api/packaging-operator-orders-save", ['order_id'=>$order_id], $_SESSION['API_TOKEN']);
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
					
					// available pos stock
					$wherePos = "WHERE product_variant_id=:product_variant_id AND product_id=:product_id AND status=:status AND stock_type=:stock_type AND seller_id=:seller_id";
					
					$paramsPos = [
						':product_variant_id'	=>	$val,
						':product_id'	=>	$product_variant_dtls->product_id,
						':status'	=>	1,
						':stock_type'	=>	1,
						':seller_id'	=>	$_SESSION['SELLER_ID']
					];
					// check from product_stock_transaction 
					$stock_used = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $wherePos, $paramsPos, 'stock');
					
					// available online stock
					$whereOnline = "WHERE product_variant_id=:product_variant_id AND product_id=:product_id AND status=:status AND stock_type=:stock_type AND seller_id=:seller_id";
					
					$paramsOnline = [
						':product_variant_id'	=>	$val,
						':product_id'	=>	$product_variant_dtls->product_id,
						':status'	=>	1,
						':stock_type'	=>	2,
						':seller_id'	=>	$_SESSION['SELLER_ID']
					];
					// check from product_stock_transaction 
					$stock_used_online = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $whereOnline, $paramsOnline, 'stock');
					
					$whereOrdItm = "WHERE product_variant_id=:product_variant_id AND active_status!=:active_status AND seller_id=:seller_id";
					$paramsOrdItm = [
						':product_variant_id' => $val,
						':seller_id' => $_SESSION['SELLER_ID'],
						'active_status' => 7
					];
					$qty_used = $general_cls_call->select_query_sum( ORDERS_ITEMS, $whereOrdItm, $paramsOrdItm, 'quantity');
					 
					$qty_used = !empty($qty_used->total) ? $qty_used->total : 0;
					
					// after cart add check stock
					
					$product_dtls = $general_cls_call->select_query("*", PRODUCTS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->product_id), 1);
					$product_name = $general_cls_call->cart_product_name($product_dtls->name);
					
					$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $product_variant_dtls->stock_unit_id), 1);
					$unitname = $unit_dtls->name;
					
					$p_variant_name = $product_variant_dtls->measurement.' '.$unitname;
					
					$available_stock = $stock_used->total;
					//$available_stock_online = $stock_used_online->total;
					
					$stockArr[] = [
						"product_name" => $product_name,
						"variant_name" => $p_variant_name,
						"variant_stock" => $stock_used->total == null ? 0 : $stock_used->total,
						"variant_stock_online" => $stock_used_online->total == null ? 0 : $stock_used_online->total-$qty_used,
					];
				}
				echo json_encode($stockArr);
		break;
		case "purchaseAccept":
				$accept_status = $_POST['accept_status'];
				$stock_transaction_id = $_POST['stock_transaction_id'];
				$qty = $_POST['qty'];
				$product_id = $_POST['product_id'];
				$product_variant_id = $_POST['product_variant_id'];
				//echo $status.' '.$stock_transaction_id;
				$field = "stock";
				$where = "WHERE id=:id";
				$params = [
					':id' => $stock_transaction_id
				];
				$stock_data = $general_cls_call->select_query($field, PRODUCT_STOCK_TRANSACTION, $where, $params, 1);
				//echo $stock_data->stock;
				if($accept_status==1)
				{
					$setValues="status=:status, seller_accept_status=:seller_accept_status";
					$updateExecute=array(
						':status'	=> 1,
						':seller_accept_status'	=> 1,
						':id'		=> $stock_transaction_id
					);
					$whereClause=" WHERE id = :id";
					$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
					
					$data['status'] = 200;
					$data['msg'] = '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
						<div class="text-white"><strong>Success!</strong> Stock updated successfully</div>
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>';
				}
				elseif($accept_status==2 || $accept_status==4)
				{
					if($qty <= $stock_data->stock)
					{
						$res['status_name'] = $accept_status==2 ? 'Damage' : 'Short fall';
						$res['previous_qty'] = $stock_data->stock;
						$res['updated_qty'] = $qty;
						$seller_accept_remark = json_encode($res);
						
						
						$setValues="status=:status, stock=:stock, seller_accept_status=:seller_accept_status, seller_accept_remark=:seller_accept_remark";
						$updateExecute=array(
							':status'	=> 1,
							':seller_accept_status'	=> $accept_status,
							':stock'	=> $qty,
							':seller_accept_remark'	=> $seller_accept_remark,
							':id'		=> $stock_transaction_id
						);
						$whereClause=" WHERE id=:id";
						$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
						
						$data['status'] = 200;
						$data['msg'] = '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
						<div class="text-white"><strong>Success!</strong> Stock updated successfully</div>
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>';
					}
					else{
						$data['status'] = 400;
						$data['msg'] = '<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong>Error!</strong> Input quantity exceed than stock available</div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>';
					}
				}
				elseif($accept_status==3)
				{
					// check available stock 
			        $stock_available = $general_cls_call->select_query_sum( ADMIN_STOCK_PURCHASE_LIST, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id", array(':product_variant_id'=> $product_variant_id, 'status'=>1, 'product_id'=> $product_id), 'stock');
					
					
					//if($qty >= $stock_data->stock)
					//echo $stock_available->total. . $qty; die;
					if($stock_available->total >= $qty)
					{
						$res['status_name'] = 'Exceed';
						$res['previous_qty'] = $stock_data->stock;
						$res['updated_qty'] = $qty;
						$seller_accept_remark = json_encode($res);
						
						$setValues="status=:status, stock=:stock, seller_accept_status=:seller_accept_status, seller_accept_remark=:seller_accept_remark";
						$updateExecute=array(
							':status'	=> 1,
							':seller_accept_status'	=> $accept_status,
							':stock'	=> $qty,
							':seller_accept_remark'	=> $seller_accept_remark,
							':id'		=> $stock_transaction_id
						);
						$whereClause=" WHERE id=:id";
						$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
						
						$data['status'] = 200;
						$data['msg'] = '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
						<div class="text-white"><strong>Success!</strong> Stock updated successfully</div>
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>';
					}
					else{
						$data['status'] = 400;
						$data['msg'] = '<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong>Error!</strong> Input quantity less than stock available</div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>';
					}
				}
				
			echo json_encode($data);
		break;
		
		case "getVendorSellingPrice":
			 $product_variant_id = $_POST['val'];
			 $where = "WHERE id =:id";
			 $params = [':id'=> $product_variant_id];
			 $prices = $general_cls_call->select_query("discounted_price", PRODUCT_VARIANTS, $where, $params, 1);
			 $data['status'] = 200;
			 $data['discount_price'] = $prices->discounted_price;
			 echo json_encode($data);
			 
		break;
		case "updatedelete":
			$setValues="status=:status";
			$updateExecute=array(
				':status'	=> 2,
				':id'	    => $_POST['id']
			);
			$whereClause=" WHERE id = :id";
			$update = $general_cls_call->update_query($_POST['table'], $setValues, $whereClause, $updateExecute);
			if($update)
			{
				echo 'l';
			}
		break;
		
		case "updatestatus":
		
			$statusData = $general_cls_call->select_query("status", $_POST['table'], "WHERE id=:id", array(':id'=>$_POST['id']), 1);
			
			$status = $statusData->status == 1 ? 0 : 1;
		
			$setValues="status=:status";
			$updateExecute=array(
				':status'	=> $status,
				':id'	    => $_POST['id']
			);
			$whereClause=" WHERE id = :id";
			$update = $general_cls_call->update_query($_POST['table'], $setValues, $whereClause, $updateExecute);
			if($update)
			{
				echo 'l';
			}
		break;
		case "auto_assign_operator":
			
			//$where = "WHERE oi.active_status=:active_status 
			$where = "WHERE o.active_status=:active_status 
				  AND oi.seller_id=:seller_id
				  GROUP BY oi.order_id
				  ORDER BY 
					  CASE 
						  WHEN o.order_type = 'slot' THEN o.from_time
						  ELSE o.created_at
					  END ASC";
			$params = [
				':seller_id'=> $_SESSION['SELLER_ID'],
				':active_status'=> 2
			];
			
			
			$fields = "o.id";

			$tables = ORDERS . " o
			INNER JOIN " . ORDERS_ITEMS . " oi ON oi.order_id = o.id";
			
			$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
			
			$order_ids = [];
			if(!empty($sqlQuery[0]))
			{
				foreach($sqlQuery as $k=>$arr)
				{
					$order_id = $arr->id;
					$check_exists = $general_cls_call->select_query("id, status", PACKAGING_OPERATORS_ASSIGN, "WHERE order_id =:order_id", array(':order_id'=> $order_id), 1);
					if(empty($check_exists))
					{
						//echo $order_id = $arr->id;die;
						$fields = "po.id, po.name, po.mobile";

						$tables = PACKAGING_OPERATORS . " po
						INNER JOIN " . ADMIN_MASTER . " a ON a.id = po.admin_id
						LEFT JOIN " . PACKAGING_OPERATORS_ASSIGN . " poa 
							ON poa.packaging_operator_id = po.id";

						$where = "WHERE po.status = :status
						AND a.created_by = :created_by
						AND a.role_id = :role_id
						AND (poa.status IS NULL OR poa.status != :poastatus)
						ORDER BY 
						CASE 
							WHEN po.id > (
								SELECT IFNULL(poa2.packaging_operator_id, 0)
								FROM " . PACKAGING_OPERATORS_ASSIGN . " poa2
								WHERE poa2.status != :poastatus
								ORDER BY poa2.id DESC
								LIMIT 1
							) THEN 0
							ELSE 1
						END,
						po.id ASC
						LIMIT 1";

						$params = [
							':status'     => 1,
							':role_id'    => 5,
							':poastatus'  => 3,
							':created_by' => $_SESSION['SELLER_ID']
						];

						$poQuery = $general_cls_call->select_join_query($fields,$tables,$where,$params,1);
						$packaging_operator_id = '';
						//echo "<pre>";print_r($poQuery);die;
						$packaging_operator_id = !empty($poQuery->id) ? $poQuery->id : '';
						
						if($packaging_operator_id !='')
						{
							$field = "order_id, packaging_operator_id, assign_by, status, auto_assign, created_at, updated_at";
							$value = ":order_id, :packaging_operator_id, :assign_by, :status, :auto_assign, :created_at, :updated_at";
							
							$addExecute=array(
								':order_id'					=> $order_id,
								':packaging_operator_id'	=> $packaging_operator_id,
								':assign_by'				=> $_SESSION['SELLER_ID'],
								':status'					=> 3,
								':auto_assign'				=> 1,
								':created_at'				=> date("Y-m-d H:i:s"),
								':updated_at'				=> date("Y-m-d H:i:s")
							);
							
							$ok = $general_cls_call->insert_query(PACKAGING_OPERATORS_ASSIGN, $field, $value, $addExecute);
							
							
							$fields = "order_id, status, created_by, user_type, created_at";
							$values = ":order_id, :status, :created_by, :user_type, :created_at";
							$addExecutes=array(
								':order_id'				=> $order_id,
								':status'				=> 3,
								':created_by'			=> $_SESSION['USER_ID'],
								':user_type'			=> $_SESSION['ROLE_ID'],
								':created_at'			=> date("Y-m-d H:i:s")
							);
							$general_cls_call->insert_query(ORDERS_STATUSES, $fields, $values, $addExecutes);
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
							
							$order_ids[] = $order_id;
						}
					}
				}
			}
			echo json_encode($order_ids);
		break;
		
		case "getDeductProductVariant";
			 
			$fields = "pr.id, pr.product_id, pr.product_variant_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode, pv.id as pvid, pv.type";
			$tables = PRODUCT_STOCK_TRANSACTION . " pr
			INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
			INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
			INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
			$where = "WHERE pr.product_id=:product_id AND  pr.status=:status AND pr.seller_id =:seller_id GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
			$params = [
				':status'			=> 1,
				':seller_id'		=> $_SESSION['SELLER_ID'],
				':product_id'		=> $_POST['pid']
			];
			$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
			$varianrArr = [];
			if($sqlQuery[0] != '')
			{
				foreach($sqlQuery as $arr)
				{
					$wherePos = "WHERE product_id=:product_id AND product_variant_id=:product_variant_id AND  stock_type=:stock_type AND seller_id=:seller_id AND status=:status";
							 
					$paramsPos = [
						':product_id' => $arr->product_id,
						':product_variant_id' => $arr->pvid,
						':stock_type' => 1,
						':seller_id' => $_SESSION['SELLER_ID'],
						':status' => 1
					];
					$pos_stock = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $wherePos, $paramsPos, 'stock');
					
					if($pos_stock->total != 0)
					{
						$varianrArr[] = [
							'id' => $arr->product_variant_id,
							'measurement' => $arr->measurement,
							'unitname' => $arr->stock_unit_name,
							'ptype' => $arr->type
						];
					}
				}
			}
			echo json_encode($varianrArr); 
		break;
		
		case "getDeductProductVariantQry";
			 
			$fields = "pr.id, pr.product_id, pr.product_variant_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode, pv.id as pvid";
			$tables = PRODUCT_STOCK_TRANSACTION . " pr
			INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
			INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
			INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
			$where = "WHERE pr.product_variant_id=:product_variant_id AND  pr.status=:status AND pr.seller_id =:seller_id GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
			$params = [
				':status'			=> 1,
				':seller_id'		=> $_SESSION['SELLER_ID'],
				':product_variant_id'	=> $_POST['pvid']
			];
			$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 1);
			$varianrArr = [];
			//if($sqlQuery[0] != '')
			//{
				//foreach($sqlQuery as $arr)
				//{
					$wherePos = "WHERE product_id=:product_id AND product_variant_id=:product_variant_id AND  stock_type=:stock_type AND seller_id=:seller_id AND status=:status";
							 
					$paramsPos = [
						':product_id' => $sqlQuery->product_id,
						':product_variant_id' => $sqlQuery->pvid,
						':stock_type' => 1,
						':seller_id' => $_SESSION['SELLER_ID'],
						':status' => 1
					];
					$pos_stock = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $wherePos, $paramsPos, 'stock');
					
					if($pos_stock->total != 0)
					{
						$varianrArr[] = [
							'stock' => $pos_stock->total
						];
					}
				//}
			//}
			echo json_encode($varianrArr); 
		break;
    }
?>