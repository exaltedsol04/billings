<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1,3];
	
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();

	ob_end_flush();
	//echo $_SESSION['USER_ID'];die;
	$order_id = '';
	if(isset($_GET['order_id']))
	{
		/*$fields = "o.final_total as order_total, o.address, o.mobile, o.packing_charge, o.created_at, oi.status, oi.active_status, oi.product_name, oi.variant_name, oi.quantity, oi.discounted_price, oi.sub_total, oi.cancellation_reason, oi.canceled_at, oi.seller_id, s.name as seller_name, s.city_id, s.street";
		$tables = ORDERS_ITEMS . " oi
		INNER JOIN " . ORDERS . " o ON o.orders_id = oi.orders_id
		INNER JOIN " . SELLERS . " s ON s.id = oi.seller_id";*/
		
		//--------------------------
		
		if($_SESSION['USER_ID'] == 1)
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
		
	}
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
						  <div class="col">
						   <div class="">
							 <small>to</small>
							 <address class="m-t-5 m-b-5">
								<?php echo $sqlQuery[0]->address ?><br>
								Phone: <?php echo $sqlQuery[0]->mobile ?><br>
							 </address>
							</div>
						 </div>
						 <div class="col">
						   <div class="">
							 <small>Invoice</small>
							 <div class=""><b><?PHP echo $general_cls_call->change_date_format($sqlQuery[0]->created_at, 'j M Y g:i A'); ?></b></div>
							 <div class="invoice-detail">
								#<?php echo $_GET['order_id'] ;?><br>
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
							?>
							   <tr>
								  <td><?php echo $k+1; ?></td>
								  <td><?php echo $general_cls_call->cart_product_name($selectValue->product_name);  ?></td>
								  <td class="text-center"><?php echo $selectValue->variant_name; ?></td>
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

					    <div class="row bg-light align-items-center m-0">
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
					    </div><!--end row-->
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