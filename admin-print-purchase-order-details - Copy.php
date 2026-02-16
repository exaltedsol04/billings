<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	$fields = "max(group_id) as grp_id";
	$where = 'WHERE 1';
	$params = [];
	$group_id = $general_cls_call->select_query($fields, ADMIN_STOCK_PURCHASE_LIST, $where, $params, 1);
	//echo 'hello print '.$_GET['group_id'];die;
	ob_start();;
	//echo $_SESSION['USER_ID'];die;
	$order_id = '';
	if(isset($_GET['group_id']))
	{
		$fields = "asp.id, asp.group_id, asp.product_id, asp.remarks, asp.status, asp.stock, asp.created_at, asp.purchase_price, u.name as unit_name, pv.measurement, p.name, p.barcode, v.name as vendor, pv.id as pvid, pv.type";
		$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
		LEFT JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
		$where = "WHERE asp.group_id=:group_id AND asp.product_stock_transaction_id=:product_stock_transaction_id";
		$params = [
			':group_id' => $_GET['group_id'],
			':product_stock_transaction_id'=>0
		];
		$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
		
	}
    
	//echo "<pre>";print_r($sqlQuery);die;
	ob_end_flush()
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			//$menuFile = 'adminMenu.php';
			if ($_SESSION['ROLE_ID'] == 1) {
				$menuFile = 'adminMenu.php';
			} elseif ($_SESSION['ROLE_ID'] == 5) {
				$menuFile = 'packagingOperatorMenu.php';
			}
			//include_once("includes/" . $menuFile);
		?>
	<!-- ######### MENU END ############### -->


  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<!--<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>-->
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Purchase Order Details</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<div class="card radius-10">
					  <div class="card-header py-3">
						    <div class="row align-items-center g-3">
							 <div class="col-12 col-lg-6">
							   <h5 class="mb-0">Purchase Order Details</h5>
							 </div>
							</div>
					  </div>
					  <div class="card-header py-2">
						<div class="row row-cols-1 row-cols-lg-3">
						 <div class="col">
						   <div class="">
							 <small>Invoice</small>
							 <div class=""><b><?PHP echo $general_cls_call->change_date_format($sqlQuery[0]->created_at, 'j M Y g:i A'); ?></b></div>
							</div>
						 </div>
						
					  </div>
					<div class="card-body">
					    <div class="table-responsive">
						 <table class="table table-invoice">
							<thead>
							    <tr>
									<th class="text-center">Sl. No.</th>
									<th>Vendor</th>
									<th>Product Name</th>
									
									<th>Measurement</th>
									<th>Type</th>
									<th class="text-center">Quantity</th>
									<th>Purchase Price</th>
									<!--<th>Purchase Date</th>-->
									<th>Total price</th>
									<!--<th>Remarks</th>-->
								</tr>
							</thead>
							<tbody>
									<?php
									if($sqlQuery[0] != '')
									{
										$i = 1;
										$total_amt = 0;
										foreach($sqlQuery as $k=>$selectValue)
										{
											$barcode = $selectValue->barcode;
								            $barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>">
										<td class="text-center"><?PHP echo $k+1; ?></td>
										<td><?PHP echo $selectValue->vendor; ?></td>
										<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($selectValue->name); ?></td>
										
										<td class="text-center"><?PHP echo $selectValue->measurement.'  '.$selectValue->unit_name; ?></td>
										<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?PHP echo $selectValue->type ;?></span></td>
										
										<!--<td><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>-->
										<td class="text-center">
										<?PHP echo $selectValue->stock ?>
										</td>
										<td>₹ <?php echo $selectValue->purchase_price ?></td>
										<td>₹ <?php echo $selectValue->stock*$selectValue->purchase_price ?></td>
										<!--<td><?php echo !empty($selectValue->remarks) ? $selectValue->remarks : '--';?></td>-->
										</tr>
										<?PHP
												$i++;
												$total_amt = $total_amt+ $selectValue->stock*$selectValue->purchase_price;
											}
										}
									?>
								</tbody>
						 </table>
					    </div>

					    <!--<div class="row bg-light align-items-center m-0">
							<div class="col col-auto p-4">
							   <p class="mb-0">Paking charge</p>
							   <h4 class="mb-0">₹<?php echo !empty($packing->packing_charge) ? $packing->packing_charge : 0 ?></h4>
							</div>
							<div class="col col-auto p-4">
							   <p class="mb-0">SUBTOTAL</p>
							   <h4 class="mb-0">₹<?php echo number_format($subtotal) ?></h4>
							</div>
							<div class="col col-auto me-auto p-4">
							</div>
							<div class="col bg-primary col-auto p-4">
							 <p class="mb-0 text-white">TOTAL</p>
							 <h4 class="mb-0 text-white">₹<?php echo number_format($packing->packing_charge + $subtotal) ?></h4>
							</div>
					    </div>-->
						
						<!--<div class="row bg-light align-items-center m-0">
							<div class="col col-auto p-4"></div>
							<div class="col col-auto p-4"></div>
							<div class="col col-auto me-auto p-4">
							</div>
							<div class="col col-auto p-4">
								<p class="mb-0">Sub total : <strong>₹<?php echo number_format($subtotal) ?></strong></p>
							    
								
								<p class="mb-0">Paking charge : <strong>₹<?php echo  $packing_charge; ?></strong></p>
							
								<p class="mb-0">Delivery charge : <strong>₹<?php echo $delivery_charge; ?></strong></p>
								
								<p class="mb-0">Discount : <strong>₹<?php echo $discount; ?></strong></p>
								
								<p class="mb-0">Final total : <strong>₹<?php echo $final_total; ?></strong></p>
								
								<p class="mb-0">Total amount : <strong>₹<?php echo $total_amount; ?></strong></p>
							</div>
					    </div>-->
						<div class="d-flex justify-content-end mt-3">

							<div class="bg-light p-3 rounded shadow-sm" style="min-width:320px">

								<table class="table table-sm table-borderless mb-0">

									<!--<tr>
										<td>Sub total</td>
										<td class="text-center">:</td>
										<td class="text-end">₹<?php echo $sub_total; ?></td>
									</tr>

									<tr>
										<td>Packing charge</td>
										<td class="text-center">:</td>
										<td class="text-end text-danger">+ ₹<?php echo $packing_charge; ?></td>
									</tr>

									<tr>
										<td>Delivery charge</td>
										<td class="text-center">:</td>
										<td class="text-end text-danger">+ ₹<?php echo $delivery_charge; ?></td>
									</tr>

									<tr>
										<td>Discount</td>
										<td class="text-center">:</td>
										<td class="text-end text-success">- ₹<?php echo number_format($discount, 2); ?></td>
									</tr>-->

									<tr class="border-top fs-5">
										<td class="fw-bold">Total amount</td>
										<td class="text-center fw-bold">:</td>
										<td class="text-end fw-bold">
											₹<?php echo $total_amt; ?>
										</td>
									</tr>

								</table>

							</div>

						</div>

						
						<!--end row-->
					</div>
				

    </div>
  </main>
<!--end main wrapper-->
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
<script>
$(document).ready(function(){
	  window.print();
});
</script>
</body>
</html>