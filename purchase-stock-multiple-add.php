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
		//if($product != '' && $stock !='' && $purchase_price !='' && $vendor_id !='')
		//{
			
			//echo "<pre>";print_r($_POST);die;
			$countProduct = count($product);
			//echo $countProduct;die;
			for($index = 0; $index < $countProduct; $index++)
			{
				$explode_product = explode("@@@", $product[$index]);
				
				$product_id = $explode_product[0];
				//$product_variant_id = $explode_product[1];
				
				if($vendor_id[$index] !='' && $product_id !='' && $product_variant_id[$index] !='' && $purchase_price[$index] !='' && $stock[$index] !='')
				{	
					$remarks = !empty($remarks) ? $remarks : null;
					$field = "vendor_id, product_id, product_variant_id, stock, status,  purchase_price, remarks, created_at, updated_at";
					$value = ":vendor_id, :product_id, :product_variant_id, :stock, :status, :purchase_price, :remarks, :created_at, :updated_at";
						
						//parent_id
					$addExecute=array(
						':vendor_id'			=> $general_cls_call->specialhtmlremover($vendor_id[$index]),
						':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
						':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id[$index]),
						':stock'				=> $stock[$index],
						':status'				=> 0,
						':purchase_price'		=> $general_cls_call->specialhtmlremover($purchase_price[$index]),
						':remarks'				=> $remarks[$index],
						':created_at' 			=> date('Y-m-d H:i:s'),
						':updated_at'		    => date('Y-m-d H:i:s')
					);
					$general_cls_call->insert_query(ADMIN_STOCK_PURCHASE_LIST, $field, $value, $addExecute);
					
				}
			}
			
			$sucMsg = "Stock Inserted Successfully";
		//}
		//else{
			//$erMsg = "Please Fill All Fields";
		//}
		
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
						<h5 class="mb-0 fw-bold">Add Multiple Purchase Stock</h5>
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
						<!--<form class="row g-4" action="" method="post">
							<div class="col-md-3">
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
												<option value="<?PHP echo $arr->id.'@@@'.$general_cls_call->cart_product_name($arr->name); ?>" <?php echo ($_POST['product'] == $arr->id.'@@@'.$general_cls_call->cart_product_name($arr->name)) ? 'selected' : '' ?>><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name); ?></option>
									<?PHP
											}
										}
									?>
								</select>
							</div>
							<div class="col-md-3">
								<label for="input5" class="form-label">Stock Quantity</label>
								<input type="text" class="form-control" name="stock" id="stock" placeholder="Stock quantity" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
								<span class="text-danger" id="err_stock"></span>
							</div>
							<div class="col-md-3">
								<label for="input5" class="form-label">Unit</label>
								<select name="product_variant_id" id="product_variant_id" class="form-select select2-dropdown" tabindex="1" onchange="get_selling_price(this.value)">
									<option value="">Select...</option>
								</select>
							</div>

							<div class="col-md-3 purchase-div"  style="display:none">
								<label for="input5" class="form-label">Purchase price</label>
								<input type="text" class="form-control" id="purchase_price" name="purchase_price" placeholder="Purchase price" oninput="this.value = this.value.replace(/[^0-9.]/g, '')">
								<span class="text-danger" id="err_stock"></span>
							</div>
							<div class="col-md-3 selling-div"  style="display:none">
								<label for="input5" class="form-label"></label>
								<div id="selling_price_div" class="w-100"></div>
							</div>
							<div class="col-md-3">
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
							<input type="hidden" id="selling_price" name="selling_price">
							<div class="col-md-3">
								<label for="input5" class="form-label">Remarks</label>
								<textarea name="remarks" id="remarks" class="form-control"></textarea>
								<span class="text-danger" id="err_stock"></span>
							</div>
							<input type="hidden" id="stock_limit" name="stock_limit" value="<?php echo isset($_POST['stock_limit']) ? $_POST['stock_limit'] : '' ?>">
							<div class="col-md-12">
								<div class="d-md-flex d-grid justify-content-md-between">
									<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
									<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5">Purchase Stock</button>
								</div>
							</div>
						</form>-->
						<form class="row g-4" action="" method="post">
						<div id="rows-wrapper">

							<div class="row item-row mb-2">

								<div class="col-md-3">
								<label for="input1" class="form-label">Products</label>
									<select name="product[]" class="form-select form-control"  tabindex="1" onchange="select_product(this)">
										<option value="">Select product</option>
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
												<option value="<?PHP echo $arr->id.'@@@'.$general_cls_call->cart_product_name($arr->name); ?>" <?php echo ($_POST['product'] == $arr->id.'@@@'.$general_cls_call->cart_product_name($arr->name)) ? 'selected' : '' ?>><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name); ?></option>
									<?PHP
											}
										}
									?>
									</select>
								</div>

								<div class="col-md-2">
									<label for="input5" class="form-label">Stock Quantity</label>
									<input type="text" class="form-control" name="stock[]" id="stock" placeholder="Stock quantity" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
									<span class="text-danger" id="err_stock"></span>
								</div>

								<div class="col-md-2">
									<label for="input5" class="form-label">Unit</label>
									<select name="product_variant_id[]" id="product_variant_id" class="form-select unit-select" tabindex="1" onchange="get_selling_price(this)">
										<option value="">Select...</option>
									</select>
								</div>
								<div class="col-md-3 purchase-div">
									<label for="input5" class="form-label">Purchase price</label>
									<input type="text" class="form-control purchase_price" id="purchase_price" name="purchase_price[]" placeholder="Purchase price">
									<input type="hidden" class="hid_purchase_price">
									<span id="selling_price_div" class="w-100 selling_price_div"></span>
								</div>
								<div class="col-md-2">
									<label for="input5" class="form-label">Vendors</label>
									<select name="vendor_id[]" id="vendor_id" class="form-select" tabindex="1">
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
								<div class="col-md-11">
									<label for="input5" class="form-label">Remarks</label>
									<input type="text" name="remarks[]" id="remarks" class="form-control">
									<span class="text-danger" id="err_stock"></span>
								</div>

								<div class="col-md-1">
									<button type="button" class="btn btn-danger removeRow mt-4">X</button>
								</div>

							</div>

						</div>

						<!--<button type="button" id="addMore" class="btn btn-primary mt-2">
							+ Add More
						</button>-->
							<div class="col-md-12">
									<div class="d-md-flex d-grid justify-content-md-between">
										<button type="button" id="addMore" class="btn btn-primary mt-2">
								+ Add More
							</button>
							<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5">Purchase Stock</button>
								</div>
							</div>
						
						</form>
						<!----END-------->
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
$(document).ready(function () {

    /*$('#rows-wrapper').find('select:not(.normal)').select2({
        dropdownParent: $('#rows-wrapper'),
        width: '100%'
    });*/

});

