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
		// echo "<pre>";print_r($_POST);die;
		
		extract($_POST);
		
		$countProduct = count($product_id);
		
		$fields = "max(group_id) as grp_id";
		$where = 'WHERE 1';
		$params = [];
		$group_data_id = $general_cls_call->select_query($fields, ADMIN_STOCK_PURCHASE_LIST, $where, $params, 1);
		$group_id = $group_data_id->grp_id + 1;
		
		for($index = 0; $index < $countProduct; $index++)
		{
			if($product_id[$index] !='' && $product_variant_id[$index] !='' && $purchase_price[$index] !='' && $stock[$index] !='')
			{
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $product_variant_id[$index]), 1);
				
				$loose_stock_quantity = 0.00;
				$variant_type = $product_variant_dtls->type;
				if($variant_type == 'loose')
				{
					$loose_stock_quantity = $stock[$index];
					$stock[$index] = 0;
				}
				
				$field = "vendor_id, product_id, product_variant_id, loose_stock_quantity, stock, status, group_id, purchase_price, remarks, purchase_order_id, created_at, updated_at";
				$value = ":vendor_id, :product_id, :product_variant_id, :loose_stock_quantity, :stock, :status, :group_id, :purchase_price, :remarks, :purchase_order_id, :created_at, :updated_at";
					
					//parent_id
				$addExecute=array(
					':vendor_id'			=> $general_cls_call->specialhtmlremover($vendor_id[$index]),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id[$index]),
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($product_variant_id[$index]),
					':loose_stock_quantity'	=> $general_cls_call->specialhtmlremover($loose_stock_quantity),
					':stock'				=> $stock[$index],
					':status'				=> $is_instant,
					':group_id'				=> $group_id,
					':purchase_price'		=> $purchase_price[$index],
					':remarks'				=> '',
					':purchase_order_id'	=> $general_cls_call->specialhtmlremover($purchase_order_id),
					':created_at' 			=> date('Y-m-d H:i:s'),
					':updated_at'		    => date('Y-m-d H:i:s')
				);
				$general_cls_call->insert_query(ADMIN_STOCK_PURCHASE_LIST, $field, $value, $addExecute);
			}
		}
		$sucMsg = "Stock Inserted Successfully";
		
	}
	/*=========== STATUS CHANGE START ================*/		
		if(isset($sucMsg)) 
		{
			$msg= '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
				<div class="text-white"><strong>Success</strong> '.$sucMsg.'</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		  </div>';
		  
		  echo "<script>
				setTimeout(function(){
					window.location.href = '".SITE_URL."instant-purchase-list';
				}, 1500);
			</script>";
		}
	/*=========== STATUS CHANGE END ================*/
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
		<div id="msg"></div>
					
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Purchase Request List</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
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
     
				<div class="card">
					<div class="card-body">
					<form name="frm" action="" method="post" id="submit_purchase">
					<input type="hidden" value="1" name="is_instant" id="is_instant">
					<input type="hidden" value="<?php echo $_GET['pid']; ?>" name="purchase_order_id" id="purchase_order_id">
						<div class="table-responsive">
							<table id="example2" class="table table-striped table-bordered">
								<thead>
									<tr>
							<td></td>
							<td><input type="text" class="form-control" id="search-one" placeholder="Search by barcode"></td>
							<td><input type="text" class="form-control" id="search-two" placeholder="Search by product name"></td>
							<td></td>
							<td></td>
							<td><input type="text" class="form-control" id="search-five" placeholder="Search by seller name"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                      <tr class="text-center">
						<th class="text-center">Sl. No.</th>
						<th>Barcode</th>
						<th>Product Name</th>
						<th>Vendor</th>
						<th>Qty.</th>
						<th>Price</th>
						<th>Measurement</th>
						<th>Type</th>
						<th>Requested By</th>
						<th>Request Date</th>
                      </tr>
								</thead>
								<tbody>
									<?php 
						$pid = $_GET['pid'];
						$fields = "pr.id, pr.product_id, pr.product_variant_id, pr.status, pr.loose_stock_quantity, pr.stock as pqty, pr.purchase_price, pr.created_date, pv.type, pv.stock, pv.measurement, pv.stock_unit_id, p.name, p.image, p.barcode, s.store_name";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . SELLERS . " s ON s.id = pr.seller_id";
						$where = "WHERE pr.status = :status AND pr.purchase_order_id = :purchase_order_id AND pr.transaction_type IN (7) ORDER BY pr.created_date DESC";
						$params = [
							':status' => 0,
							':purchase_order_id' => $pid							
						];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						//echo "<pre>";print_r($sqlQuery);die;
						
						$v_fields = "*";
						$v_where = "WHERE 1";
						$v_params = [];
						$vSqlQuery = $general_cls_call->select_query($v_fields, VENDORS, $v_where, $v_params, 2);
											
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
									  <tr id="dataRow<?php echo($arr->id);?>">
										<td><?PHP echo $key+1; ?></td>
										<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
										<td><?PHP echo $general_cls_call->explode_name($arr->name); ?></td>
										<td>
											<select name="vendor_id[]" class="form-select select2-dropdown vendor" tabindex="1" required>
											<option value="">Select...</option>
											<?php
												if($vSqlQuery[0] != '')
												{
													foreach($vSqlQuery as $v_arr)
													{
											?>
											<option value="<?php echo $v_arr->id ?>"><?php echo $v_arr->name ?></option>
											<?php 
													}
												}
											?>
											</select>
											<small class="text-danger vendor-error" style="display:none;"></small></td>
										<td><input type="text" name="stock[]" value="<?PHP echo $arr->type == 'loose' ? $arr->loose_stock_quantity : $arr->pqty; ?>" class="form-control form-control-sm qty" oninput="this.value = this.value.replace(<?php echo $arr->type == 'loose' ? '/[^0-9.]/g' : '/[^0-9]/g'; ?>, '')"><small class="text-danger qty-error" style="display:none;"></small></td>
										<td><input type="text" value="" name="purchase_price[]" oninput="this.value = this.value.replace('/[^0-9.]/g')" class="form-control form-control-sm price"><small class="text-danger price-error" style="display:none;"></small></td>
										<td><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
										<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?php echo $arr->type ?></span></td>
										<td><?PHP echo $arr->store_name; ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($arr->created_date, 'j M Y g:i A'); ?></td>
										
										<input type="hidden" value="<?php echo $arr->product_id ;?>" name="product_id[]">
										<input type="hidden" value="<?php echo $arr->product_variant_id ;?>" name="product_variant_id[]">
										
									  </tr>
										<?PHP
												$i++;
											}
										}
									?>
								</tbody>
							</table>
						</div>
						<div class="box-footer text-center">
							<?php 
								$checkWhere = "WHERE purchase_order_id = :purchase_order_id";
								$checkParams = [
									':purchase_order_id' => $pid							
								];
								$checkQuery = $general_cls_call->select_query('*', ADMIN_STOCK_PURCHASE_LIST, $checkWhere, $checkParams, 1);
								if(empty($checkQuery)){
							?>
								<button type="button" name="btnSubmit" value="SAVE" class="btn btn-grd btn-grd-success px-5 submit-purchase">Purchase Now</button>
								<?php } ?>
						  </div>
					</form>
					</div>
				</div>
				
     

    </div>
  </main>
  <!--end main wrapper-->
