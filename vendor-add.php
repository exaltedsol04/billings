<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	/*=========== CODE START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		//echo "<pre>";print_r($_POST);die;
		if(empty($vendor_id) && $vendor_id == '')
		{
			$field = "name, email, mobile,  status, city, pincode, address, product_ids, created_at, updated_at";
			$value = ":name, :email, :mobile, :status, :city, :pincode, :address, :product_ids, :created_at, :updated_at";
					
			$addExecute=array(
				':name'			=> $general_cls_call->specialhtmlremover($name),
				':email'			=> $general_cls_call->specialhtmlremover($email),
				':mobile'	=> $general_cls_call->specialhtmlremover($mobile),
				':city'	=> $general_cls_call->specialhtmlremover($city),
				':pincode'	=> $general_cls_call->specialhtmlremover($pincode),
				':address'	=> $general_cls_call->specialhtmlremover($address),
				':product_ids'	=> $general_cls_call->specialhtmlremover(implode(",", $products)),
				':status'				=> 1,
				':created_at' 			=> date('Y-m-d H:i:s'),
				':updated_at'		    => date('Y-m-d H:i:s')
			);
		
		
			$general_cls_call->insert_query(VENDORS, $field, $value, $addExecute);
			$sucMsg = "Vendor Created Successfully";
		}
		else
		{
			$setValues=" name=:name, email=:email, mobile=:mobile, city=:city, pincode=:pincode, address=:address, product_ids=:product_ids, updated_at=:updated_at";
			$updateExecute=array(
				':name'		=> $general_cls_call->specialhtmlremover($name),
				':email'	=> $general_cls_call->specialhtmlremover($email),
				':mobile'	=> $general_cls_call->specialhtmlremover($mobile),
				':city'	=> $general_cls_call->specialhtmlremover($city),
				':pincode'	=> $general_cls_call->specialhtmlremover($pincode),
				':address'	=> $general_cls_call->specialhtmlremover($address),
				':product_ids'	=> $general_cls_call->specialhtmlremover(implode(",", $products)),
				':updated_at'  => date('Y-m-d H:i:s'),
				':id'	    => $vendor_id
			);
			$whereClause=" WHERE id = :id";
			$general_cls_call->update_query(VENDORS, $setValues, $whereClause, $updateExecute);
			};
			$sucMsg = "Vendor Updated Successfully";
	}
	
	if(isset($_GET['vendor_id']) && $_GET['vendor_id']!='')
	{
		$fieldsVen = "*";
		$whereVen = "WHERE id=:id";
		$paramsVen = [
			':id'=> $_GET['vendor_id']
		 ];
		$sqlQueryVen = $general_cls_call->select_query($fieldsVen, VENDORS, $whereVen, $paramsVen, 1);
	}
/*=========== CODE END ===========*/

	ob_end_flush();
	
?>

<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/header.php"); ?>
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
						<h5 class="mb-0 fw-bold">Vendor</h5>
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
							
							<div class="col-md-6">
								<label for="input5" class="form-label">Name</label>
								<input type="text" class="form-control" name="name" id="name" placeholder="Name" required value="<?php echo isset($sqlQueryVen->name) ? $sqlQueryVen->name : '' ?>">
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">Email</label>
								<input type="email" class="form-control" name="email" id="email" placeholder="Email" required value="<?php echo isset($sqlQueryVen->email) ? $sqlQueryVen->email : '' ?>">
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">Mobile</label>
								<input type="text" class="form-control" name="mobile" id="mobile" placeholder="Mobile" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="10" required value="<?php echo isset($sqlQueryVen->mobile) ? $sqlQueryVen->mobile : '' ?>">
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">City</label>
								<input type="text" class="form-control" name="city" id="city" placeholder="City" required value="<?php echo isset($sqlQueryVen->city) ? $sqlQueryVen->city : '' ?>">
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">Pincode</label>
								<input type="text" class="form-control" name="pincode" id="pincode" placeholder="Pincode" required value="<?php echo isset($sqlQueryVen->pincode) ? $sqlQueryVen->pincode : '' ?>" maxlength="6" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
							</div>
							<div class="col-md-12">
								<label for="input5" class="form-label">Address</label>
								<textarea name="address" class="form-control" required><?php echo isset($sqlQueryVen->address) ? $sqlQueryVen->address : '' ?></textarea>
								
							</div>
							
							<div class="col-md-12">
								<label for="multiple-select-field" class="form-label">Products</label>
								<select class="form-select" id="multiple-select-field" data-placeholder="Choose products" multiple name="products[]" required>
									<option value="">Select..</option>
									<?php 
									$fieldsP = "*";
									$whereP = "WHERE 1";
									$paramsP = [];
									$sqlQueryP = $general_cls_call->select_query($fieldsP, PRODUCTS, $whereP, $paramsP, 2);
									foreach($sqlQueryP as $val)
									{
										$barcode = !empty($val->barcode) ? '(' .$val->barcode .')' : '';
										$selected = '';
										$expProductIds = explode(",", $sqlQueryVen->product_ids);
										if(in_array($val->id, $expProductIds))
										{
											$selected = 'selected';
										}
									?>
									<option value="<?php echo $val->id ;?>" <?php echo $selected; ?>><?php echo $barcode .$val->name ; ?></option>
									<?php 
									}
									?>
								</select>
							</div>
							<input type="hidden" value="<?php echo $_GET['vendor_id'] ?>" name="vendor_id">
							

							<div class="col-md-12">
								<div class="d-md-flex d-grid justify-content-md-between">
									<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
									<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5">Add vendor</button>
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
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->
</body>

</html>
<script>
/*function select_product(product)
{
	$('#selling_price_div').html('');
	$('.purchase-div').hide();
	$('.selling-div').hide();
	
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
function get_selling_price(val)
{
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {action:'getVendorSellingPrice', val:val},
		dataType: "json",
		success: function(response){
			//alert(response.status);alert(response.discount_price);
			$('#selling_price').val(response.discount_price);
			$('.purchase-div').show();
			$('.selling-div').show();
			var html = '<div class="text-left;"><span class="fw-bold" style="color:#A300A3; font-size:20px;">Selling price:</span><span style="color:#A300A3; font-size:20px;"> ₹ ' + response.discount_price + '</span></div>';
			$('#selling_price_div').html(html);
		}
	});
}*/
</script>
