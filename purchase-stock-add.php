<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'],$pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
	/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		if($product != '' && $stock !='')
		{
			//echo "<pre>";print_r($_POST);die;
			$explode_product = explode("@@@", $product);
			
			$product_id = $explode_product[0];
			//$product_variant_id = $explode_product[1];
			
			$remarks = !empty($remarks) ? $remarks : null;
			$field = "vendor_id, product_id, product_variant_id, stock, status, remarks, created_at, updated_at";
			$value = ":vendor_id, :product_id, :product_variant_id, :stock, :status, :remarks, :created_at, :updated_at";
				
				//parent_id
			$addExecute=array(
				':vendor_id'			=> $general_cls_call->specialhtmlremover($vendor_id),
				':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
				':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id),
				':stock'				=> $stock,
				':status'				=> 0,
				':remarks'				=> $remarks,
				':created_at' 			=> date('Y-m-d h:i:s'),
				':updated_at'		    => date('Y-m-d H:i:s')
			);
			$general_cls_call->insert_query(ADMIN_STOCK_PURCHASE_LIST, $field, $value, $addExecute);
			$sucMsg = "Stock Inserted Successfully";
			
		}
		else{
			$erMsg = "Please Fill All Fields";
		}
		
	}
/*=========== ACCOUNT SETTINGS END ===========*/
/*=========== SELECT QUERY START ===========*/
	$adminVal=$general_cls_call->select_query("*", ADMIN_MASTER, "WHERE id=:id", array(':id'=>$_SESSION['USER_ID']), 1);
/*=========== SELECT QUERY END ===========*/


	if(!isset($_POST['txtUsername'])) { $_POST['txtUsername'] =			$adminVal->username; }
	if(!isset($_POST['hidPassword'])) { $_POST['hidPassword'] =			$adminVal->password; }
	
	
	ob_end_flush();
	
?>

<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/adminHeader.php"); ?>
<!-- ######### HEADER END ############### -->
  
<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/adminMenu.php"); ?>
<!-- ######### HEADER END ############### -->

  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
		<div class="row">
           <div class="col-12 col-xl-12">
            <div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
				<div class="card-body p-4">
					<div class="d-flex align-items-start justify-content-between mb-3">
					  <div class="">
						<h5 class="mb-0 fw-bold">Purchase Stock</h5>
					  </div>
					  
					</div>
					<?PHP
						if(isset($erMsg) && $erMsg != '')
						{
					?>
						<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong><?PHP echo $Error_mesg; ?></strong> <?PHP echo $erMsg; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
						if(isset($sucMsg) && $sucMsg != '')
						{
					?>
						<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
							<div class="text-white"><strong>Success</strong> <?PHP echo $sucMsg; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
					?>
						<form class="row g-4" action="" method="post">
							<div class="col-md-12">
								<label for="input1" class="form-label">Products</label>
									<select name="product" id="product" class="form-select select2-dropdown" tabindex="1" onchange="select_product(this.value)">
									<option value="">Select...</option>
									<?PHP
										$fields = "*";
										$tables = PRODUCTS;
										$where = "WHERE 1 ORDER BY name";
										$params = [];
										$sqlQuery = $general_cls_call->select_query($fields, $tables, $where, $params, 2);
										//echo "<pre>"; print_r($sqlQuery);die;
										if($sqlQuery[0] != '')
										{
											foreach($sqlQuery as $arr)
											{	
												$barcode = $arr->barcode;
												
												$barcode = !empty($barcode) ?  '(' . $barcode .') ' : '';
									?>
												<option value="<?PHP echo $arr->id.'@@@'.'@@@'.$general_cls_call->cart_product_name($arr->name); ?>" <?php echo ($_POST['product'] == $arr->id.'@@@'.$general_cls_call->cart_product_name($arr->name)) ? 'selected' : '' ?>><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name); ?></option>
									<?PHP
											}
										}
									?>
								</select>
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">Stock Quantity</label>
								<input type="text" class="form-control" name="stock" id="stock" placeholder="Stock quantity" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
								<span class="text-danger" id="err_stock"></span>
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">Unit</label>
								<select name="product_variant_id" id="product_variant_id" class="form-select select2-dropdown" tabindex="1">
									<option value="">Select...</option>
								</select>
							</div>
							<div class="col-md-12">
								<label for="input5" class="form-label">Vendors</label>
								<select name="vendor_id" id="vendor_id" class="form-select select2-dropdown" tabindex="1">
									<option value="">Select...</option>
									<?php 
										$fields = "*";
										$where = "WHERE 1";
										$params = [];
										$sqlQuery = $general_cls_call->select_query($fields, VENDORS, $where, $params, 2);
										if($sqlQuery[0] != '')
										{
											foreach($sqlQuery as $arr)
											{
									?>
											<option value="<?php echo $arr->id ?>" <?php echo ($_POST['vendor_id'] == $arr->id) ? 'selected' : '' ?>><?php echo $arr->name ?></option>
									<?php 
											}
										}
									?>
								</select>
								<span class="text-danger" id="err_stock"></span>
							</div>
							
							<div class="col-md-12">
								<label for="input5" class="form-label">Remarks</label>
								<textarea name="remarks" id="remarks" class="form-control"></textarea>
								<span class="text-danger" id="err_stock"></span>
							</div>
							<input type="hidden" id="stock_limit" name="stock_limit" value="<?php echo isset($_POST['stock_limit']) ? $_POST['stock_limit'] : '' ?>">
							<div class="col-md-12">
								<div class="d-md-flex d-grid align-items-center gap-3">
									<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-primary px-5">Purchase Stock</button>
								</div>
							</div>
						</form>
				</div>
            </div>
           </div> 
           
        </div><!--end row-->
    </div>
  </main>
  <!--end main wrapper-->
	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
</body>

</html>
<script>
function select_product(product)
{
	const myArray = product.split("@@@");
	let pid = parseInt(myArray[0]);
	var datapost = 'action=getProductVariant&pid='+pid;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			if (result.length > 0) {
				var html = '<option value="">Select...</option>';
				$.each(result, function (i, variants) {
					html += '<option value='+ variants.id +'>' + variants.measurement + ' ' + variants.unitname + '</option>';
				});
				$('#product_variant_id').html(html);
			}
		}
	});
}
</script>
