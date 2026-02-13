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
		//if(isset($sucMsg) && $sucMsg != '')
		//{
	?>
	 
		<div class="alert alert-success border-0 bg-success alert-dismissible fade show success-message" style="display:none">
			<div class="text-white"><strong><?PHP echo 'Data has been submitted successfully'; ?></strong></div>
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<?PHP
		//}
	?>
	
		  <div class="row">
			<div class="col-5 col-xl-5">
				<select name="product" id="product" onchange=check_product_stock_onchange(this.value) class="form-select select2-dropdown" tabindex="1">
					<option value="">Select...</option>
					<?PHP
						$fields = "
							pr.product_id,
							pr.product_variant_id,
							SUM(pr.stock) as total_stock,
							SUM(pr.loose_stock_quantity) as total_loose_qty,
							pv.id as variant_id,
							pv.measurement,
							pv.type,
							pv.discounted_price,
							u.name as stock_unit_name,
							p.name,
							p.image,
							p.barcode,
							p.type as product_type
						";

						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCTS . " p 
							ON p.id = pr.product_id
						INNER JOIN " . PRODUCT_VARIANTS . " pv 
							ON pv.product_id = pr.product_id   -- IMPORTANT for loose
						INNER JOIN " . UNITS . " u 
							ON u.id = pv.stock_unit_id";

						$where = "
						WHERE pr.status = :status
						AND pr.stock_type = :stock_type
						AND pr.seller_id = :seller_id

						GROUP BY pr.product_id, pv.id

						HAVING
						(
							-- LOOSE → stock must support this variant size
							(pv.type = 'loose' AND SUM(pr.loose_stock_quantity) >= pv.measurement)

							OR

							-- NORMAL → variant specific stock must exist
							(pv.type != 'loose'
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
						if($sqlQuery[0] != '')
						{
							foreach($sqlQuery as $arr)
							{	
							    $barcode = $arr->barcode;
								$barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
					?>
								<option value="<?PHP echo $arr->variant_id.'@@@'.$arr->discounted_price.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$imagePath.'@@@'.$barcode.'@@@'.$arr->measurement.'@@@'.$arr->stock_unit_name.'@@@'.$arr->type.'@@@'.$arr->product_id; ?>"><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name).' ('.$arr->measurement.' '.$arr->stock_unit_name.')'; ?></option>
					<?PHP
							}
						}
					?>
				</select>
				<span class="text-danger" id="err_product"></span>
			</div>
			<div class="col-md-5">
				<select name="seller_id" id="seller_id" class="form-select select2-dropdown" tabindex="1" onchange="sellers(this.value)">
					<option value="">Select...</option>
					<?PHP
						$sqlQuery = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id!=:admin_id", array(':admin_id'=>$_SESSION['USER_ID']), 2);
						if($sqlQuery[0] != '')
						{
							foreach($sqlQuery as $arr)
							{	
					?>
						<option value="<?PHP echo $arr->id ?>"><?PHP echo $arr->name; ?></option>
					<?PHP
							}
						}
					?>
				</select>
				<span class="text-danger" id="err_seller"></span>
			</div>
			<div class="col-2 col-xl-2">
				<button id="removeCart" class="btn btn-grd btn-grd-danger mb-3 pull-right" style="display:none" type="button" onclick="clearCart()" class="removeAll" data-toggle="tooltip" title="Clear Your Cart">Clear Request</button>
			</div>
		</div>
    </div>
	<div class="card">
		<div class="card-body">	
			<form name="frm" action="" method="post" id="stock-list-form">
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						  <thead>
							<tr>
								<th class="text-center">Sl. No.</th>
								<th>Product</th>
								<th class="text-center">Type</th>
								<th class="text-center" style="width:160px">Qty</th>
								<th class="text-center">Measurement</th>
								<th class="text-center">Price</th>
								<th class="text-center">Total Price</th>
								<th class="text-center">Remove</th>
							</tr>
						  </thead>
						  <tbody id="stock-cart">
							</tbody>
						  <tfoot id="total_amount_show" style="font-weight:bold; font-size:20px">
						  </tfoot>
					</table>
				</div>
				<span id="show-stock-div"></span>
				<div class="box-footer text-center">
				<span id="qty-total"></span>
						<div class="loader" id="loader1" style="display:none"></div>
						<button type="button" name="btnSubmit" value="SAVE" class="btn btn-grd btn-grd-success px-5 submit-stock-transfer" onclick="submit_request();">Transfer</button>
				</div>
				<input type="hidden" name="action" value="checkStockTransferItem" id="actionstatus">
				<input type="hidden" name="hid_seller_id"  id="hid_seller_id">
				<input type="hidden" name="product_id"  id="product_id">
			</form>
		</div>
	</div>	
	
	<!-- Modal -->
			<div class="modal fade" id="product-modal">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header border-bottom-0 py-2 bg-grd-primary">
                        <h5 class="modal-title btn-grd">Products Available Stock</h5>
                        <a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
                          <i class="material-icons-outlined">close</i>
                        </a>
                      </div>
                      <div class="modal-body">
							<span id="show-products"></span>
                      </div>
                      <div class="modal-footer border-top-0">
                        <button type="button" class="btn btn-grd btn-grd-danger rounded-0"
                          data-bs-dismiss="modal">Cancel</button>
                      </div>
                    </div>
                  </div>
                </div>
</main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->
	<script src="assets/plugins/es/stock-transfer.js"></script>
	<link rel="stylesheet" href="assets/plugins/notifications/css/lobibox.min.css">
	<script src="assets/plugins/notifications/js/lobibox.min.js"></script>
	<?php if (!empty($_SESSION['call_js'])) { ?>
		<script>
			clearCart();
		</script>
	<?php unset($_SESSION['call_js']); } ?>


  </body>
</html>
<script>
$(document).ready(function(){
	//Start Increase and Decrease
	Object.keys(localStorage).forEach(key => {

		if (key.startsWith('transfer-stock-limit') && key.endsWith('-value')) {

			let inputId = key.replace('-value', '');

			// ✅ get correct product id
			let pidKey = inputId + '-pid';
			let pid = localStorage.getItem(pidKey);

			// fallback safety
			if (!pid) return;

			if ($('#' + inputId).length === 0) {
				$('#qty-total').append(
					`<input type="text" class="transfer-pid-${pid}" id="${inputId}">`
				);
			}

			let storedValue = localStorage.getItem(key);
			$('#' + inputId).val(storedValue ?? '');
		}

	});
	//End Increase and Decrease
});
function check_qty_stock(id, inc, productMeasurement, pid, callback)
{
	let rw = productMeasurement;
    $('.pid-'+pid).each(function () {
        rw += parseFloat($(this).val()) || productMeasurement;
    });
	let pvqty = $('#qty_' + id).val();
	if(typeof pvqty === 'undefined'){
		pvqty = 0;
	}
	let barcode = 1;
	var datapost = 'action=paynow&id='+id + '&rw='+rw + '&barcode=' + barcode;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			var stockCount = 0;
			var product_type = '';
			var total_stock = '';
			if (callback) callback(); // run increment logic AFTER update
			
			if (result.length > 0) {
				
				$.each(result, function (i, stock) {
					stockCount = parseInt(stockCount) + parseInt(stock.variant_stock);
					product_type = stock.product_type;
					total_stock = stock.total_stock;
				});
				//alert(total_stock);
				//console.log(inc, stockCount);
				if(inc >= stockCount)
				{
					//alert(product_type);
					//Start Increase and Decrease
					let inputId = 'transfer-stock-limit' + id;
					if(product_type == 'loose') {
						inputId = 'transfer-stock-limitp' + pid;
					}
					// save state
					localStorage.setItem(inputId + '-value', '');
					localStorage.setItem(inputId + '-pid', '');
					localStorage.setItem(inputId, 'visible');
					
					if ($('#' + inputId).length === 0) {
					  $('#qty-total').append(`<input type="text" class="transfer-pid-${pid}" id="${inputId}">`);
					} else {
					  $('#' + inputId).show();
					}
					var cart_item_count = stockCount;					
					if(product_type == 'loose') {
						cart_item_count = total_stock;
					}
				
					$('#' + inputId).val(cart_item_count === 0 ? '' : cart_item_count);
					
					localStorage.setItem(inputId + '-value', cart_item_count === 0 ? '' : cart_item_count);
					
					localStorage.setItem(inputId + '-pid', pid);

					//End Increase and Decrease
					let msgStock = '<div style="text-align:center;">Available  stock is ' + stockCount + '</div>';
						Lobibox.notify('default', {
							pauseDelayOnHover: true,
							continueDelayOnInactiveTab: false,
							position: 'center top',
							size: 'mini',
							msg: msgStock
						});
				}
			} else {					
				Lobibox.notify('default', {
					pauseDelayOnHover: true,
					continueDelayOnInactiveTab: false,
					position: 'center top',
					size: 'mini',
					msg: '<div style="text-align:center;">Out of stock</div>'
				});					
				$('#product-modal').modal('hide');
			}
		}
		
	});
}
function check_product_stock_onchange(product)
{
	$('#check-stock-div').html('');
	$('#check-stock-pay-div').html('');
	const myArray = product.split("@@@");
	let pvid = parseInt(myArray[0]);
	check_product_stock(pvid,product);
}
function check_product_stock(id,parameter)
{	
//alert(parameter);
	const myArray = parameter.split("@@@");
	//alert(myArray);
	let productMeasurement = parseFloat(myArray[5]);
	let pid = parseInt(myArray[8]);
	let product_type = myArray[7];
	
	let pvqty = $('#qty_' + id).val();
	if(typeof pvqty === 'undefined'){
		pvqty = 0;
	}
	//alert(productMeasurement);
	let rw = productMeasurement;
    $('.pid-'+pid).each(function () {
        rw += parseFloat($(this).val()) || productMeasurement;
    });

	let barcode = 1;
	var datapost = 'action=paynow&id='+id + '&rw='+rw + '&barcode=' + barcode;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			var stockCount = 0;
			var total_stock = '';
			if (result.length > 0) {
				var html = '<div class="col-md-5">';
				$.each(result, function (i, stock) {
					stockCount = parseInt(stockCount) + parseInt(stock.variant_stock) - parseInt(pvqty);
					total_stock = stock.total_stock;
					if(stock.product_type == 'loose') {
						//stockCount = parseInt(stockCount) + parseInt(stock.variant_stock);
						stockCount = parseInt(stock.variant_stock);
						total_stock = stock.total_stock;
					}
					
					//stockCount = parseInt(stock.variant_stock);
					//console.log(stock.product_type,stockCount, stock.variant_stock, pvqty);
					//alert(pvqty);
					if(stockCount <= 0)
					{
						Lobibox.notify('default', {
							pauseDelayOnHover: true,
							continueDelayOnInactiveTab: false,
							position: 'center top',
							size: 'mini',
							msg: '<div style="text-align:center;">Out of stock</div>'
						});
					}
				});
				html += '</div>';
				if(stockCount > 0)
				{
					//$('#dataRow' + id).find('.qty-increment').prop('disabled', false);
					if (typeof add_to_cart !== 'function') {
						$.getScript("<?php echo SITE_URL; ?>assets/plugins/es/cart.js")
							.done(function () {
								add_to_cart(parameter);
							})
							.fail(function () {
								alert('Failed to load cart.js');
							});

					} else {
						add_to_cart(parameter);
					}
					//Start Increase and Decrease
					let inputId = 'transfer-stock-limit' + id;
					//var cart_item_count = stockCount;
					var cart_item_count = total_stock;
					if(product_type == 'loose') {
						inputId = 'transfer-stock-limitp' + pid;
						cart_item_count = total_stock;
					}
					// ensure it exists
					if ($('#' + inputId).length === 0) {
					  $('#qty-total').append(`<input type="text" class="transfer-pid-${pid}" id="${inputId}">`);
					} else {
					  $('#' + inputId).show();
					}
					$('#' + inputId).val(cart_item_count === 0 ? '' : cart_item_count);
					localStorage.setItem(inputId + '-value', cart_item_count === 0 ? '' : cart_item_count);
					localStorage.setItem(inputId + '-pid', pid);
					//End Increase and Decrease

				}
				else{
					$('#check-stock-div').html(html).show();
				}
				$('#product-modal').modal('hide');
			} else {				
				let msgStock = 'Out of stock';
				Lobibox.notify('default', {
					pauseDelayOnHover: true,
					continueDelayOnInactiveTab: false,
					position: 'center top',
					size: 'mini',
					msg: '<div style="text-align:center;">Out of stock</div>'
				});
				$('#product-modal').modal('hide');
			}
			
		}
	});
}
function sellers(id)
{
	$('#hid_seller_id').val(id);
}
function submit_request()
{
	$('#err_product').text('');
	$('#err_seller').text('');
	var seller_id = $('#seller_id').val();
	var items = localStorage.getItem("stockData", JSON.stringify(stockBasket));
	if (items) {
		var data = JSON.parse(items);
		if (data.length > 0) {
			var cartData = data[0].id;
		}
	} if(typeof cartData === 'undefined') {
		$('#err_product').text('Please select product');
		return false;
	} if(seller_id == ''){
		$('#err_seller').text('Please choose store to transfer.');
		return false;
	}
	
	var datapost = $('#stock-list-form').serialize();
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			
			var html = '<div class="col-md-12">';
				//alert(result.length);
				if (result.length > 0) {
					$.each(result, function (i, stock) {
						html += '<div class="row align-items-start border-bottom py-2">';
							html += '<span class="col-md-6 fw-bold text-break text-nowrap" style="color:#A300A3">' +stock.product_name + '</span>';
							html += '<span class="col-md-2 text-nowrap" style="color:#A300A3">' + stock.variant_name + '</span>';
							html += '<span class="col-md-4 text-danger fw-bold text-end text-nowrap">Available stock ' + stock.variant_stock + '</span>';
						html += '</div>';
					});
					//$('#show-payment-div').hide();
					//$('#show-stock-div').html(html).show();
					$('#show-products').html(html);
					$('#product-modal').modal('show');
				} else {
					//$('#show-payment-div').show();
					$('#show-stock-div').hide();
					$('#show-products').html('');
					$('#product-modal').modal('hide');
					$('#actionstatus').val('stockTransferSave');
					save_post_data();
				}
			html += '</div>';
		}
	});
}
function save_post_data()
{
	var datapost = $('#stock-list-form').serialize();
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			$('#actionstatus').val('checkStockTransferItem');
			$('#supplier_id').val('');
			var order_id = JSON.parse(response);
			//alert(order_id);
			clearCart();
			$('.success-message').show();
		}
	});
}
</script>