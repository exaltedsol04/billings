<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	error_reporting(1);
	/*******End Auth Section*******/
	ob_start();
	/*=========== CODE START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST")
	{	
		extract($_POST);
		if($product != '' && $stock !='' && $stock_type!='')
		{
			//echo "<pre>";print_r($_POST);die;
			//if($_POST['selling_price'] > $_POST['purchase_price'])
			//{
				$explode_product = explode("@@@", $product);
				
				$product_id = $explode_product[0];
				$product_variant_id = $product_variant_id;
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id AND product_id=:product_id", array(':id'=> $product_variant_id, ':product_id'=>$product_id), 1);
				$loose_stock_quantity = '0.00';
				if($product_variant_dtls->type == 'loose'){
					
					$loose_stock_quantity = $stock;
					$stock = 0;
				}
				
				$remarks = !empty($remarks) ? $remarks : null;
				$field = "seller_id, product_id, product_variant_id, loose_stock_quantity, stock, stock_type, status,  reason,  processing_user_id, remarks, created_date, transaction_type";
				$value = ":seller_id, :product_id, :product_variant_id, :loose_stock_quantity, :stock, :stock_type, :status, :reason, :processing_user_id, :remarks, :created_date, :transaction_type";
					
					//parent_id
				$addExecute=array(
					':seller_id'			=> $_SESSION['SELLER_ID'],
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id),
					':stock'				=> -($stock),
					':stock_type'			=> $general_cls_call->specialhtmlremover($stock_type),
					':loose_stock_quantity'	=> -($loose_stock_quantity),
					':status'				=> 1,
					':transaction_type'		=> 6,
					':reason'		=> !empty($reason) ? $general_cls_call->specialhtmlremover($reason) : 0,
					':processing_user_id'		=> !empty($processing_user_id) ? $general_cls_call->specialhtmlremover($processing_user_id) : 0,
					':remarks'				=> !empty($remarks) ? $remarks : null,
					':created_date' 			=> date('Y-m-d H:i:s')
				);
				
				$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
				$sucMsg = "Stock Ddeducted Successfully";
				
				header("Location: ".SITE_URL.'deduct-stock-add?m=1');
				exit();
			/*}
			else{
				$erMsg = "Purchase price always less than selling price";
			}*/
			
		}
		else{
			header("Location: ".SITE_URL.'deduct-stock-add?m=2');
			$erMsg = "Please Fill All Fields";
		}
		
	}
/*=========== CODE END ===========*/
  //echo "<pre>";print_r($deductreason);die;
	ob_end_flush();
	
?>

<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/header.php"); ?>
<!-- ######### HEADER END ############### -->
  
