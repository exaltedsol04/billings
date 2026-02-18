<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => true,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/

	ob_start();
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
		{
			$fromDate = $_POST['fromDate'];
			$toDate = $_POST['toDate'];
			$whereDateRange = "AND poa.created_at >= :fromDate AND poa.created_at < DATE_ADD(:toDate, INTERVAL 1 DAY)";
			$params = [
				':status' => 3,
				':seller_id'=> $_SESSION['SELLER_ID'],
				':fromDate' => $_POST['fromDate'],
				':toDate'   => $_POST['toDate']
			];
			
		}
		else
		{
			$whereDateRange = 'AND DATE(poa.created_at) = CURDATE()';
			$params = [
				':seller_id'=> $_SESSION['SELLER_ID'],
				':status'=> 3
			];
		}
	
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			include_once("includes/sellerMenu.php");
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
						<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Assigned orders</a>
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
		<div class="row">
			<div class="col-md-12" id="msg"></div>
		</div>
		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<table id="example2" class="table table-striped table-bordered dataTable">
						<thead>
							<tr>
								<td></td>
								<td><input type="text" class="form-control" id="search-one" placeholder="Search by packaging operator"></td>
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
							<th>Customer name</th>
							<th class="text-center">Total Amount</th>
							<th class="text-center">Order Date</th>
							<th class="text-center">Delivery</th>
							<th>Delivery Type</th>
							<th>To be delivered</th>
							<th>Remaining Delivery Time</th>
							<th>Processed</th>
							<th>Packaging operator name</th>
							<th>Packed</th>
							<th>Out for delivery</th>
							<th>Delivery man</th>
							<th class="text-center">Status</th>
						  </tr>
						</thead>
						<tbody>
						<?php
							
							/*$where = "WHERE poa.assign_by=:seller_id 
								  AND poa.status=:status
								  ORDER BY poa.created_at DESC";
							$params = [
								':seller_id'=> $_SESSION['SELLER_ID'],
								':status'=> 3
							];*/
							
							$where = "WHERE poa.assign_by=:seller_id 
								  ".$whereDateRange." AND poa.status=:status";
							
							
							$fields = "o.id, o.orders_id, o.final_total, o.user_id, o.delivery_time, o.packing_charge, o.created_at, o.order_type, o.from_time, o.to_time, o.instant_delivery_time, o.payment_method, o.total, o.active_status, o.delivery_boy_id, po.name AS packaging_operator_name, osl.status AS orders_status_list_status, u.name AS customer_name, o.address_id";

							$tables = PACKAGING_OPERATORS_ASSIGN . " poa
							INNER JOIN " . ORDERS . " o ON o.id = poa.order_id
							LEFT JOIN " . PACKAGING_OPERATORS . " po ON po.id = poa.packaging_operator_id
							INNER JOIN " . ORDERS_STATUS_LISTS . " osl ON osl.id = poa.status
							LEFT JOIN " . USERS . " u ON u.id = o.user_id";
							
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
									
									/*$deliveryTime = trim($arr->delivery_time);
									if (preg_match('/(\d{1,2}:\d{2}\s?(AM|PM)\s*-\s*\d{1,2}:\d{2}\s?(AM|PM))/i', $deliveryTime, $matches))
									{
										$deliveryType = $matches[1];
									} else {
										$deliveryType = $general_cls_call->time_ago($deliveryTime);
									}*/
									$final_total = $arr->orders_items_sub_total;
									if($_SESSION['ROLE_ID'] == 1) {
										$final_total += $arr->packing_charge;
									}
									
									// get delivery boy 
									$fieldsDboy = "db.name as delivery_man";
									$tablesDboy = DELIVERY_BOYS . " db
									INNER JOIN " . USERS . " u ON u.id = db.admin_id";
									$whereDboy = "WHERE db.id =:id";
									$paramsDboy = [
											'id'=> $arr->delivery_boy_id
									  ];
									$sqlDboy = $general_cls_call->select_join_query($fieldsDboy, $tablesDboy, $whereDboy, $paramsDboy, 1);
							?>
							  <tr id="dataRow<?php echo($arr->id);?>">
								<td><?PHP echo $arr->id; ?></td>
								<!--<td><?PHP echo !empty($arr->customer_name) ? $arr->customer_name : 'N/A'; ?></td>-->
								<td><?PHP echo $general_cls_call->customer_order_address(array('address_id'=>$arr->address_id)); ?></td>
								
								<!--<td class="text-center">₹<?PHP echo $final_total; ?></td>-->
								<td class="text-center">₹<?PHP echo  ($arr->payment_method == 'waller') ? $arr->total : $arr->final_total; ?></td>
								<td class="text-center"><?PHP echo $general_cls_call->time_ago($arr->created_at). '<div style="font-size:10px; border-top:1px solid #5b6166;">'. $general_cls_call->change_date_format($arr->created_at, 'j M Y g:i A') . '</div>'; ?></td>
								<td class="text-center">--</td>
								<td><?PHP echo $arr->order_type; ?></td>
								<td><?php echo $to_be_delivered; ?></td>
								<td><?php echo $remaining_delivery_time; ?></td>
								<!--<td><?php echo $arr->orders_status_list_status; ?></td>-->
								<td style="white-space: nowrap;"><?php echo $arr->active_status >= 3 ?  '<span
                        class="lable-table bg-success-subtle text-success rounded border border-success-subtle font-text2 fw-bold">Completed<i
                          class="bi bi-check2 ms-2"></i></span>' : ''; ?></td>
								<td><?PHP echo !empty($arr->packaging_operator_name) ? $arr->packaging_operator_name : '<span
                        class="lable-table bg-primary-subtle text-primary rounded border border-primary-subtle font-text2 fw-bold">Waiting<i
                          class="bi bi-clock ms-2"></i></i></span>'; ?></td>
								<td style="white-space: nowrap;"><?php echo $arr->active_status == 3 ?  '<span
                        class="lable-table bg-warning-subtle text-warning rounded border border-warning-subtle font-text2 fw-bold">Process<i
                          class="bi bi-info-circle ms-2"></i></span>' : ($arr->active_status > 3 ? '<span
                        class="lable-table bg-success-subtle text-success rounded border border-success-subtle font-text2 fw-bold">Completed<i
                          class="bi bi-check2 ms-2"></i></span>': '') ?></td>
								<td style="white-space: nowrap;"><?php echo $arr->active_status > 2 && $arr->active_status < 4 ? '<span
                        class="lable-table bg-danger-subtle text-danger rounded border border-danger-subtle font-text2 fw-bold">Pending<i
                          class="bi bi-x-lg ms-2"></i></span>' : ($arr->active_status == 4 ? '<span
                        class="lable-table bg-warning-subtle text-warning rounded border border-warning-subtle font-text2 fw-bold">Process<i
                          class="bi bi-info-circle ms-2"></i></span>': '<span
                        class="lable-table bg-success-subtle text-success rounded border border-success-subtle font-text2 fw-bold">Completed<i
                          class="bi bi-check2 ms-2"></i></span>') ?></td>
						  <td style="white-space: nowrap;"><?php echo !empty($sqlDboy->delivery_man) ? $sqlDboy->delivery_man : '<span
                        class="lable-table bg-primary-subtle text-primary rounded border border-primary-subtle font-text2 fw-bold">Waiting<i
                          class="bi bi-clock ms-2"></i></i></span>'  ?></td>
								<td class="d-flex align-items-center gap-3">
									<!--<a href="javascript:void(0)" class="text-success font-text2" onclick="orderStatusChange(<?php echo($arr->id);?>)">
										<div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-success bg-opacity-10 text-success">
											<i class="lni lni-checkmark-circle fs-5"></i>
										</div>
									</a>-->
									<a href="<?php echo SITE_URL.'online-order-assign'; ?>?order_id=<?php echo($arr->id);?>">
										<button type="button" class="btn btn-success raised d-flex gap-2" title = "Update status" data-bs-toggle="tooltip"><i class="lni lni-checkmark-circle fs-5"></i>Change</button>
										<!--<div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-warning bg-opacity-10 text-warning" title = "View details" data-bs-toggle="tooltip">
											<span class="material-icons-outlined fs-5">visibility</span>
										</div>-->
									</a>
								</td>
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
  <!-- Modal -->
	<div class="modal fade" id="orderStatusModal">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2 bg-grd-info">
			<h5 class="modal-title btn-grd">Change Order Status</h5>
			<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
			  <i class="material-icons-outlined">close</i>
			</a>
		  </div>
		  <div class="modal-body">
			<div class="form-body">
			  <form name="frm" action="" method="post" class="row g-3">
				<div class="col-md-12">
				  <label for="order_status_id" class="form-label">Choose status</label>
				  <select id="order_status_id" class="form-select select2-dropdown mx-auto">
				  </select>
				</div>
				<div class="col-md-12" id="no_operator"></div>
				<div class="col-md-12">
				  <div class="d-md-flex d-grid justify-content-md-between">
					<input type="hidden" id="order_id" name="order_id">
					
					<button type="reset" class="btn btn-grd btn-grd-info px-4">Reset</button>
					<button type="button" id="orderStatusChangeSave" class="btn btn-grd btn-grd-danger px-4">Assign Operator</button>
				  </div>
				</div>
			  </form>
			</div>
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

