<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();

/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		if($_POST)
		{
			//echo "<pre>";print_r($product_variant_id);die;
			//echo "<pre>";print_r($_POST);die;
			$sellers_details = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id=:admin_id", array(':admin_id'=>$_SESSION['USER_ID']), 1);
			$store_id = $sellers_details->admin_id;
			
			$field = "pos_user_id, user_id, store_id, total_amount, discount_amount, discount_percentage, payment_method, created_at, updated_at";
			$value = ":pos_user_id, :user_id, :store_id, :total_amount, :discount_amount, :discount_percentage, :payment_method, :created_at, :updated_at";
			
			$addExecute=array(
				':pos_user_id'			=> $general_cls_call->specialhtmlremover($user_hidden_id),
				':user_id'				=> $_SESSION['USER_ID'],
				':store_id'				=> $general_cls_call->specialhtmlremover($store_id),
				':total_amount'			=> $general_cls_call->specialhtmlremover($cart_total_amt),
				':discount_amount'			=> '0.00',
				':discount_percentage'		=> '0.00',
				':payment_method'		=> $payment_method,
				':created_at'			=> date("Y-m-d H:i:s"),
				':updated_at'			=> date("Y-m-d H:i:s")
			);
			
			$last_insert_id = $general_cls_call->insert_query(POS_ORDERS, $field, $value, $addExecute);
			//echo $last_insert_id; die;
			foreach($product_variant_id as $k=>$val) {
				
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $val), 1);
				//echo "<pre>";print_r($product_variant_dtls);die;
				$product_id = $product_variant_dtls->product_id;
				
				$unit_price = $product_variant_dtls->discounted_price;
				$total_price = $qty[$k] * $unit_price;
				
				$field = "pos_order_id, product_id, product_variant_id, quantity, unit_price, total_price, created_at, updated_at";
				$value = ":pos_order_id, :product_id, :product_variant_id, :quantity, :unit_price, :total_price, :created_at, :updated_at";
				
				
				$addExecute=array(
					':pos_order_id'			=> $general_cls_call->specialhtmlremover($last_insert_id),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':quantity'				=> $general_cls_call->specialhtmlremover($qty[$k]),
					':unit_price'			=> $general_cls_call->specialhtmlremover($unit_price),
					':total_price'			=> $general_cls_call->specialhtmlremover($total_price),
					':created_at'			=> date("Y-m-d H:i:s"),
					':updated_at'			=> date("Y-m-d H:i:s")
				);
				$general_cls_call->insert_query(POS_ORDERS_ITEMS, $field, $value, $addExecute);
				
				$sucMsg="Data has been submitted successfully";
			}
		}
	}

	$imagePath = IMG_PATH . 'noImg.jpg';

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
		  <div class="row">
			<div class="col-md-3">
				<input type="text" class="form-control" name="barcode" id="barcode" oninput="getProducts(this.value)" placeholder="Barcode">
				<span id="err_empty_cart" class="text-danger"></span>
			</div>
			<div class="col-md-4">
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
								$imagePath = MAIN_SERVER_PATH . $arr->image;
								if (!empty($arr->image) && file_exists($imagePath)) {
									$imagePath = MAIN_SERVER_PATH . $arr->image;
								} else {
									$imagePath = IMG_PATH . 'noImg.jpg';
								}
								
								$barcode = $arr->barcode;
								
								$barcode = !empty($barcode) ?  '(' . $barcode .') ' : '';
					?>
								<option value="<?PHP echo $arr->id.'@@@'.$arr->discounted_price.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$imagePath.'@@@'.$barcode.'@@@'.$arr->measurement.' '.$arr->unit_name; ?>"><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name).' ('.$arr->measurement.' '.$arr->unit_name.')'; ?></option>
					<?PHP
							}
						}
					?>
				</select>
			</div>
			<div class="col-md-3">
				<input type="text" class="form-control" id="supplier_id" name="supplier_id" placeholder="Mobile No" oninput="user_details(this.value)">
				<div id="user_suggestions" class="list-group 1position-absolute 1w-100" style="z-index:1000;"></div>
				<span class="text-danger" id="err_supplier_id"></span>
			</div>
			<div class="col-md-2">
				 <button id="removeCart" class="btn btn-grd btn-grd-danger mb-3 pull-right" style="display:none" type="button" onclick="clearCart()" class="removeAll" data-toggle="tooltip" title="Clear Your Cart">Clear Cart</button>
			</div>
			
			<div class="col-md-12 mt-2">
				<span id="check-stock-div"></span>
			</div>
			
		</div>
    </div>

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
		if(isset($sucMsg) && $sucMsg != '')
		{
	?>
		<div class="alert alert-success fade in">
		  <button class="close" data-dismiss="alert">X</button>
		  <i class="fa-fw fa fa-check"></i><strong>Success</strong> <?PHP echo $sucMsg; ?>
		</div>
	<?PHP
		}
	?>
	<div class="card mt-4">
		<form name="frm" action="<?= SITE_URL ?>cart" method="post" id="cart-list-form">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
				  <thead>
					<tr>
					  <th>Sl. No.</th>
					  <th class="text-center" style="width:160px">Qty</th>
					  <th>Measurement</th>
					  <th>Product</th>
					  <th class="text-center">Price</th>
					  <th class="text-center">Total Price</th>
					  <th class="text-center">Remove</th>
					</tr>
				  </thead>
				  <tbody id="shopping-cart">
					</tbody>
				  <tfoot id="total_amount_show" style="font-weight:bold; font-size:20px">
				  </tfoot>
				</table>
				  
			</div>
			
			<input type="hidden" name="payment_method" id="payment_method">
			
			<div class="col-md-12">
				<span id="check-stock-pay-div"></span>
			</div>
			<div class="box-footer text-center">
				<div class="loader" id="loader1" style="display:none"></div>
				<button type="button" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5 pull-right" onclick="cart_pay()">PAY</button>
				<input type="hidden" id="user_hidden_id" name="user_hidden_id">
				<input type="hidden" name="action" value="paynow" id="actionstatus">
			</div>
        </div>
        </form>
    </div>
	
	<!-- Modal -->
			<div class="modal fade" id="product-modal">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header border-bottom-0 py-2 bg-grd-primary">
                        <h5 class="modal-title btn-grd">Find Out Our New Products</h5>
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
	
	<!-- Py modal Modal -->
			<div class="modal fade" id="paymentmode-modal">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header border-bottom-0 py-2 bg-grd-primary">
                        <h5 class="modal-title btn-grd">Payment Mode</h5>
                        <a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
                          <i class="material-icons-outlined">close</i>
                        </a>
                      </div>
                      <div class="modal-body">
						<div class="d-flex justify-content-center">
							<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="card-body">
										<span id="show-stock-div" style="display:none;"></span>
										<span id="show-payment-div">
										<div class="mb-3 text-center">
											<select onchange="pay_method(this.value)" class="form-select select2-dropdown mx-auto"
													style="max-width: 250px;">
												<option value="">Select</option>
												<option value="cod">COD</option>
												<option value="online">Online</option>
											</select>
											<span class="text-danger" id="err_p_method"></span>
										</div>
										</span>

									</div>
							</div>
						</div>
					</div>
                      <div class="modal-footer border-top-0">
					  
                        <button type="button" class="btn btn-grd btn-grd-danger"
                          data-bs-dismiss="modal">Cancel</button>
						  
                        <button type="button" class="btn btn-grd btn-grd-primary px-5" onclick="pay_now()">Pay Now</button>
                      </div>
                    </div>
                  </div>
                </div>