<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/sellerMenu.php"); ?>
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
						<h5 class="mb-0 fw-bold">Deduct Stock</h5>
					  </div>
					  
					</div>
					<?PHP
						if(isset($_GET['m']) && $_GET['m']== '2')
						{
					?>
						<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong> Please Fill All Fields.</strong></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
						if(isset($_GET['m']) && $_GET['m']== '1')
						{
					?>
						<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
							<div class="text-white"><strong>Success</strong> Stock Ddeducted Successfully.</div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
					?>
						<form class="row g-4" action="" method="post" id="frmdeductstock">
							<!--<div class="col-md-6">
								<label for="input1" class="form-label">Products</label>
									<select name="product" id="product" class="form-select select2-dropdown" tabindex="1" onchange="select_product(this.value)" required>
									<option value="">Select...</option>
									<?PHP										
										$fields = "
											pr.product_id,
											MIN(pr.product_variant_id) as product_variant_id,

											SUM(pr.stock) as total_stock,
											SUM(pr.loose_stock_quantity) as total_loose_qty,

											MIN(pv.id) as variant_id,
											MAX(pv.measurement) as measurement,
											MAX(pv.type) as type,
											MAX(pv.discounted_price) as discounted_price,
											MAX(pv.stock_unit_id) as stock_unit_id,

											MAX(u.name) as stock_unit_name,
											MAX(u.parent_id) as parent_id,
											MAX(u.conversion) as conversion,

											MAX(p.name) as name,
											MAX(p.image) as image,
											MAX(p.barcode) as barcode,
											MAX(p.type) as product_type
										";

										$tables = PRODUCT_STOCK_TRANSACTION . " pr
										INNER JOIN " . PRODUCTS . " p 
											ON p.id = pr.product_id
										INNER JOIN " . PRODUCT_VARIANTS . " pv 
											ON pv.product_id = pr.product_id
										INNER JOIN " . UNITS . " u 
											ON u.id = pv.stock_unit_id
										";

										$where = "
										WHERE pr.status = :status
										AND pr.stock_type = :stock_type
										AND pr.seller_id = :seller_id

										GROUP BY 
											CASE 
												WHEN pv.type = 'loose' THEN pr.product_id
												ELSE pv.id
											END

										HAVING
										(
											(
												MAX(pv.type) = 'loose'
												AND SUM(pr.loose_stock_quantity) >=
												(
													CASE
														WHEN MAX(u.parent_id) != 0 AND MAX(u.conversion) > 0
															THEN MAX(pv.measurement) / MAX(u.conversion)
														ELSE MAX(pv.measurement)
													END
												)
											)
											OR
											(
												MAX(pv.type) != 'loose'
												AND SUM(
													CASE 
														WHEN pr.product_variant_id = pv.id THEN pr.stock
														ELSE 0
													END
												) > 0
											)
										)
										";

										$params = [
											':status' => 1,
											':stock_type' => 1,
											':seller_id' => $_SESSION['SELLER_ID'],
										];

										$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);



										//echo "<pre>"; print_r($sqlQuery);die;
										
										if($sqlQuery[0] != '')
										{
											foreach($sqlQuery as $arr)
											{	
												$barcode = $arr->barcode;
												
												$barcode = !empty($barcode) ?  '(' . $barcode .') ' : '';
									?>
												<option value="<?PHP echo $arr->product_id.'@@@'.$general_cls_call->cart_product_name($arr->name); ?>" <?php echo ($_POST['product'] == $arr->id.'@@@'.$general_cls_call->cart_product_name($arr->name)) ? 'selected' : '' ?>><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name); ?></option>
									<?PHP
											}
										}
									?>
								</select>
							</div>-->
							<div class="col-md-6">
								<label for="input1" class="form-label">Products <span class="text-danger">*</span></label>
								<select name="product" id="product" class="form-select form-select-sm select2-dropdown"  tabindex="1" onchange="product_stock_show(this.value)">
									<option value="">Select product</option>
									<?PHP
									$fields = "
										pv.id,
										pv.product_id,
										pv.type,
										pv.stock,
										pv.measurement,
										pv.discounted_price,
										pv.stock_unit_id,
										p.name,
										p.image,
										p.barcode,
										u.name as unit_name
									";

									$tables = PRODUCT_VARIANTS . " pv
									INNER JOIN " . PRODUCTS . " p 
										ON p.id = pv.product_id
									INNER JOIN " . UNITS . " u 
										ON u.id = pv.stock_unit_id

									/* pick only ONE loose variant per product */
									LEFT JOIN (
										SELECT product_id, MIN(id) AS keep_variant_id
										FROM " . PRODUCT_VARIANTS . "
										WHERE type = 'loose'
										GROUP BY product_id
									) loose_pick 
										ON loose_pick.keep_variant_id = pv.id
									";

									$where = "
									WHERE
									(
											pv.type != 'loose'
										 OR loose_pick.keep_variant_id IS NOT NULL
									)
									ORDER BY p.name
									";

									$params = [];

									$sqlQuery = $general_cls_call->select_join_query(
										$fields,
										$tables,
										$where,
										$params,
										2
									);
										//echo "<pre>"; print_r($sqlQuery);die;
										if($sqlQuery[0] != '')
										{
											foreach($sqlQuery as $arr)
											{	
												$barcode = $arr->barcode;
												$barcode = !empty($barcode) ?  '(' . $barcode .') ' : '';
												$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
												$unitname = $unit_dtls->name;
												if($arr->type == 'loose')
												{
													$measurement_arr = [
														'quantity' => 1 * $arr->measurement,
														'stock_unit_id' => $arr->stock_unit_id,
													];
													$measurement_units = $general_cls_call->convert_measurement($measurement_arr);			
													$unitname = $measurement_units['unit'];
												}
									?>
												<option value="<?PHP echo $arr->product_id.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$arr->id.'@@@'.$arr->type; ?>" <?php echo ($_POST['product'] == $arr->id.'@@@'.$general_cls_call->cart_product_name($arr->name)) ? 'selected' : '' ?>><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name); ?> (<?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?> - <?php echo $arr->type; ?>)</option>
									<?PHP
											}
										}
									?>
								</select>
							</div>
							<!--<div class="col-md-3">
								<label for="input5" class="form-label">Unit</label>
								<select name="product_variant_id" id="product_variant_id" class="form-select select2-dropdown" tabindex="1" required onchange="get_qry(this.value)">
									<option value="">Select...</option>
								</select>
							</div>-->
							<div class="col-md-3">
								<label for="input5" class="form-label">Stock Type <span class="text-danger">*</span></label>
								<select name="stock_type" id="stock_type" class="form-select select2-dropdown" tabindex="1" required onchange="get_stock_type(this.value)">
									<option value="">Select...</option>
									<!--<option value="1">POS</option>
									<option value="2">Online</option>-->
								</select>
							</div>

							<div class="col-md-3">
								<label for="input5" class="form-label">Deduct Quantity <span class="text-danger">*</span></label>
								<input type="text" class="form-control deduct-qty" name="stock" id="stock" placeholder="Deduct quantity" required>
								<span class="text-danger" id="err_stock"></span>
							</div>
							<input type="hidden" id="hid_deduct_qty">
							<div class="col-md-6">
								<label for="input2" class="form-label">Reason</label>
								<select name="reason" id="reason_id" class="form-select select2-dropdown" tabindex="1" onchange="get_reason(this.value)" required>
									<option value="">Select...</option>
									<?php 
									foreach($deductreason as $k=>$val)
									{
									?>
										<option value="<?php echo $k ?>"><?php echo $val ?></option>
									<?php 
									}
									?>
								</select>
								
							</div>
							
							<div class="col-md-6  prodessing-man" style="display:none">
								<label for="input5" class="form-label">Processing man</label>
								<select name="processing_user_id"  class="form-select select2-dropdown" tabindex="1" id="processing_user_id">
									<option value="">Select...</option>
									<option value="1">processing man 1</option>
									<option value="2">“processing man 2</option>
								</select>
								
							</div>
							<div class="col-md-12">
								<label for="input5" class="form-label">Remarks</label>
								<textarea name="remarks" id="remarks" class="form-control"></textarea>
								
							</div>
							<input type="hidden" id="stock_limit" name="stock_limit" value="<?php echo isset($_POST['stock_limit']) ? $_POST['stock_limit'] : '' ?>">
							<input type="hidden" id="product_variant_id" name="product_variant_id">
							<input type="hidden" id="product_id" name="product_id">
							<div class="col-md-12">
								<div class="d-md-flex d-grid justify-content-md-between">
									<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
									<button type="button" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5 load-submit success-button-show"  onclick="load_submit('frmdeductstock')">Deduct Stock</button> 
									<button type="button" name="btnUser" value="SAVE" class="btn btn-secondary px-5 secondary-button-show" style="display:none">Deduct Stock</button>
									
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
$(document).on('input', '.deduct-qty', function () {

    let max = $('#hid_deduct_qty').val();

    let value = this.value;
    //alert(value);
	value = value.replace('-', '');
	value = value.replace(/[^0-9.]/g, '');
	if ((value.match(/\./g) || []).length > 1) {
        value = value.substring(0, value.length - 1);
    }
    //alert(max);

    let num = parseFloat(value);
	
	if (num === 0) {
        $(this).val('');
        $('#err_stock').html('<div class="text-danger">Stock must be greater than 0</div>');
        return;
    }

    // max check
    if (parseFloat(value) > parseFloat(max)) {
		$('.deduct-qty').val(max);
		$('#err_stock').html('<div class="text-danger">Stock not exceed: ' + max + '</div>');
    } else {
        $(this).val(value);
        $('#err_stock').html('');
    }
});
function select_product(product)
{
	$('#selling_price_div').html('');
	$('.purchase-div').hide();
	$('.selling-div').hide();
	
	const myArray = product.split("@@@");
	let pid = parseInt(myArray[0]);
	//alert(pid);
	//var datapost = 'action=getDeductProductVariant&pid='+pid;
	var datapost = 'action=getMaxProductVariant&pid='+pid;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			if (result.length > 0) {
				var html = '<option value="">Select...</option>';
				$.each(result, function (i, variants) {
					var unit = variants.measurement + ' ' + variants.unitname + '  (' + variants.ptype +')';
					if(variants.type == 'loose') {
						var unit = variants.unitname + '  (' + variants.ptype +')';
					}
					html += '<option value='+ variants.id +'>' + unit +'</option>';
					
					if(variants.ptype == 'loose')
					{
						$('.deduct-qty').off('input').on('input', function(){
								this.value = this.value
									.replace(/[^0-9.]/g, '')   // allow dot
									.replace(/(\..*)\./g, '$1'); // allow only one dot
							});
					}
					else{
						$('.deduct-qty').off('input').on('input', function(){
								this.value = this.value
									.replace(/[^0-9]/g, '')   // allow dot
									.replace(/(\..*)\./g, '$1'); // allow only one dot
							});
					}
				});
				$('#product_variant_id').html(html);
				
			}
		}
	});
}