<div class="modal fade" id="purchase-qty-modal">
  <div class="modal-dialog modal-dialog-centered">
	<div class="modal-content">
	  <div class="modal-header border-bottom-0 py-2 bg-grd-primary">
		<h5 class="modal-title btn-grd">Confirmation</h5>
		<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
		  <i class="material-icons-outlined">close</i>
		</a>
	  </div>
	  <div class="modal-body">
		<div class="col-md-12">
			<select class="form-select select2-dropdown" onchange="chooseInsPurchase(this.value)">
				<option value="0">Select</option>
				<option value="1" selected>Instant Approved</option>
			</select>
		</div>
	  </div>
	  <div class="modal-footer border-top-0">
		<!--<button type="button" class="btn btn-grd btn-grd-danger rounded-0"
		  data-bs-dismiss="modal">Cancel</button>-->
		  <div class="col-md-12">
			<div class="d-md-flex d-grid justify-content-md-between">
				<button type="button" class="btn btn-outline-danger px-5" data-bs-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-grd btn-grd-success px-5" onclick="purchase_now()">Puschase</button>
			 </div>
		  </div>
	  </div>
	</div>
  </div>
</div>
<!--end main wrapper-->
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
</body>
</html>
<script>
$(document).ready(function () {
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}

	$('#example2').DataTable({
		paging: false
	});
});
$(document).on('click', '.submit-purchase', function(){

    let isValid = true;

    $('#example2 tbody tr').each(function(){

        let row = $(this);

        let qtyInput = row.find('.qty');
        let vendorInput = row.find('.vendor');
        let priceInput = row.find('.price');

        let qty = qtyInput.val();
        let vendor = vendorInput.val();
        let price = priceInput.val();

        let qerrorBox = row.find('.qty-error');
        let verrorBox = row.find('.vendor-error');
        let perrorBox = row.find('.price-error');

        // reset errors
        qerrorBox.hide().text('');
        verrorBox.hide().text('');
        perrorBox.hide().text('');

        // Qty validation
        if(qty == '' || qty == 0){
            qerrorBox.text('Stock required').show();
            isValid = false;
        }
        // Vendor validation
        if(vendor == '' || vendor == 0){
            verrorBox.text('Vendor required').show();
            isValid = false;
        }
		// price validation
        if(price == '' || price == 0){
            perrorBox.text('Price required').show();
            isValid = false;
        }

    });

    // stop if error
    if(!isValid){
        return false;
    }

    // open modal if all valid
    $('#purchase-qty-modal').modal('show');
});

function chooseInsPurchase(val) {
	$('#is_instant').val(val);
}
function purchase_now()
{
	$('#purchase-qty-modal').modal('hide');
	$('#submit_purchase').submit();
}

</script>
