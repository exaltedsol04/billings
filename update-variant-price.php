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
					
					// get the product_id 
					$products = $general_cls_call->select_query("product_id", PRODUCT_VARIANTS, "WHERE id=:id", array(':id'=>$key), 1);

					// insert query
					 $field = "product_id, product_variant_id, seller_id, price, discounted_price, created_at";
					$value = ":product_id, :product_variant_id, :seller_id, :price, :discounted_price, :created_at";
						
						//parent_id
					$addExecute=array(
						':product_id'	=> $general_cls_call->specialhtmlremover($products->product_id),
						
						':product_variant_id'	=> $general_cls_call->specialhtmlremover($key),
						':seller_id'	=> 0,
						':price'		=> $price_value,
						':discounted_price'	=> $discount_value,
						':created_at' => date('Y-m-d H:i:s')
					);
					//$general_cls_call->insert_query(NEW_PRODUCT_VARIANT_PRICE, $field, $value, $addExecute);
					
					// update product variant table 
					
					$setValues="price=:price, discounted_price=:discounted_price";
					$updateExecute=array(
						':price'	=> $price_value,
						':discounted_price'	=> $discount_value,
						':id'		=> $key
					);
					$whereClause=" WHERE id = :id";
					//$general_cls_call->update_query(PRODUCT_VARIANTS, $setValues, $whereClause, $updateExecute);
					
					$i++;
				}
				
				header("Location: ".SITE_URL.'update-variant-price?m=1');
				exit();
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
						<button type="button" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5 load-submit"  onclick="save_price()">Update Price</button>
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
										<td><?PHP echo $arr->measurement.' '.$unitname; ?></td>
										<td><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type; ?></span></td>
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
	
	<!-- update price show Modal -->
		<div class="modal fade" id="updatePrice-modal">
			  <div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				  <div class="modal-header border-bottom-0 py-2 bg-grd-warning">
					<h5 class="modal-title btn-grd">Confirmation</h5>
					<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
					  <i class="material-icons-outlined">close</i>
					</a>
				  </div>
				  <div class="modal-body">
					<div class="form-body">
						<div class="row g-3">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="card-body">
							 <h5>Are you sure want to update prices?</h5>
								<!--<div id="machineQrCodeShow" 
									 class="d-flex justify-content-center align-items-center">
								</div>-->
							</div>
						</div>
						<div class="col-md-12">
							<div class="d-flex justify-content-md-between">
							<button type="button" class="btn btn-outline-danger px-5" data-bs-dismiss="modal">No</button>
								<button type="button"
									class="btn btn-grd btn-grd-success px-5"
									onclick="submit_variant_price('frmUpdatePrice')">
									Yes
								</button>
							</div>
						  </div>
						
					  </div>
					</div>
				</div>
				</div>
			</div>
		</div>
		
		<!-- no select price show Modal -->
		<div class="modal fade" id="emptyPrice-modal">
			  <div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				  <div class="modal-header border-bottom-0 py-2 bg-grd-danger">
					<h5 class="modal-title btn-grd">Alert</h5>
					<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
					  <i class="material-icons-outlined">close</i>
					</a>
				  </div>
				  <div class="modal-body">
					<div class="form-body">
						<div class="row g-3">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="card-body">
							 <h5>Please entry any one price and discount price</h5>
								<!--<div id="machineQrCodeShow" 
									 class="d-flex justify-content-center align-items-center">
								</div>-->
							</div>
						</div>
						<div class="col-md-12">
							<div class="d-flex justify-content-end">
							<button type="button" class="btn btn-outline-danger px-5" data-bs-dismiss="modal">Close</button>
							</div>
						 </div>
						
					  </div>
					</div>
				</div>
				</div>
			</div>
		</div>
  </main>
  <!--end main wrapper-->
  
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

function save_price()
{
	let hasprice = false;
	$.each(priceData, function (key, value) {

        if (value !== '') {  
            hasprice = true;
        }

    });
	
	//alert(hasprice);
	if(hasprice)
	{
		$('#emptyPrice-modal').modal('hide');
		$('#updatePrice-modal').modal('show');
	}
	else{
		$('#updatePrice-modal').modal('hide');
		$('#emptyPrice-modal').modal('show');
	}
}

function submit_variant_price(frmId) {

    let form = $('#' + frmId);

    form.find('.dynamic-field').remove();

   
    $.each(priceData, function (key, value) {

        if (value !== '') {  
            $('<input>').attr({
                type: 'hidden',
                name: 'price[' + key + ']',
                value: value,
                class: 'dynamic-field'
            }).appendTo(form);
        }

    });

   
    $.each(discountPriceData, function (key, value) {

        if (value !== '') {   
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
</script>
</body>
</html>