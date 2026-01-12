<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();

/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		if($txtUsername!='')
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
			<div class="col-md-5">
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
			</div>
			<div class="col-md-5">
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
				
				
			</div>
        </div>
        </form>
    </div>

</main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
	<script src="assets/plugins/es/cart.js"></script>
	

  </body>
</html>