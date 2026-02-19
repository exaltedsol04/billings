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
									<th>Unit</th>
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
									$where = "WHERE ". $whereSrc ." GROUP BY 
									CASE 
										WHEN pv.type = 'loose' 
											THEN asp.product_id
										ELSE asp.product_variant_id
									END
									ORDER BY asp.created_at DESC";
									
									
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $paramsSrc, 2);
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$arr)
										{
											$product_variant_arr = [];
											$placeholders = [];
											$paramsOrdItm = [];
											
											$barcode = $arr->barcode;
								            $barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
											
											// credit stock 
											$fieldsCredit = "
											SUM(
												CASE 
													WHEN pv.type = 'loose'
														THEN asp.loose_stock_quantity
													ELSE asp.stock
												END
											) AS total_stock
											";

											$tablesCredit = ADMIN_STOCK_PURCHASE_LIST . " asp
											INNER JOIN " . PRODUCT_VARIANTS . " pv 
												ON pv.id = asp.product_variant_id
											";

											$whereCredit = "
											WHERE asp.status = :status
											AND asp.product_stock_transaction_id = :product_stock_transaction_id

											AND (
													/* LOOSE → check by product_id */
													(pv.type = 'loose' AND asp.product_id = :product_id)

													OR

													/* NON LOOSE → check by variant_id */
													(pv.type != 'loose' AND asp.product_variant_id = :product_variant_id)
												)
											";

											$paramsCredit = [
												':product_id' => $arr->product_id,
												':product_variant_id' => $arr->product_variant_id, // required for non-loose
												':product_stock_transaction_id' => 0,
												':status' => 1
											];

											$stock_credit = $general_cls_call->select_join_query(
												$fieldsCredit,
												$tablesCredit,
												$whereCredit,
												$paramsCredit,
												1
											);


											
											// dedit debit admin_stock_transaction 
											$fieldsDebit = "
											SUM(
												CASE 
													WHEN pv.type = 'loose'
														THEN asp.loose_stock_quantity
													ELSE asp.stock
												END
											) AS total_stock
											";

											$tablesDebit = ADMIN_STOCK_PURCHASE_LIST . " asp
											INNER JOIN " . PRODUCT_VARIANTS . " pv 
												ON pv.id = asp.product_variant_id
											";

											$whereDebit = "
											WHERE asp.status = :status
											AND asp.product_stock_transaction_id != :product_stock_transaction_id

											AND (
													/* LOOSE → check by product_id */
													(pv.type = 'loose' AND asp.product_id = :product_id)

													OR

													/* NON LOOSE → check by variant_id */
													(pv.type != 'loose' AND asp.product_variant_id = :product_variant_id)
												)
											";

											$paramsDebit = [
												':product_id' => $arr->product_id,
												':product_variant_id' => $arr->product_variant_id, // required for non-loose
												':product_stock_transaction_id' => 0,
												':status' => 1
											];

											$admin_stock_debit = $general_cls_call->select_join_query(
												$fieldsDebit,
												$tablesDebit,
												$whereDebit,
												$paramsDebit,
												1
											);

											
											// debit stock from order item
											$order_item_stock = 0;
											$product_variants = $general_cls_call->select_query("id, type, stock_unit_id, measurement", PRODUCT_VARIANTS, "WHERE product_id =:product_id", array(':product_id'=> $arr->product_id,), 2);
											
											foreach($product_variants as $k=>$variants)
											{
												if($variants->type == 'loose'){
													$whereOrdItm = "WHERE product_variant_id=:product_variant_id AND active_status!=:active_status";
													$paramsOrdItm = [
														':product_variant_id' => $variants->id,
														'active_status' => 7
													];
													$orders = $general_cls_call->select_query("quantity",  ORDERS_ITEMS, $whereOrdItm, $paramsOrdItm, 2);
													foreach($orders as $orders_val){
														$measurement_arr = [
															'quantity' => $orders_val->quantity * $variants->measurement,
															'stock_unit_id' => $variants->stock_unit_id,
														];
														$measurement_units = $general_cls_call->convert_measurement($measurement_arr);
														$order_item_stock = $order_item_stock + $measurement_units['value']; 
													}
												}else{
													$whereOrdItm = "WHERE product_variant_id=:product_variant_id AND active_status!=:active_status";
													  $paramsOrdItm = [
															':product_variant_id' => $variants->id,
															'active_status' => 7
														];
													  
													  $qty_used = $general_cls_call->select_query_sum( ORDERS_ITEMS, $whereOrdItm, $paramsOrdItm, 'quantity');
													 
													  $qty_used = !empty($qty_used->total) ? $qty_used->total : 0;
													  
													  $order_item_stock = $order_item_stock + $qty_used; 
												}
												
												/*$whereDebit = "WHERE product_id=:product_id AND product_variant_id =:product_variant_id AND product_stock_transaction_id!=:product_stock_transaction_id";
											
												$paramsDebit = [
													':product_id'=> $arr->product_id,
													':product_variant_id'=> $variants->id,
													':product_stock_transaction_id'=>0
												];
												$stock_debit = $general_cls_call->select_query_sum( ADMIN_STOCK_PURCHASE_LIST, $whereDebit, $paramsDebit, 'stock');*/
											}
											//echo "<pre>";print_r($product_variant_arr);die;
											
											
											
											
											$admin_stock_debit = abs($admin_stock_debit->total_stock) + $order_item_stock;
											// pending stock
											$whereStatus = "WHERE product_id=:product_id AND product_stock_transaction_id =:product_stock_transaction_id AND status=:status";
											
											$paramsStatus = [
												':product_id'=> $arr->product_id,
												':product_stock_transaction_id'=>0,
												':status'=>0
											];
											$pending_stock = $general_cls_call->select_query_count( ADMIN_STOCK_PURCHASE_LIST, $whereStatus, $paramsStatus);
											
											//----get the vendors name------
											
											$whereVar = "WHERE product_id =:product_id";
											$paramsVar = [':product_id'=> $arr->product_id];
											$p_variants = $general_cls_call->select_query("distinct(product_variant_id)", ADMIN_STOCK_PURCHASE_LIST, $whereVar, $paramsVar, 2);
											
											$vendors_arr = [];
											
											foreach($p_variants as $pvi)
											{
												$fieldsVend = "distinct(vendor_id) , v.name as vendor_names";
												$tablesVend = ADMIN_STOCK_PURCHASE_LIST . " asp
												INNER JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
												$whereVend = "WHERE asp.product_id=:product_id AND asp.product_variant_id=:product_variant_id";
												$paramsVend = [
													':product_id'=>$arr->product_id,
													':product_variant_id'=>$pvi->product_variant_id
												];
												$sqlVendors = $general_cls_call->select_join_query($fieldsVend, $tablesVend, $whereVend, $paramsVend, 2);
												$vendors_arr[] = implode(', ', array_column($sqlVendors, 'vendor_names'));
											}
											
											//--- get the unit-----
										$fieldsUnit = "pv.id as product_variant_id, pv.product_id, pv.type, pv.stock_unit_id, pv.stock, pv.measurement, pv.discounted_price, p.name, p.image, p.barcode, u.name as unit_name";
										$tablesUnit = PRODUCT_VARIANTS . " pv
										INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id
										INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
										$whereUnit = "WHERE pv.product_id=:product_id";
										$paramsUnit = [
											':product_id' => $arr->product_id
										];
										
										$sqlUnit = $general_cls_call->select_join_query($fieldsUnit, $tablesUnit, $whereUnit, $paramsUnit, 1);
										/*$type_unit = $sqlUnit->type;
										if($sqlUnit->type == 'loose')
										{
											$type_unit = $sqlUnit->type.'-'.$sqlUnit->unit_name;
										}*/
										
										$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $sqlUnit->stock_unit_id), 1);
										$unitname = $unit_dtls->name;
										$type_unit = $sqlUnit->type;
										if($sqlUnit->type == 'loose')
										{
											$measurement_arr = [
												'quantity' => 1 * $arr->measurement,
												'stock_unit_id' => $sqlUnit->stock_unit_id,
											];
											$measurement_units = $general_cls_call->convert_measurement($measurement_arr);			
											$unitname = $measurement_units['unit'];
											$type_unit = $sqlUnit->type.'-'.$unitname;
										}
									?>
									  <tr id="dataRow<?php echo($arr->id);?>" class="text-center">
									    <td style="width:100px"><?php echo $i ;?></td>
										<td><?PHP echo implode(', ', $vendors_arr); ?></td>
										<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($arr->name); ?></td>
										<td><?php echo $stock_credit->total_stock; ?></td>
										<td><?php echo $admin_stock_debit; ?></td>
										<td><?PHP echo ($stock_credit->total_stock - $admin_stock_debit); ?></td>
										<td><span class="badge bg-grd-primary dash-lable"><?php echo $type_unit ;?></span></td>
										<td><?php echo $pending_stock; ?></td>
										<!--<td><?PHP echo $arr->measurement.'  '.$arr->unit_name; ?></td>-->
										<td><a href="<?php echo SITE_URL.'purchase-stock-list-view'; ?>?pvid=<?php echo($arr->product_id);?>"><div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-warning bg-opacity-10 text-warning" title = "View details" data-bs-toggle="tooltip">
											<span class="material-icons-outlined fs-5">visibility</span>
										</div></a></td>
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
<script>
$(document).ready(function(){
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}
	
	$('#example2').DataTable({
		order: [[8, 'desc']],
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