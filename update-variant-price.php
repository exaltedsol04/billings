<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
		if($_SERVER['REQUEST_METHOD'] == "POST")
		{
			extract($_POST);
			//echo "<pre>";print_r($_POST);die;
			$prices = $_POST['price'] ?? [];
			$filtered = array_filter($prices, function($value) {
				return trim($value) !== '';
			});

			/*if (empty($filtered)) {
				echo "No prices entered.";
				exit;
			}*/
			
			if(!empty($filtered))
			{
				$i = 0;
				foreach ($_POST['price'] as $key => $price_value)
				{
					$discount_value = $_POST['discounted_price'][$key];
					$product_id = $_POST['product_id'][$key];

					// Skip empty rows
					if ($price_value == '' && $discount_value == '') {
						continue;
					}

					$price_value     = trim($price_value);
					$discount_value  = trim($discount_value);

					// insert query
					 $field = "product_id, product_variant_id, seller_id, price, discounted_price, created_at";
					$value = ":product_id, :product_variant_id, :seller_id, :price, :discounted_price, :created_at";
						
						//parent_id
					$addExecute=array(
						':product_id'	=> $general_cls_call->specialhtmlremover($product_id),
						
						':product_variant_id'	=> $general_cls_call->specialhtmlremover($key),
						':seller_id'	=> '',
						':price'		=> $price_value,
						':discounted_price'	=> $discount_value,
						':created_at' => date('Y-m-d H:i:s')
					);
					$general_cls_call->insert_query(NEW_PRODUCT_VARIANT_PRICE, $field, $value, $addExecute);
					
					$i++;
				}
				
				//header("Location: ".SITE_URL.'update-variant-price?m=1');
				//exit();
			}
			else{
				header("Location: ".SITE_URL.'update-variant-price?m=2');
			}
			
			//echo "<pre>";print_r($_POST);die;
		}
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP include_once("includes/adminMenu.php"); ?>
	<!-- ######### MENU END ############### -->


  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
		
		<?php echo $msg;?>
		<div id="msg"></div>
				
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i>Update Product Variant Price</a>
								</li>
							</ol>
						</nav>
						
					</div>
					<div class="ms-auto">
						<button type="button" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5 load-submit"  onclick="submit_vatiant_price('frmUpdatePrice')">Update Price</button>
					</div>
				</div>
				<!--end breadcrumb-->
				<?PHP
						if(isset($_GET['m']) && $_GET['m']== '2')
						{
					?>
						<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong> Please Fill At Least One Price.</strong></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
						if(isset($_GET['m']) && $_GET['m']== '1')
						{
					?>
						<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
							<div class="text-white"><strong>Success</strong> Price Updated Successfully.</div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
					?>
     
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
					<form name="frm" action="" method="post" id="frmUpdatePrice">
							<table id="example2" class="table table-striped table-bordered">
								<thead>
									<tr>
							<td></td>
							<td><input type="text" class="form-control" id="search-one" placeholder="Search by barcode"></td>
							<td><input type="text" class="form-control" id="search-two" placeholder="Search by product name"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                      <tr class="text-center">
						<th>Sl. No.</th>
						<th>Barcode</th>
						<th>Product Name</th>
						<th>Price(₹)</th>
						<th>New Price(₹)</th>
						<th>Discounted Price(₹)</th>
						<th>New Discounted Price(₹)</th>
						<th>Measurement</th>
						<th>Type</th>
						
                      </tr>
								</thead>
								<tbody>
									<?php 
						$fields = "pv.id, pv.product_id, pv.price,pv.discounted_price,pv.type, pv.stock, pv.measurement, pv.stock_unit_id, p.name, p.barcode";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id
						";
						$where = "WHERE 1";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $key=>$arr)
							{	
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
									  <tr id="dataARow<?php echo($arr->id);?>"  class="text-center">
										<td><?PHP echo $key+1; ?></td>
										<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
										<td><?PHP echo $general_cls_call->explode_name($arr->name); ?></td>
										<td>₹<?PHP echo $arr->price ?></td>
										<td><input type="text" class="form-control form-control-sm price-input"  placeholder="0.00" name="price[<?php echo $arr->id; ?>]" data-id="<?php echo $arr->id; ?>"></td>
										<td>₹<?PHP echo $arr->discounted_price ?></td>
										<td><input type="text" class="form-control form-control-sm discount-price-input"  placeholder="0.00" name="discounted_price[<?php echo $arr->id; ?>]" data-id="<?php echo $arr->id; ?>"></td>
										<td><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
										<td><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type; ?></span></td>
										<input type="hidden" name="product_id[<?php echo $arr->id; ?>]" value="<?php echo $arr->product_id; ?>">
									</tr>
										<?PHP
												$i++;
											}
										}
									?>
								</tbody>
								
							</table>
						</form>
						</div>
					</div>
				</div>

    </div>
  </main>
  <!--end main wrapper-->
  <div class="modal fade" id="barcodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="display:inline-block">Product Barcode</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body text-center">
				<svg id="barcode"></svg>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>
<!--end main wrapper-->
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
<script>

let priceData = {};
let discountPriceData = {};
$(document).on('input', '.price-input', function () {

    let id = $(this).data('id');
    let value = $(this).val();

    priceData[id] = value;

});

$(document).on('input', '.discount-price-input', function () {

    let id = $(this).data('id');
    let value = $(this).val();

    discountPriceData[id] = value;

});

function submit_vatiant_price(frmId) {

    let form = $('#' + frmId);

    // 🔥 Remove old dynamic hidden inputs (avoid duplicate submit issue)
    form.find('.dynamic-field').remove();

    // ✅ Append price data
    $.each(priceData, function (key, value) {

        if (value !== '') {   // optional: skip empty
            $('<input>').attr({
                type: 'hidden',
                name: 'price[' + key + ']',
                value: value,
                class: 'dynamic-field'
            }).appendTo(form);
        }

    });

    // ✅ Append discounted price data
    $.each(discountPriceData, function (key, value) {

        if (value !== '') {   // optional: skip empty
            $('<input>').attr({
                type: 'hidden',
                name: 'discounted_price[' + key + ']',
                value: value,
                class: 'dynamic-field'
            }).appendTo(form);
        }

    });

    // Disable button + loader (optional)
    $('.load-submit').prop('disabled', true).html(
        '<span class="spinner-grow spinner-grow-sm me-2"></span>Loading...'
    );

    // Submit form
    form.submit();
}

/*function submit_vatiant_price(frmId) {

    // Append hidden inputs dynamically
    $.each(priceData, function (key, value) {
		alert(key);alert(value);
        $('<input>').attr({
            type: 'hidden',
            name: 'price[' + key + ']',
            value: value
        }).appendTo('#' + frmId);
    });

    $('#' + frmId).submit();
}*/
/*function submit_vatiant_price(frmId)
{
    var table = $('#example2').DataTable();

    // 🔥 Get all rows (including other pages)
    var allRows = table.rows().nodes();

    // 🔥 Enable all inputs before submit
    $('input, select, textarea', allRows).each(function () {
        $(this).prop('disabled', false);
    });

    // Disable button + show loader
    $('.load-submit').prop('disabled', true);
    $('.load-submit').html(
        '<span class="spinner-grow spinner-grow-sm me-2" role="status"></span>Loading...'
    );

    // Submit form
    setTimeout(function () {
        $('#' + frmId).submit();
    }, 500);
}*/
</script>
</body>
</html>