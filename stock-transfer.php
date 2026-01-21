<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
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
						$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, p.name, p.image, p.barcode, u.name as unit_name";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id 
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
						INNER JOIN " . PRODUCT_STOCK_TRANSACTION . " pst ON pst.product_id = pv.product_id AND pst.product_variant_id = pv.id AND pst.status=1";
						$where = "WHERE 1 GROUP BY pv.id ORDER BY p.name";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						if($sqlQuery[0] != '')
						{
							foreach($sqlQuery as $arr)
							{	
							    $barcode = $arr->barcode;
								$barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
					?>
								<option value="<?PHP echo $arr->id.'@@@'.$arr->discounted_price.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$arr->product_id.'@@@'.$barcode.'@@@'.$arr->measurement.' '.$arr->unit_name; ?>"><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name).' ('.$arr->measurement.' '.$arr->unit_name.')'; ?></option>
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
						<option value="<?PHP echo $arr->admin_id ?>"><?PHP echo $arr->name; ?></option>
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
								<th>Sl. No.</th>
								<th>Product</th>
								<th class="text-center" style="width:160px">Qty</th>
								<th>Measurement</th>
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
		<?PHP include_once("includes/adminFooter.php"); ?>
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

		  // Ensure input exists
		  if ($('#' + inputId).length === 0) {
			$('#qty-total').append(`<input type="hidden" id="${inputId}">`);
		  }

		  // Set the value from localStorage (even if empty)
		  let storedValue = localStorage.getItem(key);
		  $('#' + inputId).val(storedValue !== null ? storedValue : '');
		}
	});
	//End Increase and Decrease
});
function check_qty_stock(id, inc)
{
	let barcode = 1;
	var datapost = 'action=paynow&id='+id + '&barcode=' + barcode;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			var stockCount = 0;
			if (result.length > 0) {
				$.each(result, function (i, stock) {
					stockCount = parseInt(stockCount) + parseInt(stock.variant_stock);
				});
				if(inc >= stockCount)
				{
					//Start Increase and Decrease
					let inputId = 'transfer-stock-limit' + id;
					$('#' + inputId).val(stockCount);
					localStorage.setItem(inputId + '-value', stockCount);
					$('.qty-input' + id).val(stockCount);
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
	let pvqty = $('#qty_' + id).val();
	if(typeof pvqty === 'undefined'){
		pvqty = 0;
	}
	let barcode = 1;
	var datapost = 'action=paynow&id='+id + '&barcode=' + barcode;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			var stockCount = 0;
			if (result.length > 0) {
				var html = '<div class="col-md-5">';
				$.each(result, function (i, stock) {
					stockCount = parseInt(stockCount) + parseInt(stock.variant_stock)-parseInt(pvqty);
					if(stockCount == 0)
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
					if (typeof add_to_cart !== 'function') {
						$.getScript("<?php echo SITE_URL; ?>assets/plugins/es/stock-transfer.js")
							.done(function () {
								add_to_cart(parameter);
							})
							.fail(function () {
								alert('Failed to load stock-transfer.js');
							});

					} else {
						add_to_cart(parameter);
					}
					//Start Increase and Decrease
					let inputId = 'transfer-stock-limit' + id;
					// ensure it exists
					if ($('#' + inputId).length === 0) {
					  $('#qty-total').append(`<input type="hidden" id="${inputId}">`);
					} else {
					  $('#' + inputId).show();
					}
					$('#' + inputId).val(pvqty === 0 ? '' : pvqty);
					localStorage.setItem(inputId + '-value', pvqty === 0 ? '' : pvqty);
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
			
			var html = '<div class="col-md-7">';
				//alert(result.length);
				if (result.length > 0) {
					$.each(result, function (i, stock) {
						html += '<div class="row align-items-start border-bottom py-2">';
							html += '<span class="col-md-5 fw-bold text-break text-nowrap" style="color:#A300A3">' +stock.product_name + '</span>';
							html += '<span class="col-md-3 text-nowrap" style="color:#A300A3">' + stock.variant_name + '</span>';
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