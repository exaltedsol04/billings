<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();

/*=========== ACCOUNT SETTINGS START ===========*/
	/*if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnSubmit'])) && $_POST['btnSubmit'] === "SAVE")
	{	
		extract($_POST);
		//echo "<pre>";print_r($product_variant_id);die;
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
			}				
		}
		else
		{
			$erMsg = "Please choose product.";
		}
	}*/
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
				<select name="product" id="product" onchange=add_to_cart(this) class="form-select select2-dropdown" tabindex="1">
					<option value="">Select...</option>
					<?PHP
						$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, p.name, p.image, p.barcode";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id INNER JOIN " . PRODUCT_STOCK_TRANSACTION . " pst ON pst.product_id = pv.product_id AND pst.product_variant_id = pv.id AND pst.status=1";
						$where = "WHERE 1 ORDER BY p.name";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						if($sqlQuery[0] != '')
						{
							foreach($sqlQuery as $arr)
							{	
							    $barcode = $arr->barcode;
								$barcode = !empty($barcode) ? '(' . $barcode . ')': '';
					?>
								<option value="<?PHP echo $arr->id.'@@@'.$arr->discounted_price.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$arr->product_id.'@@@'.$arr->barcode; ?>"><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name).' ('.$arr->stock.' '.$arr->type.')'; ?></option>
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
								<th>Barcode</th>
								<th>Product</th>
								<th class="text-center">Price</th>
								<th class="text-center" style="width:160px">Qty</th>
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
						<div class="loader" id="loader1" style="display:none"></div>
						<button type="button" name="btnSubmit" value="SAVE" class="btn btn-grd btn-grd-success px-5" onclick="submit_request();">Submit Request</button>
				</div>
				<input type="hidden" name="action" value="checkStockTransferItem" id="actionstatus">
				<input type="hidden" name="hid_seller_id"  id="hid_seller_id">
				<input type="hidden" name="product_id"  id="product_id">
			</form>
		</div>
	</div>	
</main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
	<script src="assets/plugins/es/stock-transfer.js"></script>
	<?php if (!empty($_SESSION['call_js'])) { ?>
		<script>
			clearCart();
		</script>
	<?php unset($_SESSION['call_js']); } ?>


  </body>
</html>
<script>
function sellers(id)
{
	$('#hid_seller_id').val(id);
}
function submit_request()
{
	$('#err_product').text('');
	$('#err_seller').text('');
	var seller_id = $('#seller_id').val();
	var items = localStorage.getItem("purchaseData", JSON.stringify(purchaseBasket));
	if (items) {
		var data = JSON.parse(items);
		if (data.length > 0) {
			var cartData = data[0].id;
		}
	}
	
	if(typeof cartData === 'undefined')
	{
		$('#err_product').text('Please select product');
		return false;
	}
	
	if(seller_id == '')
	{
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
			
			var html = '<div class="col-md-4">';
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
					$('#show-stock-div').html(html).show();
				} else {
					//$('#show-payment-div').show();
					$('#show-stock-div').hide();
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