</main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
	<script src="assets/plugins/es/cart.js"></script>
	
   <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

  </body>
</html>

<script>
$(document).ready(function(){
	<?php if (!empty($last_insert_id)) { ?>
        var order_id = <?= (int)$last_insert_id ?>;
		clearCart();
        window.open(
            "<?= SITE_URL ?>print_cart_invoice?order_id=" + order_id,
            "_blank"
        );
    <?php } ?>
});

function getProducts(val)
{
	var barcode = val;
	$('#check-stock-div').html('');
	//alert(barcode);
	if(barcode && barcode.trim() !== '')
	{
		var datapost = 'action=productbarcord&barcode='+barcode;
		$.ajax({
			type: "POST",
			url: "<?PHP echo SITE_URL; ?>ajax",
			data: datapost,
			success: function(response){
				var data = JSON.parse(response);
				//alert(data);
				//alert(data[0].name);
				//alert(data.length);
				$('#barcode').val('');
				
				//alert(data.length);
				if(data.length == 1)
				{
					
					var parameter =
					data[0].id + '@@@' +
					data[0].discounted_price + '@@@' +
					data[0].name + '@@@' +
					data[0].image + '@@@' +
					data[0].barcode + '@@@' +
					data[0].measurement + ' ' + data[0].stock_unit_id;
					//var parameter = data[0].id + '@@@' + data[0].discounted_price + '@@@' + data[0].name + '@@@' + data[0].imagePath;
					//add_to_cart(parameter);
					
					if (typeof add_to_cart !== 'function') {
						$.getScript("<?php echo SITE_URL; ?>assets/plugins/es/cart.js")
							.done(function () {
								//add_to_cart(parameter);
								check_product_stock(data[0].id, parameter);
							})
							.fail(function () {
								alert('Failed to load cart.js');
							});

					} else {
						// Already loaded
						//add_to_cart(parameter);
						check_product_stock(data[0].id, parameter);
					}
				}
				else if(data.length > 1)
				{
					var html = '<div class="row row-cols-1 row-cols-lg-2">';
					$.each(data, function (index, item) {
					//alert(item.imagePath);
					var parameter =
					item.id + '@@@' +
					item.discounted_price + '@@@' +
					item.name + '@@@' +
					item.image + '@@@' +
					item.barcode + '@@@' +
					item.measurement + ' ' + item.stock_unit_id;
					//alert(parameter);
					var images = item.imagePath;
					html += '<div class="col">';
							html += '<div class="card rounded-4">';
                              html += '<div class="card-body">';
                                html += '<img src=" ' + images + ' " class="img-fluid rounded-4 img-path" alt="">';
                                html += '<div class="mt-3">';
								 html += '<h5 class="mb-0 fw-bold product-short-title">' + item.name + '</h5>';
                                  html += ' <p class="mb-0 product-short-name">' + item.measurement +  ' ' + item.stock_unit_id + '</p>';
                                   html += '<div class="product-price d-flex align-items-center gap-2 mt-2">';
                                     html += '<div class="h6 fw-bold">₹' + item.discounted_price + '</div';
                                     /*html += '<div class="h6 fw-light text-secondary text-decoration-line-through">$2089</div>';*/
                                     html += '<div class="h6 fw-bold text-danger"></div>';
                                   html += '</div>';
                                 html += '</div>';
                                 html += '<div class="d-grid mt-2">';
                                   html += '<a href="javascript:;" class="btn btn-grd btn-grd-primary px-5" ' +
        'onclick="check_product_stock(\'' + item.id + '\', \'' + parameter + '\')">Add to cart</a>';
                                 html += '</div>';
                               html += '</div>';
                        html += '</div>';
                        html += '</div>';
						
						//$('.img-path').attr('src', images);
					});
					html += '</div>'; 
					
					$('#show-products').html(html);
					$('#product-modal').modal('show');
				}
				else{
					$('#check-stock-div').html('<span class="col-md-5 fw-bold text-break text-nowrap text-danger mt-4">Out of stock</span>').show();
				}
			   
			}
		});
	}
}

