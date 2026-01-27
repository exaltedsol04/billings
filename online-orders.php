<?PHP error_reporting(0);
	include_once 'init.php';
	
	$pageAccessRoleIds = [1,3];
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Online orders list</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
     
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example2" class="table table-striped table-bordered dataTable">
								<thead>
									<tr>
										<td></td>
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by customer"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<th style="width:100px">Order Id</th>
									<th>Customer Name</th>
									<th class="text-center">Total Amount</th>
									<th class="text-center">Order Date</th>
									<th class="text-center">Delivery</th>
									<th>Delivery Type/Slot</th>
									<th>To be delivered</th>
									<th>Remaining Delivery Time</th>
									<th>Deliver min/hrs</th>
									<th>Order Status</th>
									<th class="text-center">Action</th>
								  </tr>
								</thead>
								<tbody>
								<?php
									if($_SESSION['ROLE_ID'] == 1)
									{
										$where = "WHERE 1
											  GROUP BY oi.order_id
											  ORDER BY 
												  CASE 
													  WHEN o.order_type = 'slot' THEN o.from_time
													  ELSE o.created_at
												  END DESC";
										$params = [];	
									} else{
										$where = "WHERE oi.seller_id = :seller_id
											  GROUP BY oi.order_id
											  ORDER BY 
												  CASE 
													  WHEN o.order_type = 'slot' THEN o.from_time
													  ELSE o.created_at
												  END DESC";
										$params = [
											':seller_id'=> $_SESSION['SELLER_ID']
										];
									}
									$fields = "o.id, o.orders_id, o.final_total, o.user_id, o.delivery_time, o.status, o.packing_charge, o.order_type, o.from_time, o.to_time, o.instant_delivery_time, o.created_at, o.active_status, SUM(oi.sub_total) AS orders_items_sub_total, u.name AS customer_name, osl.status AS orders_status_list_status, os.created_at AS orders_statuses_created_at";

									$tables = ORDERS . " o
									INNER JOIN " . ORDERS_ITEMS . " oi ON oi.order_id = o.id
									LEFT JOIN " . USERS . " u ON u.id = o.user_id
									INNER JOIN " . ORDERS_STATUS_LISTS . " osl ON osl.id = o.active_status
									LEFT JOIN " . ORDERS_STATUSES . " os ON os.order_id = o.id AND os.status = o.active_status";
									
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
										
									//echo "<pre>";print_r($sqlQuery);die;
									
									if($sqlQuery[0] != '')
									{
										$i = 1;
										
										foreach($sqlQuery as $k=>$arr)
										{
											$final_total = 0;
											
											$delivery_time		= $arr->created_at;
											$to_be_delivered	= $arr->instant_delivery_time;
											$delivery_max_time = $general_cls_call->add_minutes($arr->created_at,  $arr->instant_delivery_time);
											if($arr->order_type=='slot') {
												$delivery_time = $arr->from_time;
												$to_be_delivered = $general_cls_call->time_diff($arr->from_time, $arr->to_time);
												$delivery_max_time = $arr->to_time;
											}
											$current_time = date('Y-m-d H:i:s');		
											$remaining_delivery_time = $general_cls_call->time_diff($current_time, $delivery_max_time);
											
											$deliveryTime = trim($arr->delivery_time);
											if (preg_match('/(\d{1,2}:\d{2}\s?(AM|PM)\s*-\s*\d{1,2}:\d{2}\s?(AM|PM))/i', $deliveryTime, $matches))
											{
												$deliveryType = $matches[1];
											} else {
												$deliveryType = $general_cls_call->time_ago($deliveryTime);
											}
											//calculate time
											//calculate total
											$final_total = $arr->orders_items_sub_total;
											if($_SESSION['ROLE_ID'] == 1) {
												$final_total += $arr->packing_charge;
											}
											//deliver in HH/MINS
											$deliver_in = 'NA';
											if($arr->active_status == 6) {
												$order_start_time = $delivery_time;
												$delivered_time = $arr->orders_statuses_created_at;
												$deliver_in = $general_cls_call->time_diff_format_two($order_start_time, $delivered_time). '<div style="font-size:10px; border-top:1px solid #5b6166;">'. $general_cls_call->change_date_format($arr->orders_statuses_created_at, 'j M Y g:i A') . '</div>';
											}
									?>
									  <tr id="dataRow<?php echo($arr->id);?>">
										<td><?PHP echo $arr->id; ?></td>
										<td><?PHP echo !empty($arr->customer_name) ? $arr->customer_name : 'N/A'; ?></td>
										<td class="text-center">₹<?PHP echo $final_total; ?></td>
										<td class="text-center"><?PHP echo $general_cls_call->time_ago($arr->created_at); ?></td>
										<td class="text-center"><span class="d-none"><?PHP echo $delivery_time; ?></span><?PHP echo $general_cls_call->change_date_format($delivery_time, 'j M Y g:i A'); ?></td>
										<td><?PHP echo  $deliveryType; ?></td>
										<td><?php echo $to_be_delivered; ?></td>
										<td><?php echo $remaining_delivery_time; ?></td>
										<td><?php echo $deliver_in; ?></td>
										<td><?php echo $arr->orders_status_list_status; ?></td>
										<td class="text-center"><a href="<?php echo SITE_URL.'online-order-details'; ?>?order_id=<?php echo($arr->orders_id);?>"><i class="lni lni-keyword-research"></i></a></td>
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
