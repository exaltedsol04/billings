<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1,3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	//echo $_SESSION['USER_ID'];die;
	
	if(isset($_GET['mode']) && ($_GET['mode'] == '1' || $_GET['mode'] == '2'))
	{	
//echo $_GET['id'].' '.$_GET['mode'].' '.$_GET['qty'];die;
		if($_GET['mode'] == 1)
		{
			if($_GET['qty'] !='')
			{
				//echo $_GET['qty'];die;
				$setValues="status=:status, stock=:stock, updated_at=:updated_at";
				$whereClause=" WHERE id=:id";
				$updateExecute=array(
					':status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
					':stock'=>$general_cls_call->specialhtmlremover($_GET['qty']),
					':updated_at'=> date("Y-m-d H:i:s"),
					':id'=>$_GET['id']
				);
				$updateRec=$general_cls_call->update_query(ADMIN_STOCK_PURCHASE_LIST, $setValues, $whereClause, $updateExecute);
			}
		}
		
		if($_GET['mode'] == 2)
		{
			$setValues="status=:status, updated_at=:updated_at";
			$whereClause=" WHERE id=:id";
			$updateExecute=array(
				':status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
				':updated_at'=> date("Y-m-d H:i:s"),
				':id'=>$_GET['id']
			);
			$updateRec=$general_cls_call->update_query(ADMIN_STOCK_PURCHASE_LIST, $setValues, $whereClause, $updateExecute);
		}
		//header("location:".SITE_URL.basename($_SERVER['PHP_SELF'], '.php')."?m=1");
		if($updateRec)
		{
			$sucMsg="Status updated successfully";
		}
		
		header("location:".SITE_URL.basename($_SERVER['PHP_SELF'], '.php').'?pvid='. $_GET['pvid']);
	}
	
	//if(isset($_GET['pvid']))
	//{
		$fields = "asp.id, asp.product_id, asp.remarks, asp.status, asp.stock, asp.created_at, asp.purchase_price, u.name as unit_name, pv.measurement, p.name, p.barcode, v.name as vendor, pv.id as pvid";
		$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
		LEFT JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
		$where = "WHERE asp.status=:status AND asp.product_stock_transaction_id=:product_stock_transaction_id";
		$params = [
				':status'=>2,
				':product_stock_transaction_id'=>0
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
									</tr>
								  <tr>
									<th class="text-center">Sl. No.</th>
									<th>Vendor</th>
									<th>Product Name</th>
									<th class="text-center">Stock</th>
									<th>Measurement</th>
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
										foreach($sqlQuery as $k=>$selectValue)
										{
											$barcode = $selectValue->barcode;
								            $barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>">
										<td class="text-center"><?PHP echo $k+1; ?></td>
										<td><?PHP echo $selectValue->vendor; ?></td>
										<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($selectValue->name); ?></td>
										<td class="text-center"><?PHP echo $selectValue->stock ?></td>
										<td class="text-center"><?PHP echo $selectValue->measurement.'  '.$selectValue->unit_name; ?></td>
										<td>₹ <?php echo $selectValue->purchase_price ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>
										<td><?php echo !empty($selectValue->remarks) ? $selectValue->remarks : '--';?></td>
										<td class="text-center">
											<div class="ms-auto">
												<div class="btn-group">
													<p class="dash-lable mb-0 bg-danger bg-opacity-10 text-danger rounded-2">Rejected</p>
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