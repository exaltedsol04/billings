<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();

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
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Purchase Stock List</li>
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
									<th>Measurement</th>
									<th>Purchase Date</th>
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
									INNER JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
									$where = "WHERE asp.status=:status GROUP BY asp.product_variant_id HAVING SUM(asp.stock) > 0";
									$params = [
										':status'=> 1
									];
									
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$selectValue)
										{
											$barcode = $selectValue->barcode;
								            $barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
											
											// credit stock 
											$whereCredit = "WHERE product_id= :product_id AND product_variant_id= :product_variant_id AND  product_stock_transaction_id= :product_stock_transaction_id";
											
											$paramsCredit = [
												':product_id' => $selectValue->product_id,
												':product_variant_id' => $selectValue->product_variant_id,
												':product_stock_transaction_id' => 0
											];
											$stock_credit = $general_cls_call->select_query_sum( ADMIN_STOCK_PURCHASE_LIST, $whereCredit, $paramsCredit, 'stock');
											
											// credit debit 
											$whereDebit = "WHERE product_id=:product_id AND product_variant_id =:product_variant_id AND product_stock_transaction_id!=:product_stock_transaction_id";
											
											$paramsDebit = [
												':product_id'=> $selectValue->product_id,
												':product_variant_id'=> $selectValue->product_variant_id,
												':product_stock_transaction_id'=>0
											];
											$stock_debit = $general_cls_call->select_query_sum( ADMIN_STOCK_PURCHASE_LIST, $whereDebit, $paramsDebit, 'stock');
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>" class="text-center">
									    <td style="width:100px"><?php echo $k+1 ;?></td>
										<td style="width:100px"><?PHP echo $selectValue->vendor; ?></td>
										<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($selectValue->name); ?></td>
										<td><?php echo $stock_credit->total; ?></td>
										<td><?php echo !empty($stock_debit->total) ? abs($stock_debit->total) : '0'; ?></td>
										<td><?PHP echo $selectValue->total_stock; ?></td>
										<td><?PHP echo $selectValue->measurement.'  '.$selectValue->unit_name; ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>
										<td><a href="<?php echo SITE_URL.'purchase-stock-list-view'; ?>?pvid=<?php echo($selectValue->product_variant_id);?>"><i class="lni lni-keyword-research"></i></a></td>
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
	<?PHP include_once("includes/adminFooter.php"); ?>
<!-- ######### FOOTER END ############### -->
</body>
</html>