function check_qty_stock(id, inc)
{
	//alert(inc);
	let barcode = 1;
	var datapost = 'action=paynow&id='+id + '&barcode=' + barcode;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			
			var stockCount = 0;
			var html = '<div class="col-md-5">';
				//alert(result.length);
				if (result.length > 0) {
					$.each(result, function (i, stock) {
						html += '<div class="row align-items-start border-bottom py-2">';
							html += '<span class="col-md-5 fw-bold text-break text-nowrap text-danger">Out of stock</span>';
						html += '</div>';
						
						stockCount = parseInt(stockCount) + parseInt(stock.variant_stock);
					});
					//$('#show-payment-div').hide();
					//alert(stockCount);
					if(inc > stockCount)
					{
					$('#check-stock-pay-div').html('<span class="col-md-5 fw-bold text-break text-nowrap text-danger">stock limit is '+ stockCount + '</span>');
					}
					
				} else {
					
					$('#check-stock-div').html('<span class="col-md-5 fw-bold text-break text-nowrap text-danger">Out of stock</span>').show();
					$('#product-modal').modal('hide');
				}
			html += '</div>';
		}
	});
}

function check_product_stock_onchange(product)
{
	$('#check-stock-div').html('');
	$('#check-stock-pay-div').html('');
	const myArray = product.split("@@@");
	let pvid = parseInt(myArray[0]);
	check_product_stock(pvid,product)
}

