<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'],$pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
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
			else{
				//echo "<pre>";print_r($_POST);
				$explode_product = explode("@@@", $product);
				$product_variant_id = $explode_product[6];
				$product_id = $explode_product[0];
				$stock = $stock;
				$selling_price = $explode_product[1];
				$purchase_price = $explode_product[7];
				
				$field = "seller_id, product_variant_id, product_id, stock, stock_type, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id, approved_by, approved_date, order_id";
				$value = ":seller_id, :product_variant_id, :product_id, :stock, :stock_type, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id";
					
					//parent_id
				$addExecute=array(
					':seller_id'			=> $_SESSION['USER_ID'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					
					':stock'				=> $stock,
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
					':seller_id'			=> $_SESSION['USER_ID'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					
					':stock'				=> -($stock),
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
	<?PHP include_once("includes/adminHeader.php"); ?>
<!-- ######### HEADER END ############### -->
  
<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/adminMenu.php"); ?>
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
							<div class="col-md-12">
								<label for="input1" class="form-label">Products</label>
								<select name="product" id="product" onchange=product_stock_show(this.value) class="form-select select2-dropdown" tabindex="1">
								<option value="">Select...</option>
								<?PHP
									$fields = "pr.id, pr.product_id, pr.product_variant_id, pr.status, SUM(pr.stock) as total_stock, pr.selling_price, u.name as stock_unit_name, pv.measurement, p.name, p.image, p.barcode, pv.id as pvid, pv.discounted_price, pv.price";
									$tables = PRODUCT_STOCK_TRANSACTION . " pr
									INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
									INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
									INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
									$where = "WHERE pr.status=:status AND pr.stock_type=:stock_type AND pr.seller_id =:seller_id GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
									$params = [
										':status' => 1,
										':stock_type' => 1,
										':seller_id' => $_SESSION['USER_ID'],
									];
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
									if($sqlQuery[0] != '')
									{
										foreach($sqlQuery as $arr)
										{	
											$barcode = $arr->barcode;
											$barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
								?>
											<option value="<?PHP echo $arr->product_id.'@@@'.$arr->discounted_price.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$arr->product_id.'@@@'.$barcode.'@@@'.$arr->measurement.' '.$arr->stock_unit_name.'@@@'.$arr->pvid.'@@@'.$arr->price; ?>" <?php   echo ($_POST['product'] == $arr->product_id.'@@@'.$arr->discounted_price.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$arr->product_id.'@@@'.$barcode.'@@@'.$arr->measurement.' '.$arr->stock_unit_name.'@@@'.$arr->pvid.'@@@'.$arr->price) ? 'selected' : '' ?>><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name).' ('.$arr->measurement.' '.$arr->stock_unit_name.')'; ?></option>
								<?PHP
										}
									}
								?>
							</select>
							<span id="stock-check-div"></span>
							</div>
							<div class="col-md-12">
								<label for="input5" class="form-label">Unit</label>
								<select name="product_variant_id" id="product_variant_id" class="form-select select2-dropdown" tabindex="1">
									<option value="">Select...</option>
								</select>
							</div>
							<div class="col-md-12">
								<label for="input5" class="form-label">Stock Quantity</label>
								<input type="text" class="form-control" name="stock" id="stock" placeholder="Stock quantity" oninput="this.value = this.value.replace(/[^0-9]/g, '')" value="<?php echo isset($_POST['stock']) ? $_POST['stock'] : '' ?>">
								<span class="text-danger" id="err_stock"></span>
							</div>
							<input type="hidden" id="stock_limit" name="stock_limit" value="<?php echo isset($_POST['stock_limit']) ? $_POST['stock_limit'] : '' ?>">
							<div class="col-md-12">
								<div class="d-md-flex d-grid align-items-center gap-3">
									<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-primary px-5">Assign</button>
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
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
</body>

</html>
<script>
function product_stock_show(product)
{
	$('#stock-check-div').html('');
	$('#check-stock-div').html('');
	$('#check-stock-pay-div').html('');
	const myArray = product.split("@@@");
	let pid = parseInt(myArray[0]);
	let pvid = parseInt(myArray[6]);
	var datapost = 'action=onlineProductStock&pvid=' + pvid + '&pid=' + pid;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			//alert(result.length);
			if (result.length > 0) {
				var html = '<div class="col-md-5">';
				$.each(result, function (i, stock) {
					html += '<div class="row align-items-start border-bottom py-2">';
						html += '<span class="col-md-5 fw-bold text-break text-nowrap" style="color:#A300A3">' +stock.product_name + '</span>';
						html += '<span class="col-md-2 text-nowrap" style="color:#A300A3">' + stock.variant_name + '</span>';
						html += '<span class="col-md-4 text-danger fw-bold text-end text-nowrap">Available stock ' + stock.variant_stock + '</span>';
					html += '</div>';
					$('#stock_limit').val(stock.variant_stock)
				});
				html += '</div>';
				
				$('#stock-check-div').html(html);
			}
			
			get_unit_measurement(pvid);
		}
	});
}

function get_unit_measurement(pid)
{
	//alert(pid);
	var datapost = 'action=getProductVariant&pid='+pid;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		success: function(response){
			var result = JSON.parse(response);
			if (result.length > 0) {
				var html = '<option value="">Select...</option>';
				$.each(result, function (i, variants) {
					html += '<option value='+ variants.id +'>' + variants.measurement + ' ' + variants.unitname + '</option>';
				});
				$('#product_variant_id').html(html);
			}
		}
	});
}
</script>