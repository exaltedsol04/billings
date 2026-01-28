<?PHP 
	//error_reporting(0);
	include_once 'init.php';
	
	$pageAccessRoleIds = [5];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	//ob_start();
	
	//print_r($_SESSION['PACKAGING_OPERATOR_ID']);die;
	
	$dataArray = $general_cls_call->callAPI("POST", SITE_URL."api/online-packaging-operator-orders", ["operator_id"=>$_SESSION['PACKAGING_OPERATOR_ID']], $_SESSION['API_TOKEN']);
	
	//echo "<pre>";print_r($dataArray);die;
	//ob_end_flush();
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
							if(!empty($dataArray['data']))
							{
								$i = 1;
								
								foreach($dataArray['data'] as $k=>$arr)
								{
									$final_total = 0;											
									$deliveryTime = trim($arr['delivery_time']);
									if (preg_match('/(\d{1,2}:\d{2}\s?(AM|PM)\s*-\s*\d{1,2}:\d{2}\s?(AM|PM))/i', $deliveryTime, $matches))
									{
										$deliveryType = $matches[1];
									} else {
										$deliveryType = $general_cls_call->time_ago($deliveryTime);
									}
									$final_total = $arr['final_total'];
							?>
							  <tr id="dataRow<?php echo($arr['id']);?>">
								<td><?PHP echo $arr['id']; ?></td>
								<td><?PHP echo !empty($arr['packaging_operator_name']) ? $arr['packaging_operator_name'] : 'N/A'; ?></td>
								<td class="text-center">₹<?PHP echo $final_total; ?></td>
								<td class="text-center"><?PHP echo $general_cls_call->time_ago($arr['created_at']); ?></td>
								<td class="text-center">--</td>
								<td><?PHP echo  $deliveryType; ?></td>
								<td><?php echo $arr['orders_status_list_status']; ?></td>
								<td class="d-flex align-items-center gap-3">
									<a href="javascript:void(0)" class="text-success font-text2" onclick="orderStatusChange(<?php echo($arr['id']);?>)">
										<div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-success bg-opacity-10 text-success">
											<i class="lni lni-checkmark-circle fs-5"></i>
										</div>
									</a>
									<a href="<?php echo SITE_URL.'online-order-details'; ?>?order_id=<?php echo($arr['orders_id']);?>">
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
				  <option value="">Choose...</option>
				  <?php 
				  foreach($operator_array as $val)
				  {
				  ?>
				  <option value="<?php echo $val['id'] ;?>"><?php echo $val['value'] ;?></option>
				  <?php 
				  }
				  ?>
				  </select>
				</div>
				<div class="col-md-12" id="no_operator"></div>
				<div class="col-md-12">
				  <div class="d-md-flex d-grid justify-content-md-between">
					<input type="hidden" id="order_id" name="order_id">
					
					<button type="reset" class="btn btn-grd btn-grd-info px-4">Reset</button>
					<button type="button" id="orderStatusChangeSave" class="btn btn-grd btn-grd-danger px-4">Packaging Done</button>
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
	$('#orderStatusModal').find('#order_id').val(orderId);
	$('#orderStatusModal').modal('show');
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
      action: 'packaging_operator_order_status',
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
