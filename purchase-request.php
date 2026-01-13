<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();

/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnSubmit'])) && $_POST['btnSubmit'] === "SAVE")
	{	
		extract($_POST);
		
		if(!empty($product_variant_id))
		{
			foreach($product_variant_id as $k=>$val) {
				
				$field = "product_id, product_variant_id, qty, created_by, request_date";
				$value = ":product_id, :product_variant_id, :qty, :created_by, :request_date";
				$addExecute=array(
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id[$k]),
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':qty'					=> $general_cls_call->specialhtmlremover($qty[$k]),
					':created_by'			=> $_SESSION['USER_ID'],
					':request_date'			=> date("Y-m-d H:i:s")
				);
				$general_cls_call->insert_query(PURCHASE_REQUESTS, $field, $value, $addExecute);
				$sucMsg="Data has been submitted successfully";
				$_SESSION['call_js'] = true;
				/*if($sucMsg) {
					echo "<script src='bower_components/jquery/dist/jquery.min.js'></script><script src='dist/js/purchase-request.js'></script><script>
					alert(1);
						clearCart();
					</script>";
				}*/
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
	
		<div class="alert alert-success fade in">
		  <button class="close" data-dismiss="alert">X</button>
		  <i class="fa-fw fa fa-check"></i><strong>Success</strong> <?PHP echo $sucMsg; ?>
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
					?>
								<option value="<?PHP echo $arr->id.'@@@'.$arr->discounted_price.'@@@'.$arr->name.'@@@'.$arr->product_id; ?>"><?PHP echo $arr->name.' ('.$arr->stock.' '.$arr->type.')'; ?></option>
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
		
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				  <table id="example2" class="table table-striped table-bordered">
                    <thead>
						<tr>
							<td><input type="text" class="form-control" id="search-zero" placeholder="Search by barcode"></td>
							<td><input type="text" class="form-control" id="search-one" placeholder="Search by product name"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                      <tr>
						<th>P.Code</th>
						<th>Name</th>
						<th>Request Qty.</th>
						<th>Measurement</th>
						<th class="text-center">Status</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.qty, pr.status, pv.type, pv.stock, pv.measurement, p.name, p.image, p.barcode, a.username";
						$tables = PURCHASE_REQUESTS . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . ADMIN_MASTER . " a ON a.id = pr.created_by";

						/*$where = "WHERE u.status = :status";
						$params = [
							':status' => 1
						];*/
						$where = "WHERE 1 ORDER BY pr.request_date DESC";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);


						
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $arr)
							{	
								/*$imagePath = MAIN_SERVER_PATH . $arr->image;
								if (!empty($arr->image) && file_exists($imagePath)) {
									$imagePath = MAIN_SERVER_PATH . $arr->image;
								} else {
									$imagePath = IMG_PATH . 'noImg.jpg';
								}*/
					?>
                      <tr id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $arr->barcode; ?></td>
						<td><?PHP echo $arr->name; ?></td>
						<td><?PHP echo $arr->qty.' '.$arr->type; ?></td>
						<td><?PHP echo $arr->measurement; ?></td>
						<td class="text-center"><?PHP echo $arr->status == 1 ? '<span class="text-success">Approved</span>' : '<span class="text-danger">Pending</span>' ; ?></td>
                      </tr>
						<?PHP
								$i++;
							}
						}
						else
						{
					?>
                      <tr>
                        <td colspan="5">No record found.</div>
						</td>
					  </tr>
					<?PHP
						}	
					?>
                   </tbody>
                  </table>
				  
					  
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
