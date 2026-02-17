<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	/*=========== CODE START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		if($product != '' && $stock !='')
		{
			//echo "<pre>";print_r($_POST);die;
			//if($_POST['selling_price'] > $_POST['purchase_price'])
			//{
				$explode_product = explode("@@@", $product);
				
				$product_id = $explode_product[0];
				$product_variant_id = $product_variant_id;
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id AND product_id=:product_id", array(':id'=> $product_variant_id, ':product_id'=>$product_id), 1);
				
				$remarks = !empty($remarks) ? $remarks : null;
				$field = "seller_id, product_id, product_variant_id, stock, status,  reason,  processing_user_id, remarks, created_date, transaction_type";
				$value = ":seller_id, :product_id, :product_variant_id, :stock, :status, :reason, :processing_user_id, :remarks, :created_date, :transaction_type";
					
					//parent_id
				$addExecute=array(
					':seller_id'			=> $_SESSION['SELLER_ID'],
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id),
					':stock'				=> -($stock),
					':status'				=> 1,
					':transaction_type'		=> 6,
					':reason'		=> $general_cls_call->specialhtmlremover($reason),
					':processing_user_id'		=> $general_cls_call->specialhtmlremover($processing_user_id),
					':remarks'				=> $remarks,
					':created_date' 			=> date('Y-m-d H:i:s')
				);
				if($product_variant_dtls->type == 'loose'){
					$field .= ", loose_stock_quantity";
					$value .= ", :loose_stock_quantity";

					$addExecute[':loose_stock_quantity'] = -($product_variant_dtls->measurement * $stock);
				}
				$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
				$sucMsg = "Stock Ddeducted Successfully";
			/*}
			else{
				$erMsg = "Purchase price always less than selling price";
			}*/
			
		}
		else{
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
								<label for="input1" class="form-label">Products</label>
									<select name="product" id="product" class="form-select select2-dropdown" tabindex="1" onchange="select_product(this.value)" required>
									<option value="">Select...</option>
									<?PHP
										/*$fields = "pr.id, pr.product_id, pr.product_variant_id, pr.status, SUM(pr.stock) as total_stock, pr.selling_price, u.name as stock_unit_name, pv.measurement, p.name, p.image, p.barcode";
										$tables = PRODUCT_STOCK_TRANSACTION . " pr
										INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
										INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
										INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
										$where = "WHERE pr.status=:status AND pr.seller_id =:seller_id AND pr.stock_type=:stock_type GROUP BY pr.product_id HAVING SUM(pr.stock) > 0";
										$params = [
											':status' => 1,
											':stock_type' => 1,
											':seller_id' => $_SESSION['SELLER_ID'],
										];
										$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);*/
										
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
							</div>
							<div class="col-md-3">
								<label for="input5" class="form-label">Unit</label>
								<select name="product_variant_id" id="product_variant_id" class="form-select select2-dropdown" tabindex="1" required onchange="get_qry(this.value)">
									<option value="">Select...</option>
								</select>
							</div>

							<div class="col-md-3">
								<label for="input5" class="form-label">Deduct Quantity</label>
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
							<div class="col-md-12">
								<div class="d-md-flex d-grid justify-content-md-between">
									<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
									<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5">Deduct Stock</button>
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

    //let row = $(this).closest('.item-row');
    //row.find('.selling_price_div').html('');

    let max = $('#hid_deduct_qty').val();

    let value = this.value;
    
    // allow only numbers + decimal
    //value = value.replace(/[^0-9]/g, '');

    // prevent multiple decimals
    //value = value.replace(/(\..*?)\..*/g, '$1');

    // limit 2 digits after decimal
    //alert(max);

    let num = parseFloat(value);

    // max check
    if (value > max) {
		$('.deduct-qty').val(max);
		$('#err_stock').html('<div class="text-danger">Stock not exceed: ' + max + '</div>');
    }
	else if(value == '0')
	{
		$('.deduct-qty').val(max);
	}
	else{
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
					html += '<option value='+ variants.id +'>' + variants.measurement + ' ' + variants.unitname + '  (' + variants.ptype +' )</option>';
					
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
			$('.deduct-qty').val(response[0].stock);
			$('#hid_deduct_qty').val(response[0].stock);
			
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
</script>
