<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1,3,5];
	
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
			$where = "WHERE id=:id";
			$params = [
				':id' => $_GET['order_id']
			];
		}
		else{
			//echo $_SESSION['USER_ID']; die;
			$where = "WHERE id=:id AND seller_id=:seller_id";
			$params = [
				':id' => $_GET['order_id'],
				':seller_id' => $_SESSION['SELLER_ID']
			];
		}
		//$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
		
		$sqlQuery = $general_cls_call->select_query("*", ORDERS_ITEMS, $where, $params, 2);
		
		$whereOrder ="WHERE id=:id";
		$paramsOrder = [
				':id' => $_GET['order_id']
			];
		$sqlOrder = $general_cls_call->select_query("id", ORDERS, $whereOrder, $paramsOrder, 1);
				
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
		
		$packing = $general_cls_call->select_query("packing_charge", ORDERS, "WHERE id=:id", [':id' => $_GET['order_id']], 1);
		
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
					<div class="breadcrumb-title pe-3">Components</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Order Details</a>
								</li>
							</ol>
						</nav>
					</div>
					<div class="ms-auto">
						<div class="btn-group">
							<button type="button" class="btn btn-primary">Settings</button>
							<button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
							</button>
							<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end">	<a class="dropdown-item" href="javascript:;">Action</a>
								<a class="dropdown-item" href="javascript:;">Another action</a>
								<a class="dropdown-item" href="javascript:;">Something else here</a>
								<div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Separated link</a>
							</div>
						</div>
					</div>
				</div>
				<!--end breadcrumb-->
      

        <div class="card">
          <div class="card-body">
              <div class="d-flex flex-lg-row flex-column align-items-start align-items-lg-center justify-content-between gap-3">
                 <div class="flex-grow-1">
                   <h4 class="fw-bold">Order #<?php echo $sqlOrder->id ;?></h4>
                   <p class="mb-0">Customer ID : <a href="javascript:;">6589743</a></p>
                 </div>
                 <div class="overflow-auto">
                  <div class="btn-group position-static">
                    <div class="btn-group position-static">
                      <button type="button" class="btn btn-outline-primary">
                        <i class="bi bi-printer-fill me-2"></i>Print
                      </button>
                    </div>
                    <div class="btn-group position-static">
                      <button type="button" class="btn btn-outline-primary">
                        <i class="bi bi-arrow-clockwise me-2"></i>Refund
                      </button>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="javascript:;">Action</a></li>
                        <li><a class="dropdown-item" href="javascript:;">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="javascript:;">Something else here</a></li>
                      </ul>
                    </div>
                    <div class="btn-group position-static">
                      <button type="button" class="btn btn-outline-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        More Actions
                      </button>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="javascript:;">Action</a></li>
                        <li><a class="dropdown-item" href="javascript:;">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="javascript:;">Something else here</a></li>
                      </ul>
                    </div>
                  </div>  
                </div>
              </div>
          </div>
        </div>

         <div class="row">
            <div class="col-12 col-lg-8 d-flex">
               <div class="card w-100">
                <div class="card-body">
                  <h5 class="mb-3 fw-bold">Wishlist<span class="fw-light ms-2">(46)</span></h5>
                  <div class="product-table">
                    <div class="table-responsive white-space-nowrap">
                       <table class="table align-middle">
                  <thead class="table-light">
                    <tr>
                      <th>Sl.No.</th>
                      <th>Product Name</th>
                      <th>Variant name</th>
                      <th>Quantity</th>
                      <th>Discount price</th>
                      <th>Price</th>
                      <th>Total</th>
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
								 
								  
							   </tr>
							<?php 
							      $subtotal = $subtotal + $selectValue->quantity * $selectValue->discounted_price;
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
                      <p class="text-success fw-semi-bold">₹<?php echo !empty($packing->packing_charge) ? $packing->packing_charge : 0 ?></p>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between border-top pt-4">
                    <h5 class="mb-0 fw-bold">Total :</h5>
                    <h5 class="mb-0 fw-bold">₹<?php echo number_format($packing->packing_charge + $subtotal) ?></h5>
                  </div>
                </div>
              </div>
              
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title mb-4 fw-bold">Order Status</h4>
                  <label class="form-label">Payment status</label>
                  <select class="form-select mb-4">
                    <option value="cod">Processing</option>
                    <option value="card">Done</option>
                    <option value="paypal">Pending</option>
                  </select>
                  <label class="form-label">Completed status</label>
                  <select class="form-select">
                    <option value="cod">Complete</option>
                    <option value="card">Done</option>
                    <option value="paypal">Pending</option>
                  </select>
                </div>
              </div>
            </div>
           </div>
         </div><!--end row-->


         <h5 class="fw-bold mb-4">Billing Details</h5>
         <div class="card">
            <div class="card-body">
              <div class="row g-3 row-cols-1 row-cols-lg-4">
                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="detail-info">
                       <p class="fw-bold mb-1">Customer Name</p>
                       <a href="javascript:;" class="mb-0">Jhon Maxwell</a>
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
                      <a href="javascript:;" class="mb-0">abcexample.com</a>
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
                      <a href="javascript:;" class="mb-0">+01-585XXXXXXX</a>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-calendar-check-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Shipping Date</h6>
                      <p class="mb-0">15 Dec, 2022</p>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-gift-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Gift Order</h6>
                      <p  class="mb-0">Gift voucher has available</p>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-house-door-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Address 1</h6>
                      <p  class="mb-0">123 Street Name, City, Australia</p>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-house-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Shipping Address</h6>
                      <p  class="mb-0">198 Street Name, City, Inited States of America</p>
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
                       <a href="javascript:;" class="mb-0"><?php echo $sqlSellerQuery->seller_name ?></a>
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
                      <a href="javascript:;" class="mb-0">abcexample.com</a>
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
                      <a href="javascript:;" class="mb-0">+01-585XXXXXXX</a>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-calendar-check-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Shipping Date</h6>
                      <p class="mb-0">15 Dec, 2022</p>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-gift-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Gift Order</h6>
                      <p  class="mb-0">Gift voucher has available</p>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-house-door-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Address 1</h6>
                      <p  class="mb-0"><?php echo $sqlSellerQuery->seller_street ?>, <?php echo $sqlSellerQuery->city_name .' ('. $sqlSellerQuery->state.')' ?></p>
                    </div>
                  </div>
                </div>

                <div class="col">
                  <div class="d-flex align-items-start gap-3 border p-3 rounded">
                    <div class="detail-icon fs-5">
                      <i class="bi bi-house-fill"></i>
                    </div>
                    <div class="detail-info">
                      <h6 class="fw-bold mb-1">Shipping Address</h6>
                      <p  class="mb-0">198 Street Name, City, Inited States of America</p>
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
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/adminFooter.php"); ?>
<!-- ######### FOOTER END ############### -->
</body>
</html>