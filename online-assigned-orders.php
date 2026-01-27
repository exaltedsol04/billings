<?PHP 
	error_reporting(0);
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
						<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Assigned orders</a>
						</li>
					</ol>
				</nav>
			</div>
		</div>
		<!--end breadcrumb-->
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
							</tr>
						  <tr>
							<th style="width:100px">Order Id</th>
							<th>Packaging operator name</th>
							<th class="text-center">Total Amount</th>
							<th class="text-center">Order Date</th>
							<th class="text-center">Delivery</th>
							<th>Delivery Type/Slot</th>
							<th>Order Status</th>
							<th class="text-center">Action</th>
						  </tr>
						</thead>
						<tbody>
						<?php
							if($_SESSION['ROLE_ID'] == 1)
							{
								$where = "WHERE poa.status=:status
									  ORDER BY poa.created_at DESC";
								$params = [':status'=> 3];	
							}
							else{
								$where = "WHERE poa.assign_by=:seller_id 
									  AND poa.status=:status
									  ORDER BY poa.created_at DESC";
								$params = [
									':seller_id'=> $_SESSION['USER_ID'],
									':status'=> 3
								];
							}
							
							$fields = "o.id, o.orders_id, o.final_total, o.user_id, o.delivery_time, o.packing_charge, o.created_at, po.name AS packaging_operator_name, osl.status AS orders_status_list_status";

							$tables = PACKAGING_OPERATORS_ASSIGN . " poa
							INNER JOIN " . ORDERS . " o ON o.id = poa.order_id
							LEFT JOIN " . PACKAGING_OPERATORS . " po ON po.id = poa.packaging_operator_id
							INNER JOIN " . ORDERS_STATUS_LISTS . " osl ON osl.id = poa.status";
							
							$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
								
							//echo "<pre>";print_r($sqlQuery);die;
							
							if($sqlQuery[0] != '')
							{
								$i = 1;
								
								foreach($sqlQuery as $k=>$arr)
								{
									$final_total = 0;											
									$deliveryTime = trim($arr->delivery_time);
									if (preg_match('/(\d{1,2}:\d{2}\s?(AM|PM)\s*-\s*\d{1,2}:\d{2}\s?(AM|PM))/i', $deliveryTime, $matches))
									{
										$deliveryType = $matches[1];
									} else {
										$deliveryType = $general_cls_call->time_ago($deliveryTime);
									}
									$final_total = $arr->final_total;
							?>
							  <tr id="dataRow<?php echo($arr->id);?>">
								<td><?PHP echo $arr->orders_id; ?></td>
								<td><?PHP echo !empty($arr->packaging_operator_name) ? $arr->packaging_operator_name : 'N/A'; ?></td>
								<td class="text-center">₹<?PHP echo $final_total; ?></td>
								<td class="text-center"><?PHP echo $general_cls_call->time_ago($arr->created_at); ?></td>
								<td class="text-center">--</td>
								<td><?PHP echo  $deliveryType; ?></td>
								<td><?php echo $arr->orders_status_list_status; ?></td>
								<td class="d-flex align-items-center gap-3">
									<a href="javascript:void(0)" class="text-success font-text2" onclick="orderStatusChange(<?php echo($arr->id);?>)">
										<div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-success bg-opacity-10 text-success">
											<i class="lni lni-checkmark-circle fs-5"></i>
										</div>
									</a>
									<a href="<?php echo SITE_URL.'online-order-details'; ?>?order_id=<?php echo($arr->orders_id);?>">
										<div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-warning bg-opacity-10 text-warning">
											<span class="material-icons-outlined fs-5">visibility</span>
										</div>
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
	<?PHP include_once("includes/adminFooter.php"); ?>
<!-- ######### FOOTER END ############### -->
<script>
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
