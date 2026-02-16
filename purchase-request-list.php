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
	/*=========== STATUS CHANGE START ================*/
		if(isset($_GET['mode']) && ($_GET['mode'] == '1' || $_GET['mode'] == '2' || $_GET['mode'] == '3'))
		{
			//echo $_GET['id'].' -- '.$_GET['mode'].' -- '.$_GET['qty'];die;
			// get product and product variant_ab
			$product_stk_dtls = $general_cls_call->select_query("*", PRODUCT_STOCK_TRANSACTION, "WHERE id =:id ", array(':id'=> $_GET['id']), 1);
			
			// check available stock 
			$fields = "
				SUM(
					CASE 
						WHEN pv.type = 'loose' THEN asp.loose_stock_quantity
						WHEN pv.type != 'loose' THEN asp.stock
						ELSE 0
					END
				) AS total_stock
			";

			$table = ADMIN_STOCK_PURCHASE_LIST . " asp
			INNER JOIN product_variants pv 
				ON pv.id = asp.product_variant_id";

			$where = "
			WHERE asp.status = ?
			AND asp.product_id = ?
			AND pv.deleted_at IS NULL
			AND (
					pv.type = 'loose'
				 OR (pv.type != 'loose' AND asp.product_variant_id = ?)
			)
			";

			$params = [1, $product_stk_dtls->product_id, $product_stk_dtls->product_variant_id];
			$result = $general_cls_call->select_query($fields, $table, $where, $params, 1);
			$stock_available = $result->total_stock ?? 0;
			
			$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $product_stk_dtls->product_variant_id), 1);
			/*$request_stock_quantity = $_GET['qty'];
			$loose_stock_quantity = '0.00';
			if($product_variant_dtls->type == 'loose')
			{
				$measurement_arr = [
					'quantity' => $_GET['qty'] * $product_variant_dtls->measurement,
					'stock_unit_id' => $product_variant_dtls->stock_unit_id,
				];
				$measurement_units = $general_cls_call->convert_measurement($measurement_arr);			
				$request_stock_quantity = $measurement_units['value'];
				$loose_stock_quantity = $measurement_units['value'];
			}	*/
			$stock = $_GET['qty'];
			$loose_stock_quantity = 0.00;
			if($product_variant_dtls->type == 'loose'){
				$stock = 0;
				$loose_stock_quantity = $_GET['qty'];
			}			
			$check_requested_stock = $_GET['qty'];
			/*$setValues="status=:status, approved_by=:approved_by, approved_date=:approved_date";
			$whereClause=" WHERE id=:id";
			$updateExecute=array(
				':approved_by'=>$_SESSION['USER_ID'],
				':status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
				':approved_date'=> date("Y-m-d H:i:s"),
				':id'=>$_GET['id']
			);*/
			
				
			if($_GET['mode'] == '1' || $_GET['mode'] == '3')
			{;
				 
				if ((float)$stock_available >= (float)$check_requested_stock)
				{
					//echo (float)$stock_available.' --- '.(float)$check_requested_stock;die;
					//if($product_variant_dtls->type == 'loose')
					//{
						$setValues="status=:status, approved_by=:approved_by, approved_date=:approved_date, loose_stock_quantity=:loose_stock_quantity, stock=:stock";
						$whereClause=" WHERE id=:id";
						$updateExecute=array(
							':approved_by'=>$_SESSION['USER_ID'],
							':status'=>$general_cls_call->specialhtmlremover($_GET['mode']),
							':approved_date'=> date("Y-m-d H:i:s"),
							':loose_stock_quantity'=> $general_cls_call->specialhtmlremover($loose_stock_quantity),
							':stock'=> $stock,
							':id'=>$_GET['id']
						);
					//}
					
					$updateRec=$general_cls_call->update_query(PRODUCT_STOCK_TRANSACTION, $setValues, $whereClause, $updateExecute);
					
					$seller_accept_status = 0;
					if($_GET['mode'] == '3') {
						$seller_accept_status = 5;
					}		
					
					// add to admin stock transaction table 					
					$field = "vendor_id, product_id, product_variant_id, stock, loose_stock_quantity,  product_stock_transaction_id, seller_accept_status, status, created_at, updated_at";
					$value = ":vendor_id, :product_id, :product_variant_id, :stock, :loose_stock_quantity, :product_stock_transaction_id, :seller_accept_status, :status, :created_at, :updated_at";
					
					$addExecute=array(
						':vendor_id'			=> 0,
						':product_id'			=> $product_stk_dtls->product_id,
						':product_variant_id'	=> $product_stk_dtls->product_variant_id,
						':stock'				=> -($stock),
						':loose_stock_quantity'	=> -($loose_stock_quantity),
						':product_stock_transaction_id'	=> $_GET['id'],
						':seller_accept_status'	=> $seller_accept_status,
						':status'				=> 1,
						':created_at' 			=> date('Y-m-d h:i:s'),
						':updated_at'		    => date('Y-m-d H:i:s')
					);
					
					// Add loose field properly					
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
			
			if($_GET['mode'] == '2')
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
						<th>Qty.</th>
						<th>Measurement</th>
						<th>Type</th>
						<th>Requested By</th>
						<th>Request Date</th>
						<th class="text-center">Action</th>
                      </tr>
								</thead>
								<tbody>
									<?php 
						$fields = "pr.id, pr.product_id, pr.status, pr.loose_stock_quantity, pr.stock as pqty, pr.created_date, pv.type, pv.stock, pv.measurement, pv.stock_unit_id, p.name, p.image, p.barcode, a.username";
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
										<td><input type="text" value="<?PHP echo $arr->type == 'loose' ? $arr->loose_stock_quantity : $arr->pqty; ?>" class="form-control form-control-sm qty" oninput="this.value = this.value.replace(<?php echo $arr->type == 'loose' ? '/[^0-9.]/g' : '/[^0-9]/g'; ?>, '')"><small class="text-danger qty-error" style="display:none;"></small></td>
										<td><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
										<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?php echo $arr->type ?></span></td>
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
															<a class="dropdown-item approveBtn" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($arr->id);?>&mode=1" title = "Click here to approve" data-bs-toggle="tooltip"><span class="text-success text-bold">Instant Approve</span></a>
															
															<a class="dropdown-item" href = "<?PHP echo SITE_URL.basename($_SERVER['PHP_SELF'], '.php'); ?>?id=<?php echo($arr->id);?>&mode=3&qty=<?PHP echo $arr->type == 'loose' ? $arr->loose_stock_quantity : $arr->pqty; ?>" title = "Click here to approve" data-bs-toggle="tooltip"><span class="text-info text-bold">Approve</span></a>
															
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
$(document).on('click', '.approveBtn', function(e){
    e.preventDefault();

    let url = $(this).attr('href');
    let qty = $(this).closest('tr').find('.qty').val();
	
	let row = $(this).closest('tr');
	let errorBox = row.find('.qty-error');
	errorBox.hide().text('');
	if(qty == '' || qty == 0)
	{
		errorBox.text('Stock required').show();
        qtyInput.focus();
		return false;
	}

    window.location.href = url + '&qty=' + qty;
});
</script>
