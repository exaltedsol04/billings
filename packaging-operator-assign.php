<?PHP 
	//error_reporting(0);
	include_once 'init.php';
	
	$pageAccessRoleIds = [3];
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
						<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Assign orders</a>
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
								<td><input type="text" class="form-control" id="search-one" placeholder="Search by customer"></td>
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
							<th>Order Status</th>
							<th class="text-center">Action</th>
						  </tr>
						</thead>
						<tbody>
						<?php
							if($_SESSION['ROLE_ID'] == 1)
							{
								$where = "WHERE oi.active_status=:active_status
									  GROUP BY oi.order_id
									  ORDER BY 
										  CASE 
											  WHEN o.order_type = 'slot' THEN o.from_time
											  ELSE o.created_at
										  END DESC";
								$params = [':active_status'=> 2];	
							}
							else{
								$where = "WHERE oi.seller_id=:seller_id 
									  AND oi.active_status=:active_status
									  GROUP BY oi.order_id
									  ORDER BY 
										  CASE 
											  WHEN o.order_type = 'slot' THEN o.from_time
											  ELSE o.created_at
										  END DESC";
								$params = [
									':seller_id'=> $_SESSION['USER_ID'],
									':active_status'=> 2
								];
							}
							
							$fields = "o.id, o.orders_id, o.final_total, o.user_id, o.delivery_time, o.status, o.packing_charge, o.created_at, SUM(oi.sub_total) AS orders_items_sub_total, u.name AS customer_name, osl.status AS orders_status_list_status";

							$tables = ORDERS . " o
							INNER JOIN " . ORDERS_ITEMS . " oi ON oi.order_id = o.id
							LEFT JOIN " . USERS . " u ON u.id = o.user_id
							INNER JOIN " . ORDERS_STATUS_LISTS . " osl ON osl.id = o.active_status";
							
							$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
								
							//echo "<pre>";print_r($sqlQuery);die;
							
							if(!empty($sqlQuery[0]))
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
									$final_total = $arr->orders_items_sub_total;
									if($_SESSION['ROLE_ID'] == 1) {
										$final_total += $arr->packing_charge;
									}
							?>
							  <tr id="dataRow<?php echo($arr->id);?>">
								<td><?PHP echo $arr->orders_id; ?></td>
								<td><?PHP echo !empty($arr->customer_name) ? $arr->customer_name : 'N/A'; ?></td>
								<td class="text-center">₹<?PHP echo $final_total; ?></td>
								<td class="text-center"><?PHP echo $general_cls_call->time_ago($arr->created_at); ?></td>
								<td class="text-center">--</td>
								<td><?PHP echo  $deliveryType; ?></td>
								<td><?php echo $arr->orders_status_list_status; ?></td>
								<td class="d-flex align-items-center gap-3">
									<a href="javascript:void(0)" class="text-success font-text2" onclick="assignOperator(<?php echo($arr->id);?>)">
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
	<div class="modal fade" id="assignModal">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2 bg-grd-info">
			<h5 class="modal-title btn-grd">Assign Packaging Operator</h5>
			<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
			  <i class="material-icons-outlined">close</i>
			</a>
		  </div>
		  <div class="modal-body">
			<div class="form-body">
			  <form name="frm" action="" method="post" class="row g-3">
				<div class="col-md-12">
				  <label for="operator_id" class="form-label">Choose operator</label>
				  <select id="operator_id" class="form-select select2-dropdown mx-auto">
				  </select>
				</div>
				<div class="col-md-12" id="no_operator"></div>
				<div class="col-md-12">
				  <div class="d-md-flex d-grid justify-content-md-between">
					<input type="hidden" id="order_id" name="order_id">
					
					<button type="reset" class="btn btn-grd btn-grd-info px-4">Reset</button>
					<button type="button" id="assignOperatorSave" class="btn btn-grd btn-grd-danger px-4">Assign Operator</button>
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
function assignOperator(orderId)
{
	$('#no_operator').html('');
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {
		  action: 'operatorList',
		  order_id: orderId
		},
		dataType: "json",
		success: function(response){
			var html = '<option value="">Choose...</option>';
			if (response.status == 200) {
				$.each(response.rec, function (i, r) {
					html += '<option value="'+ r.id +'"> '+ r.name +' </option>';
				});
				$('#assignModal').find('#operator_id').html(html);
				$('#assignModal').find('#order_id').val(orderId);
				$('#assignModal').modal('show');
			} else if (response.status == 400) {
				$('#assignModal').find('#operator_id').html(html);
				$('#assignModal').find('#no_operator').html(response.msg);
				$('#assignModal').modal('show');
			} else {
				$('#assignModal').find('#operator_id').html('');
				$('#assignModal').find('#no_operator').html('');
				$('#assignModal').modal('hide');
			}
		}
	});
}
$(document).on('click', '#assignOperatorSave', function (e) {
  e.preventDefault();

  let operator_id = $('#operator_id').val();
  $('#no_operator').html('');
  if(operator_id == '')
  {
	  $('#no_operator').html('<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show"><div class="text-white"><strong>Error!</strong> Please choose operator.</div><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
	  return false;
  }
  // Example data (change to your fields)
  let operatorId = $('#operator_id').val();
  let orderId    = $('#order_id').val();

  $.ajax({
    url: "<?PHP echo SITE_URL; ?>ajax",
    type: 'POST',
    data: {
      action: 'assign_operator_save',
      packaging_operator_id: operatorId,
      order_id: orderId
    },
	dataType: "json",
    beforeSend: function () {
      $('#assignOperatorSave').prop('disabled', true).text('Assigning...');
    },
    success: function (response) {
		//var result = JSON.parse(response);
		if (response.status == 200) {
			console.log(response);
			$('#msg').html(response.msg);
			$('#assignModal').find('#operator_id').html('');
			$('#assignModal').modal('hide');
			window.open(
				"<?= SITE_URL ?>print_packaging_operator_invoice?order_id=" + orderId,
				"_blank"
			);
			
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
      $('#assignOperatorSave').prop('disabled', false).text('Assign Operator');
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
