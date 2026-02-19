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
	/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		if($product != '' && $stock !='')
		{
			if($stock > $stock_limit)
			{
				$erMsg = "Stock Quantity Greater Than Available Stock.";
			}
			elseif($product_variant_id == '')
			{
				$erMsg = "Please select the unit.";
			}
			else{
				//echo "<pre>";print_r($_POST);die;
				$explode_product = explode("@@@", $product);
				$product_variant_id = $product_variant_id;
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
				
				//------- add stock to product variant table-----
				$product_variant_stock_exists = $product_variant_dtls->stock;
				$product_variant_stock = $product_variant_stock_exists + $stock;
				if($product_variant_dtls->type == 'loose'){
					$get_data = $general_cls_call->select_query("*", UNITS, "WHERE id=:id", array(':id'=>$product_variant_dtls->stock_unit_id), 1);
					if($get_data->parent_id != 0){
						$loose_stock_quantity = ($loose_stock_quantity * $get_data->conversion) / $product_variant_dtls->measurement;
					}
					$product_variant_stock = $product_variant_stock_exists + $loose_stock_quantity;
				}
				$setValuesPv = "stock=:stock, status=:status";
				$updateExecutePv=array(
					':stock' => $product_variant_stock,
					':status' => 1,
					':product_id'	=> $product_id,
					':id'	=> $product_variant_id
				);
				//echo '<pre>'; print_r($updateExecutePv);die;
				$whereClausePv=" WHERE  product_id=:product_id AND id=:id";
				$general_cls_call->update_query(PRODUCT_VARIANTS, $setValuesPv, $whereClausePv, $updateExecutePv);
				
				
				$setValuesPr = "status=:status";
				$updateExecutePr=array(
					':status' => 1,
					':id'	=> $product_id
				);
				$whereClausePr=" WHERE  id=:id";
				$general_cls_call->update_query(PRODUCTS, $setValuesPr, $whereClausePr, $updateExecutePr);
				
				$sucMsg = "Stock Inserted Successfully";
			}
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
								<label for="input1" class="form-label">Products</label>
								<select name="product[]" class="form-select form-select-sm select2-dropdown"  tabindex="1" onchange="product_stock_show(this.value)">
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
								<label for="input5" class="form-label">Unit</label>
								<!--<select name="product_variant_id" id="product_variant_id" class="form-select select2-dropdown" tabindex="1" onchange="unit_measurement(this.value)">
									<option value="">Select...</option>
								</select>-->
								<span id="all_unit_name" class="text-danger d-block mt-2"></span>
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">Stock Quantity<span class="text-danger" id="show_unit_type"></span></label>
								<input type="text" class="form-control" name="stock" id="stock" placeholder="Stock quantity" oninput="this.value = this.value.replace(/[^0-9.]/g, '')" value="<?php echo isset($_POST['stock']) ? $_POST['stock'] : '' ?>">
								<span class="text-danger" id="err_stock"></span>
							</div>
							<input type="hidden" id="stock_limit" name="stock_limit" value="<?php echo isset($_POST['stock_limit']) ? $_POST['stock_limit'] : '' ?>">
							<input type="hidden" id="hid_product_id">
							<input type="hidden" id="hid_variant_id">
							<span id="stock-check-div"></span>
							<div class="col-md-12">
								<div class="d-md-flex d-grid justify-content-md-between">
									<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
									<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5">Assign</button>
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
$(document).ready(function() {
	let product = $('#product').val();
	if(product !='')
	{
		product_stock_show(product)
	}
});


function product_stock_show(product)
{
	$('#stock-check-div').html('');
	$('#check-stock-div').html('');
	$('#check-stock-pay-div').html('');
	const myArray = product.split("@@@");
	let pid = parseInt(myArray[0]);
	let pvid = parseInt(myArray[2]);
	let ptype = myArray[3];
	//alert(ptype);
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
				var html = 'Available product in ';
				var comma = ',';
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
					
					html += '<span class="me-1">['+ variants.unitname + comma + ']</span>';
				});
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
				var html = '<div class="col-md-5">';
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
						html += '<span class="col-md-10 fw-bold text-break text-nowrap" style="color:#A300A3">Product name: ' +stock.product_name + '</span>';
						html += '<span class="col-md-2 text-danger fw-bold text-end text-nowrap">' + unitname + '</span>';
					html += '</div>';
					html += '<div class="row align-items-start border-bottom py-2">';
						html += '<span class="col-md-10 fw-bold text-nowrap" style="color:#A300A3">POS stock</span>';
						html += '<span class="col-md-2 text-danger fw-bold text-end text-nowrap">' + variant_stock + '</span>';
					html += '</div>';
					html += '<div class="row align-items-start border-bottom py-2">';
						html += '<span class="col-md-10 fw-bold text-nowrap" style="color:#A300A3">Online stock</span>';
						html += '<span class="col-md-2 text-danger fw-bold text-end text-nowrap">' + variant_stock_online + '</span>';
					html += '</div>';
					$('#stock_limit').val(stock.variant_stock);
				});
				html += '</div>';
				
				$('#stock-check-div').html(html);
			}
		}
	});
}
</script>