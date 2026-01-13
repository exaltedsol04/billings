<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();

/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		/*if($txtUsername!='')
		{
			if($txtNewPassword==$txtConfirmPassword)
			{
				$newHashPassword = password_hash(stripslashes(trim($txtNewPassword)), PASSWORD_BCRYPT);
				
				$password=isset($txtNewPassword) && $txtNewPassword != "" ? $newHashPassword : $hidPassword; 

				$setValues="username=:username, password=:password";
				$updateExecute=array(
					':username'		=>$general_cls_call->specialhtmlremover($txtUsername),
					':password'		=>$general_cls_call->specialhtmlremover($password)
				);
				$whereClause=" WHERE id=".$_SESSION['USER_ID'];
				$general_cls_call->update_query(ADMIN_MASTER, $setValues, $whereClause, $updateExecute);
				$sucMsg = "Your profile has been updated successfully.";
			}
			else
			{
				$erMsg = "Confirm password does not match with new password.";
			}
		}
		else
		{
			$erMsg = "Please enter your username.";
		}*/
		
		if(!empty($product_variant_id))
		{
			//echo "<pre>";print_r($product_variant_id);die;
			//echo $supplier_hidden_id . '---' .$_SESSION['USER_ID'] .'---'. $cart_total_amt;die;
			$sellers_details = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id=:admin_id", array(':admin_id'=>$_SESSION['USER_ID']), 1);
			$store_id = $sellers_details->admin_id;
			
			$field = "pos_user_id, user_id, store_id, total_amount, discount_amount, discount_percentage, payment_method, created_at, updated_at";
			$value = ":pos_user_id, :user_id, :store_id, :total_amount, :discount_amount, :discount_percentage, :payment_method, :created_at, :updated_at";
			
			$addExecute=array(
				':pos_user_id'			=> $general_cls_call->specialhtmlremover($supplier_hidden_id),
				':user_id'				=> $_SESSION['USER_ID'],
				':store_id'				=> $general_cls_call->specialhtmlremover($store_id),
				':total_amount'			=> $general_cls_call->specialhtmlremover($cart_total_amt),
				':discount_amount'			=> '',
				':discount_percentage'		=> '',
				':payment_method'		=> '',
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
			
			/*if ($last_insert_id) {
				header("Location: print_cart_invoice?order_id=".$last_insert_id);
				exit;
			}*/
		}
	}
/*=========== ACCOUNT SETTINGS END ===========*/


/*=========== SELECT QUERY START ===========*/
	$adminVal=$general_cls_call->select_query("*", ADMIN_MASTER, "WHERE id=:id", array(':id'=>$_SESSION['USER_ID']), 1);
