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
	
	$orWhere = '';
	if(isset($_GET['sid'])  && $_GET['sid'] != 'admin')
	{
		$seller_id = $_GET['sid'];
		$orWhere = "AND pr.seller_id =:seller_id";
		
		$fields = "pr.id, pr.product_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode, u.name as unit_name";
		$tables = PRODUCT_STOCK_TRANSACTION . " pr
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
		$where = "WHERE pr.status=:status ".$orWhere." GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
		$params = [
			':status'			=> 1,
			':seller_id'		=> $seller_id
		];
		$sqlQueryP = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
		//echo "<pre>";print_r($sqlQueryP);die;
	}
	else if(isset($_GET['sid'])  && $_GET['sid'] == 'admin')
	{
		$fields = "pv.id as pvid, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, p.name, p.image, p.barcode, u.name as unit_name";
		$tables = PRODUCT_VARIANTS . " pv
		INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id 
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
		$where = "WHERE 1 GROUP BY pv.id ORDER BY p.name";
		$params = [];
		$sqlQueryP = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
		//echo "<pre>";print_r($sqlQueryP);die;
	}
	//echo "<pre>";print_r($sqlQueryP);die;
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Products List</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<div class="row">
					<div class="col-md-5">
						<select name="seller_id" id="seller_id" class="form-select select2-dropdown" tabindex="1" onchange="select_sellers(this.value)">
							<option value="">Select...</option>
							<option value="admin">Admin</option>
							<?PHP
								$sqlQuery = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id!=:admin_id", array(':admin_id'=>$_SESSION['USER_ID']), 2);
								if($sqlQuery[0] != '')
								{
									foreach($sqlQuery as $arr)
									{	
							?>
								<option value="<?PHP echo $arr->admin_id ?>"><?PHP echo $arr->name; ?></option>
							<?PHP
									}
								}
							?>
						</select>
						<span class="text-danger" id="err_seller"></span>
					</div>
				</div>
			
				<div class="card mt-4">
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
										
									</tr>
								  <tr class="text-center">
									<!--<th>Image</th>-->
									<th>Sl. No.</th>
									<th>Barcode</th>
									<th>Name</th>
									<th>Available Stock</th>
									<th>Measurement</th>
									</tr>
								</thead>
								<tbody>
									<?php 
								
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQueryP[0] != '')
									{
										$i = 1;
										$total_stock = 0;
										foreach($sqlQueryP as $k=>$arr)
										{	
										  if(!empty($arr->pvid))
										  {
											  $stock_used = $general_cls_call->select_query_sum( ADMIN_STOCK_PURCHASE_LIST, "WHERE product_variant_id =:product_variant_id AND status=:status AND product_id=:product_id", array(':product_variant_id'=> $arr->pvid, 'status'=>1, 'product_id'=> $arr->product_id), 'stock');
											  $total_stock = $stock_used->total;
											 
											  if(empty($total_stock))
											  {
												  $total_stock = 0;
											  }
											  
											  
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
												':product_variant_id' => $arr->pvid, // required for non-loose
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
											
											
											$admin_stock_debit = abs($admin_stock_debit->total_stock) + $order_item_stock;
										    }
										  }
										  else{
											  $total_stock = $arr->total_stock;
										  }
									?>
											  <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
												<td><?PHP echo $k+1; ?></td>
												<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
												<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
												<!--<td><?PHP echo $total_stock ?></td>-->
												<td><?PHP echo ($stock_credit->total_stock - $admin_stock_debit); ?></td>
												<td><?PHP echo $arr->measurement. ' ' .$arr->unit_name; ?></td>
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
  <!--<div class="modal fade" id="barcodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>-->
<div id="printBarcodeArea" class="print-barcode-only">
    <svg id="barcode"></svg>
</div>


<!--end main wrapper-->
	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->

</body>

</html>
<script>
function select_sellers(id)
{
	
	if(id != '')
	{
		window.location.href = "<?= SITE_URL ?>products?sid=" + id;
	}
	else{
		window.location.href = "<?= SITE_URL ?>products";
	}
}
</script>