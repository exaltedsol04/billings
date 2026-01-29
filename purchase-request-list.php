<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
		/*if(isset($_GET['m']) && $_GET['m']==1) 
		{
			$msg= '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
				<div class="text-white"><strong>Success</strong> Status update successfully.</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		  </div>';
		}*/
	/*=========== STATUS CHANGE START ================*/
		if(isset($_GET['mode']) && ($_GET['mode'] == '1' || $_GET['mode'] == '2' || $_GET['mode'] == '3'))
		{
			//echo $_GET['id'].' '.$_GET['mode'];die;
			// get product and product variant_ab
			$product_stk_dtls = $general_cls_call->select_query("*", PRODUCT_STOCK_TRANSACTION, "WHERE id =:id ", array(':id'=> $_GET['id']), 1);
			
			// check available stock 
			$stock_available = $general_cls_call->select_query_sum( ADMIN_STOCK_PURCHASE_LIST, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id", array(':product_variant_id'=> $product_stk_dtls->product_variant_id, 'status'=>1, 'product_id'=> $product_stk_dtls->product_id), 'stock');
			
			
			$setValues="status=:status, approved_by=:approved_by, approved_date=:approved_date";
			$whereClause=" WHERE id=:id";
			$updateExecute=array(
				':approved_by'=>$_SESSION['USER_ID'],
				':status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
				':approved_date'=> date("Y-m-d H:i:s"),
				':id'=>$_GET['id']
			);
				
			if($_GET['mode'] == '1')
			{				
				if($stock_available->total >= $_GET['qty'])
				{
					$updateRec=$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
					
					
					// add to admin stock transaction table 
					
					$field = "vendor_id, product_id, product_variant_id, stock,  product_stock_transaction_id, status, created_at, updated_at";
					$value = ":vendor_id, :product_id, :product_variant_id, :stock,  :product_stock_transaction_id,:status, :created_at, :updated_at";
					
					$addExecute=array(
						':vendor_id'			=> 0,
						':product_id'			=> $product_stk_dtls->product_id,
						':product_variant_id'	=> $product_stk_dtls->product_variant_id,
						':stock'				=> -($_GET['qty']),
						':product_stock_transaction_id'	=> $_GET['id'],
						':status'				=> 1,
						':created_at' 			=> date('Y-m-d h:i:s'),
						':updated_at'		    => date('Y-m-d H:i:s')
					);
					$general_cls_call->insert_query(ADMIN_STOCK_PURCHASE_LIST, $field, $value, $addExecute);
					
					if($updateRec)
					{
						$sucMsg="Data has been submitted successfully";
					}
				}
				else{
					$erMsg = "Stock not available";
				}
			}
			
			if($_GET['mode'] == '2' || $_GET['mode'] == '3')
			{
				$updateRec=$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
			}
			
			if(empty($_GET['qty']))
			{
				$updateRec=$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
				if($updateRec)
				{
					$sucMsg="Data has been submitted successfully";
				}
			}
			
			//header("location:".SITE_URL.basename($_SERVER['PHP_SELF'], '.php'));
		}
		
		if(isset($sucMsg)) 
		{
			$sucMsg = '';
			$msg= '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
				<div class="text-white"><strong>Success</strong> Status update successfully.</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		  </div>';
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
								<li class="breadcrumb-item active" aria-current="page">Purchase Request List</li>
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
						</tr>
                      <tr  class="text-center">
						<th>Sl. No.</th>
						<th>Barcode</th>
						<th>Product Name</th>
						<th>Qty.</th>
						<th>Measurement</th>
						<th>Requested By</th>
						<th>Request Date</th>
						<th class="text-center">Action</th>
                      </tr>
								</thead>
								<tbody>
									<?php 
						$fields = "pr.id, pr.product_id, pr.status, pr.stock as pqty, pr.created_date, pv.type, pv.stock, pv.measurement, pv.stock_unit_id, p.name, p.image, p.barcode, a.username";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . ADMIN_MASTER . " a ON a.id = pr.seller_id";
						$where = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type ORDER BY pr.created_date DESC";
						$params = [
							':status' => 0,
							':transaction_type' => 1							
						];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						//echo "<pre>";print_r($sqlQuery);die;
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $key=>$arr)
							{	
								/*$imagePath = MAIN_SERVER_PATH . $arr->image;
								if (!empty($arr->image) && file_exists($imagePath)) {
									$imagePath = MAIN_SERVER_PATH . $arr->image;
								} else {
									$imagePath = IMG_PATH . 'noImg.jpg';
								}*/
								
								$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
								$unitname = $unit_dtls->name;
					?>
									  <tr id="dataRow<?php echo($arr->id);?>"  class="text-center">
										<!--<td><img src="<?PHP echo $imagePath; ?>" height="50"></td>-->
										<td><?PHP echo $key+1; ?></td>
										<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
										<td><?PHP echo $general_cls_call->explode_name($arr->name); ?></td>
										<td><input type="text" value="<?PHP echo $arr->pqty ?>" class="form-control form-control-sm qty"></td>
										<td><?PHP echo $arr->measurement.' '.$unitname; ?></td>
										<td><?PHP echo $arr->username; ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($arr->created_date, 'j M Y g:i A'); ?></td>
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
															<a class="dropdown-item approveBtn" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($arr->id);?>&mode=1&qty=<?php echo $arr->pqty ?>" title = "Click here to approve" data-bs-toggle="tooltip"><span class="text-success text-bold">Instant Approve</span></a>
															
															<a class="dropdown-item" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($arr->id);?>&mode=3&qty=<?php echo $arr->pqty ?>" title = "Click here to approve" data-bs-toggle="tooltip"><span class="text-info text-bold">Approve</span></a>
															
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
<script>
$(document).on('click', '.approveBtn', function(e){
    e.preventDefault();

    let url = $(this).attr('href');
    let qty = $(this).closest('tr').find('.qty').val();

    window.location.href = url + '&qty=' + qty;
});
</script>
