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

error_reporting(1);
	ob_start();
	/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST")
	{	
		extract($_POST);
		if($product != '' && $stock !='')
		{
			if($stock > $stock_limit)
			{
				$erMsg = "Stock Quantity Greater Than Available Stock.";
				header("Location: ".SITE_URL.'online-stock-transfer?m=2');
			}
			/*elseif($product_variant_id == '')
			{
				$erMsg = "Please select the unit.";
			}*/
			else{
				//echo '<script>window.onload = function() {load_submit();}</script>';
				//echo "<pre>";print_r($_POST);die;
				$explode_product = explode("@@@", $product);
				//echo "<pre>";print_r($explode_product);die;
				$product_variant_id = $explode_product[2];
				$product_id = $explode_product[0];
				$stock = $stock;
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id AND product_id=:product_id", array(':id'=> $product_variant_id, ':product_id'=>$product_id), 1);
				$selling_price = $product_variant_dtls->discounted_price;
				$purchase_price = $product_variant_dtls->price;
				
				$field = "seller_id, product_variant_id, product_id, stock, loose_stock_quantity, stock_type, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id, approved_by, approved_date, order_id";
				$value = ":seller_id, :product_variant_id, :product_id, :stock, :loose_stock_quantity, :stock_type, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id";

				$loose_stock_quantity = '0.00';
				if($product_variant_dtls->type == 'loose'){
					$loose_stock_quantity = $stock;
					$stock = 0;
				}	
				//parent_id
				$addExecute=array(
					':seller_id'			=> $_SESSION['SELLER_ID'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),					
					':stock'				=> $stock,
					':loose_stock_quantity'	=> $loose_stock_quantity,
					':stock_type'			=> 2,
					':created_date'			=> date("Y-m-d H:i:s"),
					':status'				=> 1,
					':selling_price'		=> $general_cls_call->specialhtmlremover($selling_price),
					':purchase_price'		=> $general_cls_call->specialhtmlremover($purchase_price),
					':transaction_type'		=> 5,
					':received_selled_id'	=> 0,
					':parent_id'	=> 0,
					':approved_by'			=> 0,
					':approved_date' 		=> '0000-00-00 00:00:00',
					':order_id'		       => 0,
				);
				
				$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
				
				$addExecute=array(
					':seller_id'			=> $_SESSION['SELLER_ID'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					
					':stock'				=> -($stock),
					':loose_stock_quantity'	=> -($loose_stock_quantity),
					':stock_type'			=> 1,
					':created_date'			=> date("Y-m-d H:i:s"),
					':status'				=> 1,
					':selling_price'		=> $general_cls_call->specialhtmlremover($selling_price),
					':purchase_price'		=> $general_cls_call->specialhtmlremover($purchase_price),
					':transaction_type'		=> 5,
					':received_selled_id'	=> 0,
					':parent_id'	=> 0,
					':approved_by'			=> 0,
					':approved_date' 		=> '0000-00-00 00:00:00',
					':order_id'		       => 0,
				);
				$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
				
				$product_variant_stock_exists = $ruf->available_stock_report(['product_id' => $product_id, 'product_variant_id' => $product_variant_id, 'product_type' => $product_variant_dtls->type]);
				
				//echo '--'.$product_variant_stock_exists->available_stock;
				//echo '<pre>'; print_r($product_variant_stock_exists); die;
				//------- add stock to product variant table-----
				//$product_variant_stock_exists = $product_variant_dtls->stock;
				//$product_variant_stock = $product_variant_stock_exists->available_stock + $stock;
				$product_variant_stock = $product_variant_stock_exists->available_stock ?? 0;
				if($product_variant_dtls->type == 'loose'){
					$get_data = $general_cls_call->select_query("*", UNITS, "WHERE id=:id", array(':id'=>$product_variant_dtls->stock_unit_id), 1);
					if($get_data->parent_id != 0){
						$loose_stock_quantity = ($loose_stock_quantity * $get_data->conversion) / $product_variant_dtls->measurement;
					}
					//$product_variant_stock = $product_variant_stock_exists->available_stock + $loose_stock_quantity;
					$product_variant_stock = $product_variant_stock_exists->available_stock ?? 0;
				}
				//echo $product_variant_stock; die;
				if ($product_variant_dtls->type === 'loose') {
					$whereClausePv = "WHERE product_id = :product_id";
				} else {
					$whereClausePv = "WHERE id = :product_variant_id";
				}
				$setValuesPv = "stock=:stock, status=:status";
				$updateExecutePv=array(
					':stock' => $product_variant_stock,
					':status' => 1
				);
				if ($product_variant_dtls->type === 'loose') {
					$updateExecutePv[':product_id'] = $product_id;
				} else {
					$updateExecutePv[':product_variant_id'] = $product_variant_id;
				}
				//echo '<pre>'; print_r($updateExecutePv);die;
				//$whereClausePv=" WHERE  product_id=:product_id AND id=:id";
				$general_cls_call->update_query(PRODUCT_VARIANTS, $setValuesPv, $whereClausePv, $updateExecutePv);
				
				
				$setValuesPr = "status=:status";
				$updateExecutePr=array(
					':status' => 1,
					':id'	=> $product_id
				);
				$whereClausePr=" WHERE  id=:id";
				$general_cls_call->update_query(PRODUCTS, $setValuesPr, $whereClausePr, $updateExecutePr);
				
				$sucMsg = "Stock Inserted Successfully";
				header("Location: ".SITE_URL.'online-stock-transfer?m=1');
				exit();
			}
		}
		else{
			header("Location: ".SITE_URL.'online-stock-transfer?m=3');
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
						<h5 class="mb-0 fw-bold">Online stock</h5>
					  </div>
					  
					</div>
					<?PHP
						if(isset($_GET['m']) && ($_GET['m']== '2' || $_GET['m']== '3'))
						{
					?>
						<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong><?PHP echo $Error_mesg; ?></strong> <?PHP echo $_GET['m'] == 2 ? 'Stock Quantity Greater Than Available Stock.' : 'Please Fill All Fields.'; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
						if(isset($_GET['m']) && $_GET['m']== '1')
						{
					?>
						<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
							<div class="text-white"><strong>Success</strong> Stock Inserted Successfully</div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
					?>
						<form class="row g-4" action="" method="post" id="frmSubmit">
							<!--<div class="col-md-12">
								<label for="input1" class="form-label">Products</label>
								<select name="product" id="product" onchange=product_stock_show(this.value) class="form-select select2-dropdown" tabindex="1">
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
							</div>-->
							
							<div class="col-md-12">
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
							<div class="col-md-6">
								<label for="input5" class="form-label">Stock Quantity <span class="text-danger">*</span><span class="text-danger" id="show_unit_type"></span></label>
								<input type="text" class="form-control stock_quantity" name="stock" id="stock" placeholder="Stock quantity" value="<?php echo isset($_POST['stock']) ? $_POST['stock'] : '' ?>">
								<input type="hidden" id="hid_product_type">
								<!--<input type="text" class="form-control stock_quantity" name="stock" id="stock" placeholder="Stock quantity" oninput="this.value = this.value.replace(/[^0-9.]/g, '')" value="<?php echo isset($_POST['stock']) ? $_POST['stock'] : '' ?>">-->
								<span class="text-danger" id="err_stock"></span>
							</div>
							<div class="col-md-6" id="all_unit_name">
								<!--<label for="input5" class="form-label">Unit</label>
								<select name="product_variant_id" id="product_variant_id" class="form-select select2-dropdown" tabindex="1" onchange="unit_measurement(this.value)">
									<option value="">Select...</option>
								</select>-->
								
							</div>
							<input type="hidden" id="stock_limit" name="stock_limit" value="<?php echo isset($_POST['stock_limit']) ? $_POST['stock_limit'] : '' ?>">
							<input type="hidden" id="hid_product_id">
							<input type="hidden" id="hid_variant_id">
							<div class="col-md-6"></div>
							<div class="col-md-6" id="stock-check-div"></div>
					
							<div class="col-md-12">
								<div class="d-md-flex d-grid justify-content-md-between">
									<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
									<button type="button" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5 load-submit success-button-show" onclick="load_submit('frmSubmit')">Assign
									</button>
									<button type="button" name="btnUser" value="SAVE" class="btn btn-secondary px-5 secondary-button-show" style="display:none">Assign</button>
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
$(document).on('input', '.stock_quantity', function () {
	
	$('.success-button-show').show();
	$('.secondary-button-show').hide();
    let product_type  = $('#hid_product_type').val();
	//alert(product_type);
	
	/*let allowedDecimals = [
		0.01, 0.02, 0.025, 0.05,
		0.1, 0.2, 0.25, 0.5, 0.75
	];*/
	
	if (product_type === 'loose') {

        this.value = this.value.replace(/[^0-9.]/g, '');

        // Prevent multiple dots
        if ((this.value.match(/\./g) || []).length > 1) {
            this.value = this.value.slice(0, -1);
        }

        let value = this.value;

        // If decimal exists
        if (value.includes('.')) {

            let parts = value.split('.');
            let integerPart = parts[0];
            let decimalPart = parts[1];

            // Limit to max 3 decimal digits
            if (decimalPart.length > 3) {
                decimalPart = decimalPart.substring(0, 3);
                this.value = integerPart + '.' + decimalPart;
                return;
            }

            let fullNumber = parseFloat(this.value);

            if (!isNaN(fullNumber)) {
                let decimalValue = parseFloat((fullNumber % 1).toFixed(3));

                if (decimalValue !== 0 && !allowedDecimals.includes(decimalValue)) {
                    $('#err_stock').html(
                        '<div class="text-danger">Invalid loose quantity</div>'
                    );
					$('.success-button-show').hide();
					$('.secondary-button-show').show();
                } else {
                    $('#err_stock').html('');
                }
            }
        } else {
            $('#err_stock').html('');
        }
    }
	else{
		//this.value = this.value.replace(/[^0-9]/g, '') .replace(/(\..*)\./g, '$1');
		this.value = this.value.replace(/[^0-9]/g, '');
		// Remove leading zero
        if (this.value.length > 1) {
            this.value = this.value.replace(/^0+/, '');
        }

        // If first digit is 0 and only one digit, clear it
        if (this.value === '0') {
            this.value = '';
        }
		
	}
	
});

$(document).ready(function() {
	let product = $('#product').val();
	if(product !='')
	{
		product_stock_show(product)
	}
});


function product_stock_show(product)
{
	$('.success-button-show').show();
	$('.secondary-button-show').hide();
	$('#err_stock').html('');
	
	$('#stock-check-div').html('');
	$('#check-stock-div').html('');
	$('#check-stock-pay-div').html('');
	const myArray = product.split("@@@");
	let pid = parseInt(myArray[0]);
	let pvid = parseInt(myArray[2]);
	let ptype = myArray[3];
	//alert(ptype);
	$('#hid_product_type').val(ptype);
	$('.stock_quantity').val('');
	
	
	//alert(pid);alert(pvid);
	$('#hid_product_id').val(pid);
	$('#hid_variant_id').val(pvid);
	//let pvid = parseInt(myArray[6]);
	//var datapost = 'action=onlineProductStock&pvid=' + pvid + '&pid=' + pid;
	/*var datapost = 'action=onlineProductStock&pid=' + pid;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			//alert(result.length);
			if (result.length > 0) {
				var htmlsel = '<option value="">Select...</option>';
				$.each(result, function (i, stock) {
					htmlsel += '<option value='+ stock.product_variant_id +'>' + stock.variant_name + '</option>';
				});
				$('#product_variant_id').html(htmlsel);
			}
			else{
				var htmlsel = '<option value="">Select...</option>';
				$('#product_variant_id').html(htmlsel);
			}
		}
	});*/
	//var datapost = 'action=getMaxProductVariant&pid='+pid;
	var datapost = 'action=getProductVariantOnlineTransfer&pid='+pid+'&pvid=' + pvid + '&ptype='+ ptype;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			if (result.length > 0) {
				/*var html = '<option value="">Select...</option>';
				$.each(result, function (i, variants) {
					html += '<option value='+ variants.id +'>' + variants.unitname +' ('+ variants.ptype +')</option>';
					
				});
				$('#product_variant_id').html(html);*/
				let totrec = result.length;
				var html = '<label for="input5" class="form-label">Unit</label><span class="text-danger d-block mt-2">Available product in [';
				var comma = ', ';
				$.each(result, function (i, variants) {
					
					if(totrec == 1 + parseInt(i))
					{
						comma = '';
					}
					
					if(i == 0)
					{
						let stock_type = ' [' + variants.unitname + '-' + ptype + ']';
						$('#show_unit_type').html(stock_type);
					}
					
					html += variants.unitname + comma;
				});
				html += ']</span>';
				$('#all_unit_name').html(html);
				
				
			}
			
			unit_measurement(pvid)
		}
	});
}

function unit_measurement(pvid)
{
	//alert(pid);
	let pid = $('#hid_product_id').val();
	var datapost = 'action=onlineCheckVariant&pvid=' + pvid + '&pid=' + pid;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			if (result.length > 0) {
				var html = '<div class="col-md-12">';
				$.each(result, function (i, stock) {
					//alert(stock.product_variant_id);
					var unitname = stock.measurement+ ' ' +stock.variant_name;
					var variant_stock = stock.variant_stock;
					var variant_stock_online = stock.variant_stock_online;
					if(stock.product_type == 'loose') {
						unitname = stock.variant_name;
						variant_stock = stock.variant_stock.toFixed(2);
						variant_stock_online = stock.variant_stock_online.toFixed(2);
					}
					html += '<div class="row align-items-start border-bottom py-2">';
						html += '<div class="col-10 fw-bold" style="color:#A300A3">Product name: ' +stock.product_name + '</div>';
						html += '<div class="col-2 text-danger fw-bold text-end">' + unitname + '</div>';
					html += '</div>';
					html += '<div class="row align-items-start border-bottom py-2">';
						html += '<div class="col-8 fw-bold" style="color:#A300A3">POS stock</div>';
						html += '<div class="col-4 text-danger fw-bold text-end">' + variant_stock + '</div>';
					html += '</div>';
					html += '<div class="row align-items-start border-bottom py-2">';
						html += '<div class="col-8 fw-bold" style="color:#A300A3">Online stock</div>';
						html += '<div class="col-4 text-danger fw-bold text-end text-nowrap">' + variant_stock_online + '</div>';
					html += '</div>';
					$('#stock_limit').val(variant_stock);
				});
				html += '</div>';
				
				$('#stock-check-div').html(html);
			}
		}
	});
}
</script>