<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
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
				
				
				$field = "seller_id, product_variant_id, product_id,  stock, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id,approved_by, approved_date, order_id";
				$value = ":seller_id, :product_variant_id, :product_id, :stock, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id";
				
				$addExecute=array(
					':seller_id'			=> $_SESSION['USER_ID'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					
					':stock'				=> ($_POST['qty'][$k]),
					':created_date'			=> date("Y-m-d H:i:s"),
					':status'				=> 0,
					':selling_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->discounted_price),
					':purchase_price'		=> $general_cls_call->specialhtmlremover($product_variant_dtls->price),
					':transaction_type'		=> 1,
					':received_selled_id'	=> '',
					':parent_id'			=> 0,
					':approved_by'			=> null,
					':approved_date'		=> null,
					':order_id'		       => '',
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
		<?PHP include_once("includes/adminHeader.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/adminMenu.php"); ?>
	<!-- ######### HEADER END ############### -->

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
						$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, p.name, p.image, p.barcode";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id";
						$where = "WHERE 1 ORDER BY p.name";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						if($sqlQuery[0] != '')
						{
							foreach($sqlQuery as $arr)
							{	
								/*$imagePath = MAIN_SERVER_PATH . $arr->image;
								if (!empty($arr->image) && file_exists($imagePath)) {
									$imagePath = MAIN_SERVER_PATH . $arr->image;
								} else {
									$imagePath = IMG_PATH . 'noImg.jpg';
								}*/
								$barcode = $arr->barcode;
								
								$barcode = !empty($barcode) ?  '(' . $barcode .')' : '';
					?>
								<option value="<?PHP echo $arr->id.'@@@'.$arr->discounted_price.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$arr->product_id.'@@@'.$arr->barcode; ?>"><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name).' ('.$arr->stock.' '.$arr->type.')'; ?></option>
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
							<th>Barcode</th>
							<th>Product</th>
							<th class="text-center">Price</th>
							<th class="text-center" style="width:160px">Qty</th>
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

                    <button type="submit" name="btnSubmit" value="SAVE" class="btn btn-grd btn-grd-success px-5">Submit Request</button>
					
					
                  </div>
			</form>
		</div>
	</div>
            </div>
			
			
		
		
      </main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
	<script src="assets/plugins/es/purchase-request.js"></script>
	<?php if (!empty($_SESSION['call_js'])) { ?>
		<script>
			clearCart();
		</script>
	<?php unset($_SESSION['call_js']); } ?>


  </body>
</html>
