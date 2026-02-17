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
	if(isset($_GET['m']) && $_GET['m']==1) {
			$msg= '<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
				<div class="text-white"><strong>Success</strong> Status update successfully.</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		  </div>';
		}
	/*=========== STATUS CHANGE START ================*/
		if(isset($_GET['mode']) && ($_GET['mode'] == '1' || $_GET['mode'] == '0'))
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Purchase Rejected List</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
     
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
                      <tr class="text-center">
						<th>Sl. No.</th>
						<th>Barcode</th>
						<th>Product Name</th>
						<th>Qty.</th>
						<th>Measurement</th>
						<th>Type</th>
						<th>Requested By</th>
						<th>Request Date</th>
                      </tr>
								</thead>
								<tbody>
									<?php 
						$fields = "pr.id, pr.product_id, pr.status, pr.loose_stock_quantity, pr.stock as pqty, pr.created_date, pv.type, pv.stock, pv.measurement, pv.stock_unit_id, p.name, p.image, p.barcode, s.store_name";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . SELLERS . " s ON s.id = pr.seller_id";
						$where = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type ORDER BY pr.created_date DESC";
						$params = [
							':status' => 2,
							':transaction_type' => 1	
						];
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
									  <tr id="dataRow<?php echo($arr->id);?>">
										<td><?PHP echo $key+1; ?></td>
										<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
										<td><?PHP echo $general_cls_call->explode_name($arr->name); ?></td>
										<td class="text-center"><?PHP echo $arr->type == 'loose' ? $arr->loose_stock_quantity : $arr->pqty; ?></td>
										<td class="text-center"><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
										<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type; ?></span></td>
										<td><?PHP echo $arr->store_name; ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($arr->created_date, 'j M Y g:i A'); ?></td>
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