function orderStatusChange(orderId)
{
	$('#no_operator').html('');
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {
		  action: 'orderStatusList',
		  order_id: orderId
		},
		dataType: "json",
		success: function(response){
			var html = '<option value="">Choose...</option>';
			if (response.status == 200) {
				$.each(response.rec, function (i, r) {
					html += '<option value="'+ r.id +'"> '+ r.name +' </option>';
				});
				$('#orderStatusModal').find('#order_status_id').html(html);
				$('#orderStatusModal').find('#order_id').val(orderId);
				$('#orderStatusModal').modal('show');
			} else if (response.status == 400) {
				$('#orderStatusModal').find('#order_status_id').html(html);
				$('#orderStatusModal').find('#no_operator').html(response.msg);
				$('#orderStatusModal').modal('show');
			} else {
				$('#orderStatusModal').find('#order_status_id').html('');
				$('#orderStatusModal').find('#no_operator').html('');
				$('#orderStatusModal').modal('hide');
			}
		}
	});
}
$(document).on('click', '#orderStatusChangeSave', function (e) {
  e.preventDefault();

  // Example data (change to your fields)
  let order_status_id = $('#order_status_id').val();
  
  $('#no_operator').html('');
  if(order_status_id == '')
  {
	  $('#no_operator').html('<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show"><div class="text-white"><strong>Error!</strong> Please choose status.</div><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
	  return false;
  }
  
  let orderId    = $('#order_id').val();
  $.ajax({
    url: "<?PHP echo SITE_URL; ?>ajax",
    type: 'POST',
    data: {
      action: 'order_status_change_save',
      order_status_id: order_status_id,
      order_id: orderId
    },
	dataType: "json",
    beforeSend: function () {
      $('#orderStatusChangeSave').prop('disabled', true).text('Assigning...');
    },
    success: function (response) {
		//var result = JSON.parse(response);
		if (response.status == 200) {
			console.log(response);
			$('#msg').html(response.msg);
			$('#orderStatusModal').find('#order_status_id').html('');
			$('#orderStatusModal').modal('hide');
			setTimeout(() => {
				window.location.reload();
			}, 2000);
		}
    },
    error: function (xhr) {
      console.log(xhr.responseText);
      alert('Something went wrong');
    },
    complete: function () {
      $('#orderStatusChangeSave').prop('disabled', false).text('Assign Operator');
    }
  });

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
