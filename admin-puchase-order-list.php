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
	//echo $_SESSION['USER_ID'];die;
	$fields = "sum(asp.purchase_price) as tot_price , asp.id, asp.group_id, asp.product_id, asp.remarks, asp.status, asp.stock, asp.created_at, asp.purchase_price, u.name as unit_name, pv.measurement, p.name, p.barcode, v.name as vendor, pv.id as pvid, pv.type";
	$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
	INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
	INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
	INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
	LEFT JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
	$where = "WHERE asp.product_stock_transaction_id=:product_stock_transaction_id GROUP BY group_id";
	$params = [
		':product_stock_transaction_id'=>0
	];
	$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
	//echo "<pre>";print_r($sqlQuery);die;

	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			$menuFile = 'sellerMenu.php';
			if ($_SESSION['ROLE_ID'] == 1) {
				$menuFile = 'adminMenu.php';
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Purchase Order List</a>
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
									<tr class="text-center">
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<th class="text-center">Sl. No.</th>
									<th class="text-center">Purchase Date</th>
									<th class="text-center">Total Amount</th>
									<th class="text-center">Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$selectValue)
										{
											$barcode = $selectValue->barcode;
								            $barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>">
										<td class="text-center"><?PHP echo $i; ?></td>
										<td class="text-center"><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>
										<td class="text-center">₹ <?php echo $selectValue->tot_price ?></td>
										<td class="text-center">
											<div class="ms-auto">
												<div class="btn-group">
													<p class="dash-lable mb-0 bg-success bg-opacity-10 text-success rounded-2">
													<a href="javascript:void(0)" class="wh-42 bg-grd-success text-white rounded-circle d-flex align-items-center justify-content-center" onclick="print_page(<?php echo $selectValue->group_id;?>)" title = "Click here to Print Barcode" data-bs-toggle="tooltip"><i class="material-icons-outlined">print</i></a>
													</p>
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
		order: [[1, 'desc']],
		columnDefs: [
        {
            targets: 0,        // 1st column
            orderable: true,  // allow manual ordering
            orderSequence: ['asc', 'desc'] // manual toggle only
        }
    ] 
	});
});

function print_page(id)
{
	var baseUrl = '<?PHP echo SITE_URL; ?>';
	var redirectUrl = baseUrl + 'admin-print-purchase-order-details?group_id='+ id;
	window.open(redirectUrl, '_blank'); 
}
</script>