/*=========== SELECT QUERY END ===========*/


	if(!isset($_POST['txtUsername'])) { $_POST['txtUsername'] =			$adminVal->username; }
	if(!isset($_POST['hidPassword'])) { $_POST['hidPassword'] =			$adminVal->password; }

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
			<!--<div class="col-md-5">
				<select name="product" id="product" onchange=add_to_cart(this) class="form-select select2-dropdown" tabindex="1">
					<option value="">Select...</option>
					<?PHP
						$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, p.name, p.image, p.barcode";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id";
						$where = "WHERE 1 ORDER BY p.name";
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
					?>
								<option value="<?PHP echo $arr->id.'@@@'.$arr->discounted_price.'@@@'.$arr->name.'@@@'.$imagePath; ?>"><?PHP echo $arr->name.' ('.$arr->stock.' '.$arr->type.')'; ?></option>
					<?PHP
							}
						}
					?>
				</select>
			</div>-->
			<div class="col-md-5">
				<input type="text" class="form-control" name="barcode" id="barcode" oninput="getProducts(this.value)" placeholder="Barcode">
			</div>
			<!--<div class="col-md-5">
				<select name="supplier_id" id="supplier_id" class="form-select select2-dropdown" tabindex="1">
					<option value="">Select...</option>
					<?PHP
						$sqlQuery = $general_cls_call->select_query("id, name, country_code, mobile", USERS, "WHERE 1", array(), 2);
						if($sqlQuery[0] != '')
						{
							foreach($sqlQuery as $arr)
							{	
					?>
								<option value="<?PHP echo $arr->id; ?>"><?PHP echo $arr->mobile.' ('.$arr->name.')'; ?></option>
					<?PHP
							}
						}
					?>
				</select>
			</div>-->
			<div class="col-md-5">
				<input type="text" class="form-control" id="supplier_id" name="supplier_id" placeholder="Mobile No" oninput="user_details(this.value)">
				<div id="user_suggestions" class="list-group position-absolute w-100" style="z-index:1000;"></div>
			</div>
			
			<div class="col-md-2">
				 <button id="removeCart" class="btn btn-grd btn-grd-danger mb-3 pull-right" style="display:none" type="button" onclick="clearCart()" class="removeAll" data-toggle="tooltip" title="Clear Your Cart">Clear Cart</button>
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
	<div class="card">
		<form name="frm" action="" method="post">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
				  <thead>
					<tr>
					  <th class="text-center" style="width:160px">Qty</th>
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
			<div class="box-footer text-center">
				<div class="loader" id="loader1" style="display:none"></div>
				
				
				<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5 pull-right">PAY</button>
				
				<input type="hidden" id="supplier_hidden_id" name="supplier_hidden_id">
			</div>
        </div>
        </form>
    </div>
	
	<!-- Modal -->
			<div class="modal fade" id="product-modal">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header border-bottom-0 py-2 btn-grd bg-grd-primary">
                        <h5 class="modal-title">Find Out Our New Products</h5>
                        <a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
                          <i class="material-icons-outlined">close</i>
                        </a>
                      </div>
                      <div class="modal-body">
					  <span id="show-products"></span>
                        <!--<div class="row row-cols-1 row-cols-lg-2">
						
                          <div class="col">
                            <div class="card rounded-4">
                              <div class="card-body">
                                <img src="assets/images/gallery/01.png" class="img-fluid rounded-4" alt="">
                                <div class="mt-3">
                                  <h5 class="mb-0 fw-bold product-short-title">Syndrona</h5>
                                  <p class="mb-0 product-short-name">Color Printed Kurta</p>
                                  <div class="product-price d-flex align-items-center gap-2 mt-2">
                                    <div class="h6 fw-bold">$458</div>
                                    <div class="h6 fw-light text-secondary text-decoration-line-through">$2089</div>
                                    <div class="h6 fw-bold text-danger">(70% off)</div>
                                  </div>
                                </div>
                                <div class="d-grid mt-2">
                                  <a href="javascript:;" class="btn btn-grd-danger rounded-4">Buy Now</a>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                          <div class="col">
                            <div class="card rounded-4">
                              <div class="card-body">
                                <img src="assets/images/gallery/03.png" class="img-fluid rounded-4" alt="">
                                <div class="mt-3">
                                  <h5 class="mb-0 fw-bold product-short-title">Syndrona</h5>
                                  <p class="mb-0 product-short-name">Color Printed Kurta</p>
                                  <div class="product-price d-flex align-items-center gap-2 mt-2">
                                    <div class="h6 fw-bold">$458</div>
                                    <div class="h6 fw-light text-secondary text-decoration-line-through">$2089</div>
                                    <div class="h6 fw-bold text-danger">(70% off)</div>
                                  </div>
                                </div>
                                <div class="d-grid mt-2">
                                  <a href="javascript:;" class="btn btn-grd btn-grd-warning rounded-4">Buy Now</a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>--><!--end row-->
                      </div>
                      <div class="modal-footer border-top-0">
                        <button type="button" class="btn btn-grd btn-grd-danger rounded-0"
                          data-bs-dismiss="modal">Cancel</button>
                        <!--<button type="button" class="btn btn-grd btn-grd-info rounded-0">Save changes</button>-->
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
				
			
				if(data.length == 1)
				{
					var parameter =
					data[0].id + '@@@' +
					data[0].discounted_price + '@@@' +
					data[0].name + '@@@' +
					data[0].image;
					//var parameter = data[0].id + '@@@' + data[0].discounted_price + '@@@' + data[0].name + '@@@' + data[0].imagePath;
					//add_to_cart(parameter);
					
					if (typeof add_to_cart !== 'function') {

						$.getScript("<?php echo SITE_URL; ?>assets/plugins/es/cart.js")
							.done(function () {
								add_to_cart(parameter);
							})
							.fail(function () {
								alert('Failed to load cart.js');
							});

					} else {
						// Already loaded
						add_to_cart(parameter);
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
					item.image;
					
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
        'onclick="add_to_cart(\'' + parameter + '\')">Add to cart</a>';
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
    $('#supplier_hidden_id').val(id);
}
</script>