function get_qry(val)
{
	var datapost = 'action=getDeductProductVariantQry&pvid='+val;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		dataType: "json",
		success: function(response){
			//var result = JSON.parse(response);
			//alert(response[0].stock);
			var variant_stock = response[0].stock;
			if(response[0].type == 'loose') {
				variant_stock = response[0].stock.toFixed(2);
			}
			$('.deduct-qty').val(variant_stock);
			$('#hid_deduct_qty').val(variant_stock);
			
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
}
function get_reason(val)
{
	if(val== 1)
	{
		$('.prodessing-man').show();
		 $('#processing_user_id').prop('required', true);
	}
	else{
		$('.prodessing-man').hide();
		$('#processing_user_id').prop('required', false);
	}
}

function product_stock_show(product)
{
	$('#err_stock').html('');
	$('#hid_deduct_qty').val('');
	$('.deduct-qty').prop('disabled', false);
	$('#stock_type').val('').trigger('');
	let optionHtml = '<option value="">Select..</option>';
	optionHtml += '<option value="1">POS</option>';
	optionHtml += '<option value="2">Online</option>';
	$('#stock_type').html(optionHtml);
	
	$('.load-submit').prop('disabled', false);
	$('.success-button-show').show();
	$('.secondary-button-show').hide();
	
	$('#stock-check-div').html('');
	$('#check-stock-div').html('');
	$('#check-stock-pay-div').html('');
	const myArray = product.split("@@@");
	let pid = parseInt(myArray[0]);
	let pvid = parseInt(myArray[2]);
	let ptype = myArray[3];
	//alert(pid);alert(pvid);alert(ptype);
	$('#product_variant_id').val(pvid);
	$('#product_id').val(pid);
}


function get_stock_type(type)
{
	$('#err_stock').html('');
	$('#hid_deduct_qty').val('');
	$('.deduct-qty').val('');
	$('.deduct-qty').prop('disabled', false);
	$('.load-submit').prop('disabled', false);
	
	let pvid = $('#product_variant_id').val();
	let pid = $('#product_id').val();
	//alert(type);alert(pid);alert(pvid);
	var datapost = 'action=deductCheckVariant&pvid=' + pvid + '&pid=' + pid + '&type=' + type;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			if (result.length > 0) {
				
				$.each(result, function (i, stock) {
					//alert(stock.product_variant_id);
					var unitname = stock.measurement+ ' ' +stock.variant_name;
					var variant_stock = stock.variant_stock;
					//var variant_stock_online = stock.variant_stock_online;
					if(stock.product_type == 'loose') {
						unitname = stock.variant_name;
						//variant_stock = stock.variant_stock.toFixed(2);
						variant_stock = variant_stock.toFixed(2);
						//variant_stock_online = stock.variant_stock_online.toFixed(2);
					}
					
					//$('#stock_limit').val(variant_stock);
					$('#hid_deduct_qty').val(variant_stock);
					
					if(variant_stock > 0)
					{
						$('.success-button-show').show();
						$('.secondary-button-show').hide();
						$('#err_stock').html('<div class="text-danger">Stock not exceed: ' + variant_stock + '</div>');
					}
					else if(variant_stock == 0)
					{
						$('.deduct-qty').prop('disabled', true);
						$('#err_stock').html('<div class="text-danger">You have no stock</div>');
						$('.load-submit').prop('disabled', true);
						$('.success-button-show').hide();
						$('.secondary-button-show').show();
					}
					else if(variant_stock < 0)
					{
						$('.deduct-qty').prop('disabled', true);
						$('#err_stock').html('<div class="text-danger">Cannot deduct -ve stock' + variant_stock + '</div>');
						$('.load-submit').prop('disabled', true);
						$('.success-button-show').hide();
						$('.secondary-button-show').show();
       
					}
					
					
				});
				
				
				//$('#stock-check-div').html(html);
			}
		}
	});
}
</script>
