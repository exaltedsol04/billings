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
								<li class="breadcrumb-item active" aria-current="page">Online orders list</li>
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
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by custoner"></td>
										<td><input type="text" class="form-control" id="search-two" placeholder="Search by mobile"></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<th style="width:100px">Order Id</th>
									<th>Seller</th>
									<th class="text-center">Total Amount</th>
									<th class="text-center">Order Date</th>
									<th class="text-center">Delivery</th>
									<th>Delivery Type/Slot</th>
									<th>Order Status</th>
									<th>Assigned packing man</th>
									<th>Delivery man</th>
									<th>Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$where = "WHERE 1 ORDER BY created_at DESC";
									$params = [];
									
									$sqlQuery = $general_cls_call->select_query("*", ORDERS, $where, $params, 2);
									//echo "<pre>";print_r($sqlQuery);die;
						
										if($sqlQuery[0] != '')
										{
											$i = 1;
											foreach($sqlQuery as $k=>$selectValue)
											{
												$orderStatus = json_decode($selectValue->status);
												$statusValue = $orderStatus[0][0];
												//echo $statusValue;
												if($statusValue == 3)
												{
													$seller = $general_cls_call->select_query("name", USERS, "WHERE id=:id", [':id' => $selectValue->user_id], 1);
													
													$deliveryTime = trim($selectValue->delivery_time);

													if (preg_match('/(\d{1,2}:\d{2}\s?(AM|PM)\s*-\s*\d{1,2}:\d{2}\s?(AM|PM))/i', $deliveryTime, $matches))
													{
														$deliveryType = $matches[1];
													} else {
														$deliveryType = $general_cls_call->time_ago($deliveryTime);
													}
													
													$statusName = $general_cls_call->select_query("status", ORDERS_STATUS_LISTS, "WHERE id=:id", [':id' => $statusValue], 1);
													
													
												$delivfields = "d.name as delivery_boy";
												$delivtables = ORDERS_ITEMS . " oi
												INNER JOIN " . DELIVERY_BOYS . " d ON d.id = oi.delivery_boy_id";
												$delivwhere = "WHERE oi.orders_id=:orders_id";
												$delivparams = [
												    ':orders_id' => $selectValue->orders_id
												];
												$sqldeliv = $general_cls_call->select_join_query($delivfields, $delivtables, $delivwhere, $delivparams, 1);
												
										?>
										  <tr id="dataRow<?php echo($selectValue->id);?>">
											<td><?PHP echo $selectValue->orders_id; ?></td>
											<td><?PHP echo !empty($seller->name) ? $seller->name : 'N/A'; ?></td>
											<td class="text-center"><?PHP echo $selectValue->final_total; ?></td>
											<td class="text-center"><?PHP echo $general_cls_call->time_ago($selectValue->created_at); ?></td>
											<td class="text-center">--</td>
											<td><?PHP echo  $deliveryType; ?></td>
											<td><?php echo $statusName->status; ?></td>
											<td></td>
											<td><?php echo !empty($sqldeliv->delivery_boy) ? $sqldeliv->delivery_boy : 'N/A' ?></td>
											<td><a href="<?php echo SITE_URL.'online-order-view'; ?>?order_id=<?php echo($selectValue->orders_id);?>"><i class="lni lni-keyword-research"></i></a></td>
										  </tr>
										<?PHP
												}
												$i++;
											}
										}
										else
										{
									?>
									  <tr>
										<td colspan="7">
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
<script>
$(document).ready(function(){
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}
	
	$('#example2').DataTable({
		order: [[4, 'asc']],
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
