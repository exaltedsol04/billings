<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => true,
		'pageAccessRoleIds' => [1,3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	
	ob_start();
	
		if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
		{
			$fromDate = $_POST['fromDate'];
			$toDate = $_POST['toDate'];
			$whereDateRange = "AND os.created_at >= :fromDate AND os.created_at < DATE_ADD(:toDate, INTERVAL 1 DAY)";
			
			if($_SESSION['ROLE_ID'] == 1)
			{
				$params = [
					':active_status' => 6,
					':fromDate' => $_POST['fromDate'],
					':toDate'   => $_POST['toDate']
				];
			}
			else{
				$params = [
					':active_status' => 6,
					':seller_id'=> $_SESSION['SELLER_ID'],
					':fromDate' => $_POST['fromDate'],
					':toDate'   => $_POST['toDate']
				];
			}
		}
		else
		{
			$whereDateRange = 'AND DATE(os.created_at) = CURDATE()';
			if($_SESSION['ROLE_ID'] == 1)
			{
				$params = [
					':active_status' => 6
				];
			}
			else{
				$params = [
					':seller_id'=> $_SESSION['SELLER_ID'],
					':active_status'=> 6
				];
			}
		}
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			$menuFile = 'sellerMenu.php';
			if ($_SESSION['ROLE_ID'] == 1) {
				$menuFile = 'adminMenu.php';
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Online delivered orders list</a>
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
									<div class="col-md-6">
										<label for="input1" class="form-label">From date</label>
										<input type="text" name="fromDate" id="fromDate" class="form-control" placeholder="Start Date" readonly>
									</div>
									<div class="col-md-6">
										<label for="input5" class="form-label">To date</label>
										<input type="text" name="toDate" id="toDate" class="form-control" placeholder="End Date" readonly>
									</div>
									
									<div class="col-md-12">
									  <div class="d-md-flex d-grid justify-content-md-between">
										<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
										<button type="submit" class="btn btn-grd btn-grd-success px-4" name="btnUser" value="SAVE">Search</button>
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
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by customer"></td>
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
									<th>Delivery Type</th>
									<th>To be delivered</th>
									<th>Deliver min/hrs</th>
									<th>Order Status</th>
									<th class="text-center">Action</th>
								  </tr>
								</thead>
								<tbody>
								<?php
									if($_SESSION['ROLE_ID'] == 1) {
										$where = "WHERE oi.active_status=:active_status
										". $whereDateRange ."
											  GROUP BY oi.order_id
											  ORDER BY 
												  CASE 
													  WHEN o.order_type = 'slot' THEN o.from_time
													  ELSE o.created_at
												  END DESC";
									} else {
										$where = "WHERE oi.seller_id=:seller_id 
											  AND oi.active_status=:active_status
											  ". $whereDateRange ."
											  GROUP BY oi.order_id
											  ORDER BY 
												  CASE 
													  WHEN o.order_type = 'slot' THEN o.from_time
													  ELSE o.created_at
												  END DESC";
										/*$params = [
											':seller_id'=> $_SESSION['SELLER_ID'],
											':active_status'=> 6
										];*/
									}
									
									$fields = "o.id, o.orders_id, o.final_total, o.user_id, o.delivery_time, o.status, o.packing_charge, o.order_type, o.from_time, o.to_time, o.instant_delivery_time, o.created_at, o.active_status, o.payment_method, o.total, SUM(oi.sub_total) AS orders_items_sub_total, u.name AS customer_name, osl.status AS orders_status_list_status, os.created_at AS orders_statuses_created_at, o.address_id";

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
												$to_be_delivered	= $arr->instant_delivery_time.' mins';
												$delivery_max_time = $general_cls_call->add_minutes($arr->created_at,  $arr->instant_delivery_time);
												if($arr->order_type=='slot') {
													$delivery_time = $arr->from_time;
													$to_be_delivered = $general_cls_call->time_diff($arr->from_time, $arr->to_time);
													$delivery_max_time = $arr->to_time;
												}
											
												/*$deliveryTime = trim($arr->delivery_time);
												if (preg_match('/(\d{1,2}:\d{2}\s?(AM|PM)\s*-\s*\d{1,2}:\d{2}\s?(AM|PM))/i', $deliveryTime, $matches))
												{
													$deliveryType = $matches[1];
												} else {
													$deliveryType = $general_cls_call->time_ago($deliveryTime);
												}*/
												// calculate final amount
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
											<!--<td><?PHP echo !empty($arr->customer_name) ? $arr->customer_name : 'N/A'; ?></td>-->
											<td><?PHP echo $general_cls_call->customer_order_address(array('address_id'=>$arr->address_id)); ?></td>
											<!--<td class="text-center">₹<?PHP echo $final_total; ?></td>-->
											<td class="text-center">₹<?PHP echo  ($arr->payment_method == 'waller') ? $arr->total : $arr->final_total; ?></td>
											<td class="text-center"><?PHP echo $general_cls_call->time_ago($arr->created_at). '<div style="font-size:10px; border-top:1px solid #5b6166;">'. $general_cls_call->change_date_format($arr->created_at, 'j M Y g:i A') . '</div>'; ?></td>
											<td class="text-center">--</td>
											<td><?PHP echo  $arr->order_type; ?></td>
											<td><?php echo $to_be_delivered; ?></td>
											<td><?php echo $deliver_in; ?></td>
											<td><?php echo $arr->orders_status_list_status; ?></td>
											<td class="text-center"><a href="<?php echo SITE_URL.'online-order-details'; ?>?order_id=<?php echo($arr->orders_id);?>"><div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-warning bg-opacity-10 text-warning" title = "View details" data-bs-toggle="tooltip">
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

<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script>

$(function () {

  let start = moment().startOf('today');
  let end   = moment().endOf('today');

  function setDates(start, end) {
    $('#fromDate').val(start.format('YYYY-MM-DD'));
    $('#toDate').val(end.format('YYYY-MM-DD'));
  }

	// Apply picker on FROM field (controls both)
	$('#fromDate').daterangepicker({
		startDate: start,
		endDate: end,
		autoUpdateInput: false,
		parentEl: 'body',          // ⭐ FIX POSITION
		opens: 'right',            // open next to input
		drops: 'down',             // force downward
		locale: {
			cancelLabel: 'Clear'
		}
	});


  // When range selected
  $('#fromDate').on('apply.daterangepicker', function (ev, picker) {
      setDates(picker.startDate, picker.endDate);
  });

  // Clear
  $('#fromDate').on('cancel.daterangepicker', function () {
      $('#fromDate, #toDate').val('');
  });

  // Set default
  setDates(start, end);
});


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
