<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();

/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnSubmit'])) && $_POST['btnSubmit'] === "SAVE")
	{	
		extract($_POST);
		//echo "<pre>";print_r($product_variant_id);die;
		if(!empty($product_variant_id))
		{
			foreach($product_variant_id as $k=>$val) {
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $val), 1);
				//echo "<pre>";print_r($product_variant_dtls);die;
				$product_id = $product_variant_dtls->product_id;
				//echo $val.'-> '.$product_id; die;
				$unit_price = $product_variant_dtls->discounted_price;
				$total_price = $_POST['qty'][$k] * $unit_price;
				
				$loose_stock_quantity = 0.00;
				$variant_type = $product_variant_dtls->type;
				if($variant_type == 'loose')
				{
					$variant_measurement = $product_variant_dtls->measurement;
					$loose_stock_quantity = $_POST['qty'][$k] * $variant_measurement;
				}
				
				
				$field = "seller_id, product_variant_id, product_id, loose_stock_quantity, stock, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id,approved_by, approved_date, order_id";
				$value = ":seller_id, :product_variant_id, :product_id, :loose_stock_quantity, :stock, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id";
				
				$addExecute=array(
					':seller_id'			=> $_SESSION['SELLER_ID'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					':loose_stock_quantity'			=> $general_cls_call->specialhtmlremover($loose_stock_quantity),
					':stock'				=> ($_POST['qty'][$k]),
					':created_date'			=> date("Y-m-d H:i:s"),
					':status'				=> 0,
					':selling_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->discounted_price),
					':purchase_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->price),
					':transaction_type'		=> 1,
					':received_selled_id'	=> 0,
					':parent_id'			=> 0,
					':approved_by'			=> 0,
					':approved_date'		=> '0000-00-00 00:00:00',
					':order_id'		       => 0,
				);
				
				$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
				
				$sucMsg="Data has been submitted successfully";
				$_SESSION['call_js'] = true;
			}
			
		}
		else
		{
			$erMsg = "Please choose product.";
		}
	}
/*===========  END ===========*/


	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP include_once("includes/sellerMenu.php"); ?>
	<!-- ######### MENU END ############### -->

<main class="main-wrapper">
    <div class="main-content">
		<?PHP
		if(isset($erMsg) && $erMsg != '')
		{
	?>
		<div class="alert alert-danger fade in">
		  <button class="close" data-dismiss="alert">X</button>
		  <i class="fa-fw fa fa-times"></i><strong>Error!</strong> <?PHP echo $erMsg; ?>
		</div>
	<?PHP
		}
		
		if(isset($sucMsg) && $sucMsg != '')
		{
	?>
	
		<div class="alert alert-success border-0 bg-success alert-dismissible fade show success-message">
			<div class="text-white"><strong><?PHP echo 'Data has been submitted successfully'; ?></strong></div>
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<?PHP
		}
	?>
	
		  <div class="row">
			<div class="col-8 col-xl-8">
				<select name="product" id="product" onchange=add_to_cart(this) class="form-select select2-dropdown" tabindex="1">
					<option value="">Select...</option>
					<?PHP
						$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, pv.stock_unit_id, p.name, p.image, p.barcode, u.name as unit_name";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
						$where = "WHERE 1 ORDER BY p.name";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						if($sqlQuery[0] != '')
						{
							foreach($sqlQuery as $arr)
							{	
								$measurement_arr = [
									'quantity' => 1 * $arr->measurement,
									'stock_unit_id' => $arr->stock_unit_id,
								];
								$measurement_units = $general_cls_call->convert_measurement($measurement_arr);
								$measurement = $measurement_units['value'];
								$unit_name = $measurement_units['unit'];
								
								/*$imagePath = MAIN_SERVER_PATH . $arr->image;
								if (!empty($arr->image) && file_exists($imagePath)) {
									$imagePath = MAIN_SERVER_PATH . $arr->image;
								} else {
									$imagePath = IMG_PATH . 'noImg.jpg';
								}*/
								$barcode = $arr->barcode;
								
								$barcode = !empty($barcode) ?  '(' . $barcode .') ' : '';
					?>
								<option value="<?PHP echo $arr->id.'@@@'.$arr->discounted_price.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$arr->product_id.'@@@'.$barcode.'@@@'.$measurement.' '.$unit_name.'@@@'.$arr->type; ?>"><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name).' ('.$arr->measurement.' '.$arr->unit_name.')'; ?></option>
					<?PHP
							}
						}
					?>
				</select>
			</div>
			<div class="col-4 col-xl-4">
				<button id="removeCart" class="btn btn-grd btn-grd-danger mb-3 pull-right" style="display:none" type="button" onclick="clearCart()" class="removeAll" data-toggle="tooltip" title="Clear Your Cart">Clear Request</button>
			</div>
		</div>
    </div>
	<div class="card">
		<div class="card-body">	
			<form name="frm" action="" method="post">
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					  <thead>
						<tr>
							<th>Sl. No.</th>
							<th>Product</th>
							<th class="text-center" style="width:160px">Qty</th>
							<th>Measurement</th>
							<th>Type</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total Price</th>
							<th class="text-center">Remove</th>
						</tr>
					  </thead>
					  <tbody id="purchase-cart">
						</tbody>
					  <tfoot id="total_amount_show" style="font-weight:bold; font-size:20px">
					  </tfoot>
				</table>
			</div>
			<div class="box-footer text-center">
					<div class="loader" id="loader1" style="display:none"></div>

                    <button type="submit" name="btnSubmit" value="SAVE" class="btn btn-grd btn-grd-success px-5 submit-request" style="display:none">Submit Request</button>
					
					
                  </div>
			</form>
		</div>
	</div>
            </div>
			
			
		
		
      </main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->
	<script src="assets/plugins/es/purchase-request.js"></script>
	<?php if (!empty($_SESSION['call_js'])) { ?>
		<script>
			clearCart();
		</script>
	<?php unset($_SESSION['call_js']); } ?>


  </body>
</html>

