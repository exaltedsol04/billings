<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [6]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	//echo $_SESSION['USER_ID'];die;
	
	if(isset($_GET['mode']) && ($_GET['mode'] == '3' || $_GET['mode'] == '4'))
	{	
		if($_GET['mode'] == 3)
		{
			if($_GET['qty'] !='')
			{
				//echo $_GET['qty'];die;
				$setValues="po_status=:po_status";
				$whereClause=" WHERE id=:id";
				$updateExecute=array(
					':po_status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
					':id'=>$_GET['id']
				);
				$updateRec=$general_cls_call->update_query(ADMIN_STOCK_PURCHASE_LIST, $setValues, $whereClause, $updateExecute);
			}
		}
		
		if($_GET['mode'] == 4)
		{
			$setValues="po_status=:po_status";
			$whereClause=" WHERE id=:id";
			$updateExecute=array(
				':po_status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
				':id'=>$_GET['id']
			);
			$updateRec=$general_cls_call->update_query(ADMIN_STOCK_PURCHASE_LIST, $setValues, $whereClause, $updateExecute);
		}
		//header("location:".SITE_URL.basename($_SERVER['PHP_SELF'], '.php')."?m=1");
		if($updateRec)
		{
			$sucMsg="Status updated successfully";
		}
		
		//header("location:".SITE_URL.basename($_SERVER['PHP_SELF'], '.php').'?pvid='. $_GET['pvid']);
	}
	
	//if(isset($_GET['pvid']))
	//{
		$fields = "asp.id, asp.product_id, asp.remarks, asp.status, asp.loose_stock_quantity, asp.stock, asp.created_at, asp.purchase_price, u.name as unit_name, pv.measurement, p.name, p.barcode, v.name as vendor, pv.stock_unit_id, pv.id as pvid, pv.type";
		$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
		LEFT JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
		$where = "WHERE asp.status=:status AND asp.vendor_id=:vendor_id";
		$params = [
				':status'=>0,
				':vendor_id'=>$_SESSION['VENDOR_ID']
			];
		$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
				
		//echo "<pre>";print_r($sqlQuery);die;
	//}

	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			$menuFile = 'sellerMenu.php';
			if ($_SESSION['ROLE_ID'] == 6) {
				$menuFile = 'vendorMenu.php';
			}
			include_once("includes/" . $menuFile);
		?>
	<!-- ######### MENU END ############### -->


  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Purchase Stock View</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<?PHP 
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
						<div class="table-responsive">
							<table id="example2" class="table table-striped table-bordered">
								<thead>
									<tr>
										<td></td>
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by Vendor"></td>
										<td><input type="text" class="form-control" id="search-two" placeholder="Search by name"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<th class="text-center">Sl. No.</th>
									<th>Vendor</th>
									<th>Product Name</th>
									<th class="text-center">Stock</th>
									<th>Measurement</th>
									<th>Type</th>
									<th>Purchase Price</th>
									<th>Purchase Date</th>
									<th>Remarks</th>
									<th class="text-center">Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$arr)
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
								
											$barcode = $arr->barcode;
								            $barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
									?>
									  <tr id="dataRow<?php echo($arr->id);?>">
										<td class="text-center"><?PHP echo $k+1; ?></td>
										<td><?PHP echo $arr->vendor; ?></td>
										<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($arr->name); ?></td>
										<td class="text-center">
										<?PHP echo $arr->type == 'loose' ? $arr->loose_stock_quantity : $arr->stock; ?>
										</td>
										<td class="text-center"><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
										<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type ;?></span></td>
										<td>₹ <?php echo $arr->purchase_price ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($arr->created_at, 'j M Y g:i A'); ?></td>
										<td><?php echo !empty($arr->remarks) ? $arr->remarks : '--';?></td>
										<td class="text-center">
											<div class="ms-auto">
												  <div class="btn-group">
												  <?php 
													if($arr->status == 0 || $arr->status == 2)
													{
													?>
													<button type="button" class="btn btn-<?PHP echo $arr->status==1 ? 'success' : ($arr->status==2 ? 'danger' : 'warning'); ?>">
													<?PHP echo $arr->status==1 ? 'Approved' : ($arr->status==2 ? 'Rejected' : 'Pending'); ?>
													</button>
													<button type="button" class="btn btn-<?PHP echo $arr->status==1 ? 'success' : ($arr->status==2 ? 'danger' : 'warning'); ?> split-bg-<?PHP echo $arr->status==1 ? 'success' : ($arr->status==2 ? 'danger' : 'warning'); ?> dropdown-toggle dropdown-toggle-split"
													  data-bs-toggle="dropdown"> <span class="visually-hidden">Toggle Dropdown</span>
													</button>
													
													<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end"> 
															<a class="dropdown-item approveBtn" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($arr->id);?>&mode=3" title = "Click here to inward" data-bs-toggle="tooltip"><span class="text-success text-bold">Approved</span></a>
															
															<a class="dropdown-item" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($arr->id);?>&mode=4" title = "Click here to reject" data-bs-toggle="tooltip"><span class="text-danger text-bold">Reject</span></a>
													</div>
													<?php 
													}
													else{
													?>
													 <p class="dash-lable mb-0 bg-success bg-opacity-10 text-success rounded-2">Completed</p>
													<?php 
													}
													?>
												</div>
											</div>
										</td>
										
									  </tr>
										<?PHP
												$i++;
											}
										}
									?>
								</tbody>
							</table>
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
</body>
</html>
<script>
$(document).ready(function(){
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}
	
	$('#example2').DataTable({
		order: [[6, 'desc']],
		columnDefs: [
        {
            targets: 0,        // 1st column
            orderable: true,  // allow manual ordering
            orderSequence: ['asc', 'desc'] // manual toggle only
        }
    ] 
	});
	
	// update po status in admin product table
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {action:'updateVendorPoStatus'},
		dataType: "json",
		success: function(response){
			//alert(response.status);alert(response.discount_price);
		}
	});
});
$(document).on('click', '.approveBtn', function(e){
    e.preventDefault();

    let url = $(this).attr('href');
    let qty = $(this).closest('tr').find('.qty').val();
	
	let row = $(this).closest('tr');
	let errorBox = row.find('.qty-error');
	errorBox.hide().text('');
	if(qty == '' || qty == 0)
	{
		errorBox.text('Stock is required').show();
        qtyInput.focus();
		return false;
	}
    window.location.href = url + '&qty=' + qty;
});
</script>