function check_product_stock(id,parameter)
{
	//alert(id);alert(parameter);
	//var datapost = $('#cart-list-form').serialize();
	let barcode = 1;
	var datapost = 'action=paynow&id='+id + '&barcode=' + barcode;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			
			var stockCount = 0;
			var html = '<div class="col-md-5">';
				//alert(result.length);
				if (result.length > 0) {
					$.each(result, function (i, stock) {
						html += '<div class="row align-items-start border-bottom py-2">';
							html += '<span class="col-md-5 fw-bold text-break text-nowrap text-danger">Out of stock</span>';
							/*html += '<span class="col-md-2 text-nowrap" style="color:#A300A3">' + stock.variant_name + '</span>';
							html += '<span class="col-md-3 text-danger fw-bold text-end text-nowrap">Available stock ' + stock.variant_stock + '</span>';*/
						html += '</div>';
						
						stockCount = parseInt(stockCount) + parseInt(stock.variant_stock);
					});
					//$('#show-payment-div').hide();
					//alert(stockCount);
					if(stockCount > 0)
					{
					    if (typeof add_to_cart !== 'function') {
							$.getScript("<?php echo SITE_URL; ?>assets/plugins/es/cart.js")
								.done(function () {
									add_to_cart(parameter);
									//check_product_stock(parameter);
								})
								.fail(function () {
									alert('Failed to load cart.js');
								});

						} else {
							add_to_cart(parameter);
						}
					}
					else{
						$('#check-stock-div').html(html).show();
					}
					$('#product-modal').modal('hide');
				} else {
					
					$('#check-stock-div').html('<span class="col-md-5 fw-bold text-break text-nowrap text-danger">Out of stock</span>').show();
					$('#product-modal').modal('hide');
					//add_to_cart(parameter);
					//$('#paymentmode-modal').modal('show');
					/*$('#show-payment-div').show();
					$('#show-stock-div').hide();
					$('#actionstatus').val('paynowsave');*/
					//save_post_data();
				}
			html += '</div>';
		}
	});
}


