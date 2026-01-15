<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
		if(isset($_GET['m']) && $_GET['m']==1) {
			$msg= '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
				<div class="text-white"><strong>Success</strong> Status update successfully.</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		  </div>';
		}
	/*=========== STATUS CHANGE START ================*/
		if(isset($_GET['mode']) && ($_GET['mode'] == '2' || $_GET['mode'] == '0'))
		{		
			$setValues="status=:status, approved_by=:approved_by, approved_date=:approved_date";
			$whereClause=" WHERE id=:id";
			$updateExecute=array(
				':approved_by'=>$_SESSION['USER_ID'],
				':status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
				':approved_date'=> date("Y-m-d H:i:s"),
				':id'=>$_GET['id']
			);
			$updateRec=$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
			header("location:".SITE_URL.basename($_SERVER['PHP_SELF'], '.php')."?m=1");
		}
	/*=========== STATUS CHANGE END ================*/
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
		
		<?php echo $msg;?>
		<div id="msg"></div>
				
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Purchase Approved List</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
     
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example1" class="table table-striped table-bordered">
								<thead>
									<tr>
							<td><input type="text" class="form-control" id="search-zero1" placeholder="Search by barcode"></td>
							<td><input type="text" class="form-control" id="search-one1" placeholder="Search by product name"></td>
							<td></td>
							<td></td>
							<td></td>
							<td><input type="text" class="form-control" id="search-five1" placeholder="Search by seller name"></td>
							<td></td>
						</tr>
                      <tr>
						<th>Barcode</th>
						<th>Product Name</th>
						<th>Qty.</th>
						<th>Measurement</th>
						<th>Request Date</th>
						<th>Requested By</th>
						<th class="text-center">Action</th>
                      </tr>
								</thead>
								<tbody>
									<?php 
						$fields = "pr.id, pr.product_id, pr.qty, pr.request_date, pr.status, pv.type, pv.stock, pv.measurement, p.name, p.image, p.barcode, a.username";
						$tables = PURCHASE_REQUESTS . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . ADMIN_MASTER . " a ON a.id = pr.created_by";
						$where = "WHERE pr.status = :status ORDER BY pr.request_date DESC";
						$params = [
							':status' => 1
						];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $arr)
							{	
								/*$imagePath = MAIN_SERVER_PATH . $arr->image;
								if (!empty($arr->image) && file_exists($imagePath)) {
									$imagePath = MAIN_SERVER_PATH . $arr->image;
								} else {
									$imagePath = IMG_PATH . 'noImg.jpg';
								}*/
					?>
									  <tr id="dataARow<?php echo($arr->id);?>">
										<!--<td><img src="<?PHP echo $imagePath; ?>" height="50"></td>-->
										<td><?PHP echo $arr->barcode; ?></td>
										<td><?PHP echo $general_cls_call->explode_name($arr->name); ?></td>
										<td><?PHP echo $arr->qty.' '.$arr->type; ?></td>
										<td><?PHP echo $arr->measurement; ?></td>
										<td><?PHP echo $arr->request_date; ?></td>
										<td><?PHP echo $arr->username; ?></td>
										<td class="text-center">
											<div class="ms-auto">
												  <div class="btn-group">
													<button type="button" class="btn btn-<?PHP echo $arr->status==1 ? 'success' : ($arr->status==2 ? 'danger' : 'warning'); ?>">
													<?PHP echo $arr->status==1 ? 'Approved' : ($arr->status==2 ? 'Rejected' : 'Pending'); ?>
													</button>
													<button type="button" class="btn btn-<?PHP echo $arr->status==1 ? 'success' : ($arr->status==2 ? 'danger' : 'warning'); ?> split-bg-<?PHP echo $arr->status==1 ? 'success' : ($arr->status==2 ? 'danger' : 'warning'); ?> dropdown-toggle dropdown-toggle-split"
													  data-bs-toggle="dropdown"> <span class="visually-hidden">Toggle Dropdown</span>
													</button>
													<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end"> 
															<a class="dropdown-item" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($arr->id);?>&mode=0" title = "Click here to pending" data-bs-toggle="tooltip"><span class="text-warning text-bold">Pending</span></a>
															
															<a class="dropdown-item" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($arr->id);?>&mode=2" title = "Click here to reject" data-bs-toggle="tooltip"><span class="text-danger text-bold">Reject</span></a>
													</div>
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
										<td colspan="7" class="text-center">No record found.
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