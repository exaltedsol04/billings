<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{
		//echo $vendor_id = $_POST['vendor_id'];die;
		$whereSrc = "asp.vendor_id=:vendor_id";
		$paramsSrc = [
			':vendor_id' => $_POST['vendor_id']
		];
		
	}
	else{
		$whereSrc = "1";
		$paramsSrc = [];
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
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Purchase Stock List</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<h6 class="mb-0 text-uppercase">Search panel</h6>
						<hr>
						<div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
							<div class="card-body">
								<form class="row g-4" method="post" action="">
									<div class="col-md-4">
										<label for="input5" class="form-label">Vendor</label>
										<select name="vendor_id" id="vendor_id" class="form-select select2-dropdown" tabindex="1" required>
										<option value="">Select...</option>
										<?php 
											$fields = "*";
											$where = "WHERE 1";
											$params = [];
											$sqlQuery = $general_cls_call->select_query($fields, VENDORS, $where, $params, 2);
											if($sqlQuery[0] != '')
											{
												foreach($sqlQuery as $arr)
												{
										?>
												<option value="<?php echo $arr->id ?>" <?php echo ($_POST['vendor_id'] == $arr->id) ? 'selected' : '' ?>><?php echo $arr->name ?></option>
										<?php 
												}
											}
										?>
									</select>
									</div>
									
									<div class="col-md-12">
									  <div class="d-md-flex d-grid justify-content-md-between">
										<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
										<button type="submit" class="btn btn-grd btn-grd-success px-5" name="btnUser" value="SAVE">Search</button>
									  </div>
									</div>
								</form>
							</div>
						</div>
     
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
								  <tr class="text-center">
									<th style="width:100px">Sl. No.</th>
									<th>Vendors</th>
									<th>Product Name</th>
									<th>Credit Stock</th>
									<th>Debit Stock</th>
									<th>Available Stock</th>
									<th>Pending Status</th>
									<!--<th>Measurement</th>-->
									<th>Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$fields = "asp.id, asp.product_id, asp.product_variant_id, asp.status, SUM(asp.stock) as total_stock, asp.created_at, u.name as unit_name, pv.measurement, p.name, p.barcode, v.name as vendor";
									
									$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
									INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
									INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
									INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
									LEFT JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
									$where = "WHERE ". $whereSrc ." GROUP BY asp.product_id  ORDER BY asp.created_at DESC";
									
									
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $paramsSrc, 2);
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$selectValue)
										{
											$product_variant_arr = [];
											$placeholders = [];
											$paramsOrdItm = [];
											
											$barcode = $selectValue->barcode;
								            $barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
											
											// credit stock 
											$whereCredit = "WHERE product_id= :product_id AND  product_stock_transaction_id= :product_stock_transaction_id AND status=:status";
											
											$paramsCredit = [
												':product_id' => $selectValue->product_id,
												':product_stock_transaction_id' => 0,
												':status' => 1
											];
											$stock_credit = $general_cls_call->select_query_sum( ADMIN_STOCK_PURCHASE_LIST, $whereCredit, $paramsCredit, 'stock');
											
											// dedit debit admin_stock_transaction 
											$whereDebit = "WHERE product_id=:product_id AND product_stock_transaction_id!=:product_stock_transaction_id AND status=:status";
											
											$paramsDebit = [
												':product_id'=> $selectValue->product_id,
												':product_stock_transaction_id'=>0,
												':status'=>1
											];
											$admin_stock_debit = $general_cls_call->select_query_sum( ADMIN_STOCK_PURCHASE_LIST, $whereDebit, $paramsDebit, 'stock');
											
											// debit stock from order item
											$order_item_stock = 0;
											$product_variants = $general_cls_call->select_query("id", PRODUCT_VARIANTS, "WHERE product_id =:product_id", array(':product_id'=> $selectValue->product_id,), 2);
											
											foreach($product_variants as $k=>$variants)
											{
												$whereOrdItm = "WHERE product_variant_id=:product_variant_id AND active_status!=:active_status";
												  $paramsOrdItm = [
														':product_variant_id' => $variants->id,
														'active_status' => 7
													];
												  
												  $qty_used = $general_cls_call->select_query_sum( ORDERS_ITEMS, $whereOrdItm, $paramsOrdItm, 'quantity');
												 
												  $qty_used = !empty($qty_used->total) ? $qty_used->total : 0;
												  
												  $order_item_stock = $order_item_stock + $qty_used; 
											}
											//echo "<pre>";print_r($product_variant_arr);die;
											
											
											$admin_stock_debit = abs($stock_debit) + $order_item_stock;
											// pending stock
											$whereStatus = "WHERE product_id=:product_id AND product_stock_transaction_id =:product_stock_transaction_id AND status=:status";
											
											$paramsStatus = [
												':product_id'=> $selectValue->product_id,
												':product_stock_transaction_id'=>0,
												':status'=>0
											];
											$pending_stock = $general_cls_call->select_query_count( ADMIN_STOCK_PURCHASE_LIST, $whereStatus, $paramsStatus);
											
											//---------------------
											
											/*$fieldsVend = "distinct(vendor_id) , v.name as vendor_names";
											$tablesVend = ADMIN_STOCK_PURCHASE_LIST . " asp
											INNER JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
											$whereVend = "WHERE asp.product_id=:product_id AND asp.product_stock_transaction_id=:product_stock_transaction_id";
											$paramsVend = [
												':product_id'=>$selectValue->product_id,
												':product_stock_transaction_id'=>0
											];
											$sqlVendors = $general_cls_call->select_join_query($fieldsVend, $tablesVend, $whereVend, $paramsVend, 2);*/
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>" class="text-center">
									    <td style="width:100px"><?php echo $k+1 ;?></td>
										<td style="width:100px"><?PHP echo $selectValue->vendor; ?></td>
										<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($selectValue->name); ?></td>
										<td><?php echo $stock_credit->total; ?></td>
										<td><?php echo $admin_stock_debit; ?></td>
										<td><?PHP echo $stock_credit->total-$admin_stock_debit; ?></td>
										<td><?php echo $pending_stock; ?></td>
										<!--<td><?PHP echo $selectValue->measurement.'  '.$selectValue->unit_name; ?></td>-->
										<td><a href="<?php echo SITE_URL.'purchase-stock-list-view'; ?>?pvid=<?php echo($selectValue->product_id);?>"><div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-warning bg-opacity-10 text-warning" title = "View details" data-bs-toggle="tooltip">
											<span class="material-icons-outlined fs-5">visibility</span>
										</div></a></td>
									</tr>
										<?PHP
												$i++;
											}
										}
										else
										{
									?>
									  <tr>
										<td colspan="9">
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
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
<script>
$(document).ready(function(){
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}
	
	$('#example2').DataTable({
		order: [[7, 'desc']],
		columnDefs: [
        {
            targets: 0,        // 1st column
            orderable: true,  // allow manual ordering
            orderSequence: ['asc', 'desc'] // manual toggle only
        }
    ] 
	});
});
</script>
</body>
</html>