function user_details(val)
{
	var datapost = 'action=userdetails&phone='+val;
		$.ajax({
			type: "POST",
			url: "<?PHP echo SITE_URL; ?>ajax",
			data: datapost,
			success: function(response){
				var result = JSON.parse(response);
				//alert(data[0].id);alert(data[0].name);alert(data[0].mobile);
				//var list = data[0].mobile + ' '+ data[0].name;
				var html = '';
				//alert(result.length);
				if (result.length > 0) {
					$.each(result, function (i, user) {
						html += '<a href="javascript:;" class="list-group-item list-group-item-action" ' + 'onclick="selectUser(\'' + user.mobile + '\', \'' + user.name + '\', ' + user.id + ')">' +user.mobile + ' (' + user.name + ')' +'</a>';
					});
					$('#err_supplier_id').text('');
					$('#user_suggestions').html(html).show();
				} else {
					$('#user_suggestions').hide();
				}
			}
		});
}

function selectUser(mobile, name, id) {
    $('#supplier_id').val(mobile + ' ( ' + name + ')' );
    $('#user_suggestions').hide();

    // optional hidden field
    $('#user_hidden_id').val(id);
}
function cart_pay()
{
	//cart-list-form
	$('#check-stock-div').html('');
	var items = localStorage.getItem("data", JSON.stringify(basket));
	if (items) {
		var data = JSON.parse(items);
		if (data.length > 0) {
			var cartData = data[0].id;
		}
	}
	
	//alert(cartData);
	var supplier_id = $('#supplier_id').val();
	var user_hidden_id = $('#user_hidden_id').val();
	//var cart_total_amt = $('#cart_total_amt').val();
	$('#err_supplier_id').text('');
	if(supplier_id == '')
	{
		$('#err_supplier_id').text('Please enter seller mobile no.');
		return false;
	}
	
	if(user_hidden_id == '')
	{
		$('#err_supplier_id').text('Please enter valid mobile no.');
		return false;
	}
	
	if(typeof cartData === 'undefined')
	{
		$('#err_empty_cart').text('Please select barcode and add item');
		return false;
	}
	
	$('#err_p_method').text('');
	
	$('#show-payment-div').show();
	$('#show-stock-div').hide();
	$('#show-stock-div').html('');
	//$('#payment_method').val('').trigger('change');
	//$('#paymentmode-modal').modal('show'); // 16-01-2026
	
	var datapost = $('#cart-list-form').serialize();
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			
			var html = '<div class="col-md-5">';
				//alert(result.length);
				if (result.length > 0) {
					$.each(result, function (i, stock) {
						html += '<div class="row align-items-start border-bottom py-2">';
							html += '<span class="col-md-5 fw-bold text-break text-nowrap" style="color:#A300A3">' +stock.product_name + '</span>';
							html += '<span class="col-md-2 text-nowrap" style="color:#A300A3">' + stock.variant_name + '</span>';
							html += '<span class="col-md-4 text-danger fw-bold text-end text-nowrap">Available stock ' + stock.variant_stock + '</span>';
						html += '</div>';
					});
					//$('#show-payment-div').hide();
					$('#check-stock-pay-div').html(html).show();
				} else {
					
					$('#show-payment-div').show();
					$('#show-stock-div').hide();
					$('#show-stock-div').html('');
					//$('#payment_method').val('').trigger('change');
					$('#paymentmode-modal').modal('show');
				}
			html += '</div>';
		}
	});
}
function pay_method(val)
{
	$('#payment_method').val(val);
}
function pay_now()
{
	var p_method =  $('#payment_method').val();
	//alert(p_method);
	if(p_method == '')
	{
		$('#err_p_method').text('Please select payment type');
		return false;
	}
	
	$('#actionstatus').val('paynowsave');
	save_post_data();
}

function save_post_data() // no use
{
	var datapost = $('#cart-list-form').serialize();
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			$('#actionstatus').val('paynow');
			$('#supplier_id').val('');
			$('#check-stock-pay-div').html('');
			var order_id = JSON.parse(response);
			//alert(order_id);
			clearCart();
			$('#paymentmode-modal').modal('hide');
			clearCart();
				window.open(
					"<?= SITE_URL ?>print_cart_invoice?order_id=" + order_id,
					"_blank"
				);
		}
	});
}
</script>