//function select_product(product)
function select_product(el)
{
	$('#selling_price_div').html('');
	//$('.purchase-div').hide();
	$('.selling-div').hide();
	
	let row = $(el).closest('.item-row'); // current row
	let product = $(el).val();
	
	const myArray = product.split("@@@");
	let pid = parseInt(myArray[0]);
	//alert(pid);
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
				//$('#product_variant_id').html(html);
				 row.find('.unit-select').html(html);
			}
		}
	});
}
function get_selling_price(el)
{
	
	let row = $(el).closest('.item-row');
	let val = $(el).val();
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
			//$('#selling_price_div').html('<div class="text-danger">Selling price: ₹' + response.discount_price + '</div>');
			
			 row.find('.selling_price_div').html('<div class="text-danger">Selling price: ₹' + response.discount_price + '</div>');  
			 
			 row.find('.purchase_price').val(response.discount_price);
			 row.find('.hid_purchase_price').val(response.discount_price);
			 
			 //row.find('.purchase_price').val(response.discount_price).attr('data-max', response.discount_price);
		}
	});
}

$(document).on('input', '.purchase_price', function () {
	let row = $(this).closest('.item-row');
	let max = row.find('.hid_purchase_price').val();
    this.value = this.value.replace(/[^0-9.]/g, '');
	let val = parseFloat(this.value);
	if (val > max) {
        this.value = max;
    }
});


$('#addMore').click(function () {

	//$('.select2-dropdown').select2('destroy');
	
    let newRow = $('.item-row:first').clone();

    newRow.find('input').val('');
    newRow.find('select').val('');
	
	/*setTimeout(function () {
			$('.form-select');
			setTimeout(function () {
				$('.form-select').select2({
					minimumResultsForSearch: 0,
					width: '100%'
				});
			}, 100);
		}, 100);*/

    $('#rows-wrapper').append(newRow);
	
	
	/*setTimeout(function () {
		newRow.find('select:not(.normal)').select2({
			dropdownParent: newRow,
			width: '100%'
		});

	}, 50);*/
	
	/*$('.select2-dropdown').select2({
        minimumResultsForSearch: 0,
        width: '100%'
    });*/
	// re-init select2 for ALL rows
	
	
	/*$('select:not(.normal)').each(function () {
		$(this).select2({
			dropdownParent: $(this).parent()
		});
	});*/
    /*setTimeout(function () {
        newRow.find('.select2-dropdown').select2({
            width: '100%'
        });
    }, 50);*/
});

$(document).on('click', '.removeRow', function () {
    if ($('.item-row').length > 1) {
        $(this).closest('.item-row').remove();
    }
});

</script>
