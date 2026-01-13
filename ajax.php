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
			$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, PV.stock_unit_id ,p.name, p.image, p.barcode";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id";
						$where = "WHERE p.barcode = '".$barcode."' ORDER BY p.name";
						$params = [];
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
				$stock_unit_id = $general_cls_call->select_query("*", UNITS, "WHERE id=:id", array(':id'=>$val->stock_unit_id), 1);
				
				$productArr[] = [
					'id'               => $val->id,
					'product_id'       => $val->product_id,
					'type'             => $val->type,
					'stock'            => $val->stock,
					'measurement'      => $val->measurement,
					'discounted_price' => $val->discounted_price,
					'name'             => $general_cls_call->cart_product_name($val->name),
					'image'            => $val->image,
					'barcode'          => $val->barcode,
					'imagePath'        => $imagePath,
					'stock_unit_id'          => $stock_unit_id->name,
				];
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
    }
?>