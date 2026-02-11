<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1,3,5]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/

	ob_start();;
	//echo $_SESSION['USER_ID'];die;
	$order_id = '';
	if(isset($_GET['order_id']))
	{
		if($_SESSION['ROLE_ID'] == 1)
		{
			$where = "WHERE orders_id=:orders_id";
			$params = [
				':orders_id' => $_GET['order_id']
			];
		}
		else{
			//echo $_SESSION['USER_ID']; die;
			$where = "WHERE orders_id=:orders_id AND seller_id=:seller_id";
			$params = [
				':orders_id' => $_GET['order_id'],
				':seller_id' => $_SESSION['SELLER_ID']
			];
		}
		//$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
		
		$sqlQuery = $general_cls_call->select_query("*", ORDERS_ITEMS, $where, $params, 2);
		
		$whereOrder ="WHERE orders_id=:orders_id";
		$paramsOrder = [
				':orders_id' => $_GET['order_id']
			];
		$sqlOrder = $general_cls_call->select_query("id, orders_id, mobile, address, total, delivery_charge, packing_charge, final_total, payment_method", ORDERS, $whereOrder, $paramsOrder, 1);
				
		//echo "<pre>";print_r($sqlQuery);die;
		
		// get seller details
		$fieldSeller = "c.name as city_name, c.zone, c.state, s.name as seller_name, s.store_name, s.mobile, s.street as seller_street";
		$tableSeller = SELLERS . " s
		INNER JOIN " . CITIES . " c ON c.id = s.city_id";
		$whereSeller = "WHERE s.id=:id";
		$paramsSeller = [
			':id' => $sqlQuery[0]->seller_id
		];
		$sqlSellerQuery = $general_cls_call->select_join_query($fieldSeller, $tableSeller, $whereSeller, $paramsSeller, 1);
		//echo "<pre>";print_r($sqlSellerQuery);die;
		
		// get the packing charge
		
		$packing = $general_cls_call->select_query("packing_charge", ORDERS, "WHERE orders_id=:orders_id", [':orders_id' => $_GET['order_id']], 1);
		
		
		$sub_total = 0;
		$packing_charge = 0;
		$delivery_charge = 0;
		$final_total = 0;
		$discount = 0;
		$total_amount = 0;
		
		if($sqlOrder->payment_method=='wallet')
		{
			$sub_total = $sqlOrder->total;
			$packing_charge = $sqlOrder->packing_charge;
			$delivery_charge = $sqlOrder->delivery_charge;
			$final_total = $sqlOrder->total;
			$discount  = ($sqlOrder->total + $packing_charge) - $final_total;
			$total_amount = $final_total;
		}
		else{
			$sub_total = $sqlOrder->total;
			$packing_charge = $sqlOrder->packing_charge;
			$delivery_charge = $sqlOrder->delivery_charge;
			$final_total = $sqlOrder->final_total;
			$discount  = ($sqlOrder->total + $packing_charge + $delivery_charge) - $final_total;
			$total_amount = $final_total;
		}
		
	}

	ob_end_flush()
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			$menuFile = 'sellerMenu.php';
			if ($_SESSION['ROLE_ID'] == 1) {
				$menuFile = 'adminMenu.php';
			} elseif ($_SESSION['ROLE_ID'] == 5) {
				$menuFile = 'packagingOperatorMenu.php';
			}
			include_once("includes/" . $menuFile);
		?>
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Order View Details</a>
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
							   <h5 class="mb-0">Products List Details</h5>
							 </div>
							</div>
					  </div>
					  <div class="card-header py-2">
						<div class="row row-cols-1 row-cols-lg-3">
						  <div class="col">
						   <div class="">
							 <small>from</small>
							 <address class="m-t-5 m-b-5">
								<strong class="text-inverse"><?php echo $sqlSellerQuery->seller_name ?></strong><br>
								<?php echo $sqlSellerQuery->seller_street ?><br>
								<?php echo $sqlSellerQuery->city_name .' ('. $sqlSellerQuery->state.')' ?><br>
								Phone:<?php echo $sqlSellerQuery->seller_mobile ?>
							 </address>
							</div>
						  </div>
						  <?php 
						  if(!empty($sqlOrder->address) && !empty($sqlOrder->mobile))
						  {
						  ?>
						  <div class="col">
						   <div class="">
							 <small>to</small>
							 <address class="m-t-5 m-b-5">
								<?php echo $sqlOrder->address ?><br>
								Phone: <?php echo $sqlOrder->mobile ?><br>
							 </address>
							</div>
						 </div>
						 <?php 
						  }
						 ?>
						 <div class="col">
						   <div class="">
							 <small>Invoice</small>
							 <div class=""><b><?PHP echo $general_cls_call->change_date_format($sqlQuery[0]->created_at, 'j M Y g:i A'); ?></b></div>
							 <div class="invoice-detail">
								#<?php echo $sqlOrder->orders_id ;?><br>
							 </div>
						   </div>
						 </div>
						</div>
					  </div>
					<div class="card-body">
					    <div class="table-responsive">
						 <table class="table table-invoice">
							<thead>
							   <tr>
								  <th>Sl.No</th>
								  <th>Products</th>
								  <th class="text-center" style="width: 0%;">Variant name</th>
								  <th class="text-center" style="width: 0%;">Type</th>
								  <th class="text-center" style="width: 0%;">Quantity</th>
								  <th class="text-center" style="width: 0%;">Discount price</th>
								  <th class="text-center" style="width: 0%;">Sub total</th>
								  <th class="text-center" style="width: 0%;">Final total</th>
								  <!--<th class="text-center" style="width: 0%;">Status</th>
								  <th class="text-center" style="width: 0%;">Active status</th>
								  <th class="text-center" style="width: 0%;">Cancel reason</th>
								  <th class="text-center" style="width: 0%;">Cancel date</th>-->
							   </tr>
							</thead>
							<tbody>
							<?php 
							if($sqlQuery[0] != '')
							{
								$subtotal = 0;
								foreach($sqlQuery as $k=>$selectValue)
								{
									
									$seller = $general_cls_call->select_query("name", SELLERS, "WHERE id=:id", [':id' => $selectValue->seller_id], 1);
									
									// status
									$orderStatus = json_decode($selectValue->status);
									$statusValue = $orderStatus[0][0];
									
									$statusName = $general_cls_call->select_query("status", ORDERS_STATUS_LISTS, "WHERE id=:id", [':id' => $statusValue], 1);
									
									// active status
									$activeStatusValue = $selectValue->active_status;
									
									$activeStatusName = $general_cls_call->select_query("status", ORDERS_STATUS_LISTS, "WHERE id=:id", [':id' => $activeStatusValue], 1);
									
									$product_variant_type = $general_cls_call->select_query("type", PRODUCT_VARIANTS, "WHERE id=:id", [':id' => $selectValue->product_variant_id], 1);
									
							?>
							   <tr>
								  <td><?php echo $k+1; ?></td>
								  <td><?php echo $general_cls_call->cart_product_name($selectValue->product_name);  ?></td>
								  <td class="text-center"><?php echo $selectValue->variant_name; ?></td>
								  <td class="text-center"><span class="badge bg-grd-primary dash-lable"><?php echo $product_variant_type->type ?></span></td>
								  <td class="text-center"><?php echo $selectValue->quantity; ?></td>
								  <td class="text-center">₹<?php echo $selectValue->discounted_price ?></td>
								  <td class="text-center">₹<?php echo $selectValue->quantity * $selectValue->discounted_price ?></td>
								  <td class="text-center">₹<?php echo $selectValue->quantity * $selectValue->discounted_price ?></td>
								  <!--<td class="text-center"><?php echo $statusName->status ?></td>
								  <td class="text-center"><?php echo $activeStatusName->status ?></td>
								  <td class="text-center"><?php echo !empty($selectValue->cancellation_reason) ? $selectValue->cancellation_reason : '--'; ?></td>
								  <td class="text-center"><?php echo !empty($selectValue->canceled_at) ? $general_cls_call->change_date_format($selectValue->canceled_at, 'j M Y g:i A') : '--' ?></td>-->
								  
							   </tr>
							<?php 
							      $subtotal = $subtotal + $selectValue->quantity * $selectValue->discounted_price;
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

									<tr>
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
									</tr>

									<tr class="border-top fs-5">
										<td class="fw-bold">Total amount</td>
										<td class="text-center fw-bold">:</td>
										<td class="text-end fw-bold">
											₹<?php echo $total_amount; ?>
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