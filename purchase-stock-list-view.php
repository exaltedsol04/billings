<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1];
	
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();

	ob_end_flush();
	//echo $_SESSION['USER_ID'];die;
	
	if(isset($_GET['mode']) && ($_GET['mode'] == '1' || $_GET['mode'] == '2'))
	{		
		$setValues="status=:status, updated_at=:updated_at";
		$whereClause=" WHERE id=:id";
		$updateExecute=array(
			':status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
			':updated_at'=> date("Y-m-d H:i:s"),
			':id'=>$_GET['id']
		);
		$updateRec=$general_cls_call->update_query(ADMIN_STOCK_PURCHASE_LIST, $setValues, $whereClause, $updateExecute);
		//header("location:".SITE_URL.basename($_SERVER['PHP_SELF'], '.php')."?m=1");
		if($updateRec)
		{
			$sucMsg="Status updated successfully";
		}
		
		header("location:".SITE_URL.basename($_SERVER['PHP_SELF'], '.php').'?pvid='. $_GET['pvid']);
	}
	
	if(isset($_GET['pvid']))
	{
		$fields = "asp.id, asp.product_id, asp.remarks, asp.status, asp.stock, asp.created_at, u.name as unit_name, pv.measurement, p.name, p.barcode, v.name as vendor, pv.id as pvid";
		$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
		INNER JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
		$where = "WHERE asp.product_variant_id=:product_variant_id";
		$params = [
			':product_variant_id' => $_GET['pvid']
		];
		$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
				
		//echo "<pre>";print_r($sqlQuery);die;
	}
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
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Purchase Stock View</li>
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
									</tr>
								  <tr>
									<th class="text-center">S. No.</th>
									<th>Vendor</th>
									<th>Product Name</th>
									<th class="text-center">Stock</th>
									<th>Measurement</th>
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
										<td class="text-center"><?PHP echo $selectValue->stock; ?></td>
										<td class="text-center"><?PHP echo $selectValue->measurement.'  '.$selectValue->unit_name; ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>
										<td><?php echo !empty($selectValue->remarks) ? $selectValue->remarks : '--';?></td>
										<td class="text-center">
											<div class="ms-auto">
												  <div class="btn-group">
												  <?php 
													if($selectValue->status == 0 || $selectValue->status == 2)
													{
													?>
													<button type="button" class="btn btn-<?PHP echo $selectValue->status==1 ? 'success' : ($selectValue->status==2 ? 'danger' : 'warning'); ?>">
													<?PHP echo $selectValue->status==1 ? 'Approved' : ($selectValue->status==2 ? 'Rejected' : 'Pending'); ?>
													</button>
													<button type="button" class="btn btn-<?PHP echo $selectValue->status==1 ? 'success' : ($selectValue->status==2 ? 'danger' : 'warning'); ?> split-bg-<?PHP echo $selectValue->status==1 ? 'success' : ($selectValue->status==2 ? 'danger' : 'warning'); ?> dropdown-toggle dropdown-toggle-split"
													  data-bs-toggle="dropdown"> <span class="visually-hidden">Toggle Dropdown</span>
													</button>
													
													<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end"> 
															<a class="dropdown-item" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($selectValue->id);?>&mode=1&pvid=<?php echo $selectValue->pvid ?>" title = "Click here to approve" data-bs-toggle="tooltip"><span class="text-success text-bold">Approve</span></a>
															
															<a class="dropdown-item" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($selectValue->id);?>&mode=2&pvid=<?php echo $selectValue->pvid ?>" title = "Click here to reject" data-bs-toggle="tooltip"><span class="text-danger text-bold">Reject</span></a>
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
										else
										{
									?>
									  <tr>
										<td colspan="8">
										 No record found.
										</td>
									  </tr>
						<?PHP
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
	<?PHP include_once("includes/adminFooter.php"); ?>
<!-- ######### FOOTER END ############### -->
</body>
</html>