<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1,3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	
	ob_start();
	//echo $_SESSION['USER_ID'];die;
	$order_id = '';
	if(isset($_GET['order_id']))
	{
		if($_SESSION['ROLE_ID'] == 1) {
			$where = "WHERE o.id=:id GROUP BY oi.order_id";
			$params = [
				':id' => $_GET['order_id']
			];
		} else {
			//echo $_SESSION['USER_ID']; die;
			$where = "WHERE o.id=:id AND oi.seller_id=:seller_id GROUP BY oi.order_id";
			$params = [
				':id' => $_GET['order_id'],
				':seller_id' => $_SESSION['SELLER_ID']
			];
		}
		
		$fields = "o.id, o.final_total as order_total, o.address, o.mobile, o.packing_charge, o.created_at, o.active_status, o.order_type, o.payment_method, s.name as seller_name, s.store_name, s.email AS seller_email, s.mobile AS seller_mobile, s.street AS seller_address, u.id AS customer_id, u.name AS customer_name, u.email AS customer_email, db.name AS delivery_boy_name, db.mobile AS delivery_boy_mobile, db.address AS delivery_boy_address, osl.status AS orders_status_list_status";
		$tables = ORDERS . " o
		INNER JOIN " . ORDERS_ITEMS . " oi ON oi.order_id = o.id
		INNER JOIN " . SELLERS . " s ON s.id = oi.seller_id
		INNER JOIN " . ORDERS_STATUS_LISTS . " osl ON osl.id = o.active_status
		LEFT JOIN " . USERS . " u ON u.id = o.user_id
		LEFT JOIN " . DELIVERY_BOYS . " db ON db.id = o.delivery_boy_id";
		
		$orderArr = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
		$orderData = $orderArr[0];
		//echo '<pre>'; print_r($orderData); echo '</pre>';die;
		//------------LIST--------------
		if($_SESSION['ROLE_ID'] == 1) {
			$where = "WHERE order_id=:id";
			$params = [
				':id' => $_GET['order_id']
			];
		} else {
			$where = "WHERE order_id=:id AND seller_id=:seller_id";
			$params = [
				':id' => $_GET['order_id'],
				':seller_id' => $_SESSION['SELLER_ID']
			];
		}		
		$sqlQuery = $general_cls_call->select_query("*", ORDERS_ITEMS, $where, $params, 2);
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
					<div class="breadcrumb-title pe-3">Order</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Details</a>
								</li>
							</ol>
						</nav>
					</div>
					<?php if($orderData->active_status == 2) { ?>
					<!--<div class="ms-auto">
						<div class="btn-group">
							<button type="button" class="btn btn-primary">Action</button>
							<button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
							</button>
							<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end">	
								<a class="dropdown-item" href="javascript:;" onclick="assignOperator(<?php echo($orderData->id);?>)">Assign Operator</a>
							</div>
						</div>
					</div>-->
					<?php } ?>
				</div>
				<!--end breadcrumb-->
      
		<div class="row">
			<div class="col-md-12" id="msg"></div>
		</div>
        <div class="card">
          <div class="card-body">
              <div class="d-flex flex-lg-row flex-column align-items-start align-items-lg-center justify-content-between gap-3">
                 <div class="flex-grow-1">
                   <h4 class="fw-bold">Order #<?php echo $orderData->id ? $orderData->id : $orderData->mobile; ?> (<?php echo $orderData->orders_status_list_status ? $orderData->orders_status_list_status : $orderData->orders_status_list_status; ?>)</h4>
                   <p class="mb-0">Customer ID : <a href="javascript:;"><?php echo $orderData->customer_id ? $orderData->customer_id : $orderData->mobile; ?></a></p>
                 </div>
                 <!--<div class="overflow-auto">
                  <div class="btn-group position-static">
                    <div class="btn-group position-static">
                      <button type="button" class="btn btn-outline-primary">
                        <i class="bi bi-printer-fill me-2"></i>Print
                      </button>
                    </div>
                  </div>  
                </div>-->
              </div>
          </div>
        </div>

         <div class="row">
            <div class="col-12 col-lg-8 d-flex">
               <div class="card w-100">
                <div class="card-body">
                  <h5 class="mb-3 fw-bold">Items<span class="fw-light ms-2">(<?php echo count($sqlQuery); ?>)</span></h5>
                  <div class="product-table">
                    <div class="table-responsive white-space-nowrap">
                       <table class="table align-middle">
                  <thead class="table-light">
                    <tr>
                      <th>Sl.No.</th>
                      <th>Product Name</th>
                      <th>Measurement</th>
                      <th>Quantity</th>
                      <th>Price</th>
                      <th>Total</th>
                    </tr>
                   </thead>
                   <tbody>
						<?php 
							if($sqlQuery[0] != '')
							{
								$subtotal = 0;
								foreach($sqlQuery as $k=>$arr)
								{
							?>
                       <tr>
								  <td><?php echo $k+1; ?></td>
								  <td><?php echo $general_cls_call->cart_product_name($arr->product_name);  ?></td>
								  <td class="text-center"><?php echo $arr->variant_name; ?></td>
								  <td class="text-center"><?php echo $arr->quantity; ?></td>
								  <td class="text-center">₹<?php echo $arr->discounted_price; ?></td>
								  <td class="text-center">₹<?php echo $arr->quantity * $arr->discounted_price ?></td>
								 
								  
							   </tr>
							<?php 
							      $subtotal = $subtotal + $arr->quantity * $arr->discounted_price;
								}
							}
							?>
                     
                   </tbody>
                 </table>
                    </div>
                  </div>
                  <div class="d-flex align-items-center justify-content-between">
                    <p class="mb-0 fw-bold">Items subtotal :</p>
                    <p class="mb-0 fw-bold">₹<?php echo number_format($subtotal) ?></p>
                  </div>
                </div>
               </div>
            </div>
            <div class="col-12 col-lg-4 d-flex">
              <div class="w-100">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title mb-4 fw-bold">Summary</h4>
                  <div>
                    <div class="d-flex justify-content-between">
                      <p class="fw-semi-bold">Items subtotal :</p>
                      <p class="fw-semi-bold">₹<?php echo number_format($subtotal) ?></p>
                    </div>
                    <div class="d-flex justify-content-between">
                      <p class="fw-semi-bold">Packing charge :</p>
                      <p class="text-success fw-semi-bold">₹<?php echo $orderData->packing_charge ? $orderData->packing_charge : 0; ?></p>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between border-top pt-4">
                    <h5 class="fw-bold">Total :</h5>
                    <h5 class="fw-bold">₹<?php echo number_format($orderData->packing_charge + $subtotal) ?></h5>
                  </div>
				  <div class="d-flex justify-content-between border-top pt-4">
                    <h5 class="fw-semi-bold">Payment Method :</h5>
                    <h5 class="fw-semi-bold"><?php echo $orderData->payment_method; ?></h5>
                  </div>
				   <?php if($orderData->active_status == 2) { ?>
					<div class="col-12 mt-4">
						<a href="javascript:;" onclick="assignOperator(<?php echo($orderData->id);?>)">
							<div class="d-grid">
								<button type="button" class="btn btn-primary">Assign Operator</button>
							</div>
						</a>
					</div>
					<?php 
					}
				  ?>
                </div>
				 
              </div>
			 
            </div>
			</div>
         </div><!--end row-->


         <h5 class="fw-bold mb-4">Billing Details</h5>
         <div class="card">
            <div class="card-body">
              <div class="row g-3 row-cols-1 row-cols-lg-3">
                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="detail-info">
                       <p class="fw-bold mb-1">Customer Name</p>
                       <a href="javascript:;" class="mb-0"><?php echo $orderData->customer_name ? $orderData->customer_name : 'NA'; ?></a>
                    </div>
                 </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-envelope-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Email</h6>
                      <a href="javascript:;" class="mb-0"><?php echo $orderData->customer_email ? $orderData->customer_email : 'NA'; ?></a>
                    </div>
                  </div>
                </div>

                <!--<div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-telephone-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Phone</h6>
                      <a href="javascript:;" class="mb-0"><?php echo $orderData->mobile ? $orderData->mobile : 'NA'; ?></a>
                    </div>
                  </div>
                </div>-->

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-calendar-check-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Order Date</h6>
                      <p class="mb-0"><?PHP echo $general_cls_call->change_date_format($orderData->created_at, 'j M Y g:i A'); ?></p>
                    </div>
                  </div>
                </div>
            </div>
			<div class="row g-3 row-cols-1 mt-1">
                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-house-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Shipping Address</h6>
                      <p  class="mb-0"><?php echo $orderData->address ? $orderData->address : 'NA'; ?></p>
                    </div>
                  </div>
                </div>
              </div><!--end row-->
            </div>
         </div>
		 
		 <h5 class="fw-bold mb-4">Seller Details</h5>
         <div class="card">
            <div class="card-body">
              <div class="row g-3 row-cols-1 row-cols-lg-4">
                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="detail-info">
                       <p class="fw-bold mb-1">Name</p>
                       <a href="javascript:;" class="mb-0"><?php echo $orderData->seller_name ? $orderData->seller_name : 'NA'; ?></a>
                    </div>
                 </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-envelope-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Email</h6>
                      <a href="javascript:;" class="mb-0"><?php echo $orderData->seller_email ? $orderData->seller_email : 'NA'; ?></a>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-telephone-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Phone</h6>
                      <a href="javascript:;" class="mb-0"><?php echo $orderData->seller_mobile ? $orderData->seller_mobile : 'NA'; ?></a>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-house-door-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Address</h6>
                      <p  class="mb-0"><?php echo $orderData->seller_address ? $orderData->seller_address : 'NA'; ?></p>
                    </div>
                  </div>
                </div>
              </div><!--end row-->
            </div>
         </div>
		 <h5 class="fw-bold mb-4">Delivery Boy Details</h5>
         <div class="card">
            <div class="card-body">
              <div class="row g-3 row-cols-1 row-cols-lg-3">
                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="detail-info">
                       <p class="fw-bold mb-1">Name</p>
                       <a href="javascript:;" class="mb-0"><?php echo $orderData->delivery_boy_name ? $orderData->delivery_boy_name : 'NA'; ?></a>
                    </div>
                 </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-telephone-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Phone</h6>
                      <a href="javascript:;" class="mb-0"><?php echo $orderData->delivery_boy_mobile ? $orderData->delivery_boy_mobile : 'NA'; ?></a>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-house-door-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Address</h6>
                      <p  class="mb-0"><?php echo $orderData->delivery_boy_address ? $orderData->delivery_boy_address : 'NA'; ?></p>
                    </div>
                  </div>
                </div>
              </div><!--end row-->
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
<!-- Modal -->
	<div class="modal fade" id="assignModal">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2 bg-grd-success">
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
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="packed_status">
						<label class="form-check-label" for="packed_status">
						  Packed status
						</label>
					</div>
				</div>
				<div class="col-md-12">
				  <div class="d-md-flex d-grid justify-content-md-between">
					<input type="hidden" id="order_id" name="order_id">
					
					<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
					<button type="button" id="assignOperatorSave" class="btn btn-grd btn-grd-success px-4">Assign Operator</button>
				  </div>
				</div>
			  </form>
			</div>
		  </div>
		</div>
	  </div>
	</div>
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/footer.php"); ?>
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
  let packed_status    = $('#packed_status').prop('checked');
  $.ajax({
    url: "<?PHP echo SITE_URL; ?>ajax",
    type: 'POST',
    data: {
      action: 'assign_operator_save',
      packaging_operator_id: operatorId,
      order_id: orderId,
      packed_status: packed_status
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
			
			//if(packed_status == false)
			//{
				window.open(
					"<?= SITE_URL ?>print_packaging_operator_invoice?order_id=" + orderId,
					"_blank"
				);
			//}
			
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
</script>
</body>
</html>