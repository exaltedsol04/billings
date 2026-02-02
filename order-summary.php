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
	
	// dashboard work
	$total_orders				= 0;
	$received_orders			= 0;
	$processed_orders			= 0;
	$out_for_delivery_orders	= 0;
	$delivered_orders			= 0;
	$delivered_orders			= 0;
	$cancelled_orders			= 0;
	$returned_orders			= 0;
	
	if($_SESSION['ROLE_ID'] == 1) {
		//total orders
		$total_orders_where = "WHERE 1 GROUP BY o.orders_id";
		$total_orders_params = [];
		//received orders
		$received_orders_where = "WHERE oi.active_status = :active_status GROUP BY o.orders_id";
		$received_orders_params = [
			':active_status'	=> 2
		];
		//processed orders
		$processed_orders_where = "WHERE oi.active_status = :active_status GROUP BY o.orders_id";
		$processed_orders_params = [
			':active_status'	=> 3
		];	
		//out for delivery orders
		$out_for_delivery_orders_where = "WHERE oi.active_status = :active_status GROUP BY o.orders_id";
		$out_for_delivery_orders_params = [
			':active_status'	=> 5
		];	
		//delivered orders
		$delivered_orders_where = "WHERE oi.active_status = :active_status GROUP BY o.orders_id";
		$delivered_orders_params = [
			':active_status'	=> 6
		];	
		//cancelled orders
		$cancelled_orders_where = "WHERE oi.active_status = :active_status GROUP BY o.orders_id";
		$cancelled_orders_params = [
			':active_status'	=> 7
		];	
		//returned orders
		$returned_orders_where = "WHERE oi.active_status = :active_status GROUP BY o.orders_id";
		$returned_orders_params = [
			':active_status'	=> 8
		];		
	} else{
		//total orders
		$total_orders_where = "WHERE oi.seller_id=:seller_id GROUP BY o.orders_id";
		$total_orders_params = [
			':seller_id'	=> $_SESSION['SELLER_ID']
		];
		//received orders
		$received_orders_where = "WHERE oi.active_status = :active_status AND oi.seller_id=:seller_id GROUP BY o.orders_id";
		$received_orders_params = [
			':active_status'	=> 2,
			':seller_id'		=> $_SESSION['SELLER_ID']
		];	
		//received orders
		$processed_orders_where = "WHERE oi.active_status = :active_status AND oi.seller_id=:seller_id GROUP BY o.orders_id";
		$processed_orders_params = [
			':active_status'	=> 3,
			':seller_id'		=> $_SESSION['SELLER_ID']
		];
		//out for delivery orders
		$out_for_delivery_orders_where = "WHERE oi.active_status = :active_status AND oi.seller_id=:seller_id GROUP BY o.orders_id";
		$out_for_delivery_orders_params = [
			':active_status'	=> 5,
			':seller_id'		=> $_SESSION['SELLER_ID']
		];
		//delivered orders
		$delivered_orders_where = "WHERE oi.active_status = :active_status AND oi.seller_id=:seller_id GROUP BY o.orders_id";
		$delivered_orders_params = [
			':active_status'	=> 6,
			':seller_id'		=> $_SESSION['SELLER_ID']
		];
		//cancelled orders
		$cancelled_orders_where = "WHERE oi.active_status = :active_status AND oi.seller_id=:seller_id GROUP BY o.orders_id";
		$cancelled_orders_params = [
			':active_status'	=> 7,
			':seller_id'		=> $_SESSION['SELLER_ID']
		];
		//returned orders
		$returned_orders_where = "WHERE oi.active_status = :active_status AND oi.seller_id=:seller_id GROUP BY o.orders_id";
		$returned_orders_params = [
			':active_status'	=> 8,
			':seller_id'		=> $_SESSION['SELLER_ID']
		];
	}
	$fields = "o.id";
	$tables = ORDERS . " o
	INNER JOIN " . ORDERS_ITEMS . " oi ON oi.orders_id = o.orders_id";
	//total orders
	$totalOrdersArr = $general_cls_call->select_join_query($fields, $tables, $total_orders_where, $total_orders_params, 2);
	$total_orders = count($totalOrdersArr);
	//received orders
	$receivedOrdersArr = $general_cls_call->select_join_query($fields, $tables, $received_orders_where, $received_orders_params, 2);
	$received_orders = count($receivedOrdersArr);
	//processed orders
	$processedOrdersArr = $general_cls_call->select_join_query($fields, $tables, $processed_orders_where, $processed_orders_params, 2);
	$processed_orders = count($processedOrdersArr);
	//out for delivery orders
	$outForDeliveryOrdersArr = $general_cls_call->select_join_query($fields, $tables, $out_for_delivery_orders_where, $out_for_delivery_orders_params, 2);
	$out_for_delivery_orders = count($outForDeliveryOrdersArr);
	//delivered orders
	$deliveredOrdersArr = $general_cls_call->select_join_query($fields, $tables, $delivered_orders_where, $delivered_orders_params, 2);
	$delivered_orders = count($deliveredOrdersArr);
	//cancelled orders
	$cancelledOrdersArr = $general_cls_call->select_join_query($fields, $tables, $cancelled_orders_where, $cancelled_orders_params, 2);
	$cancelled_orders = count($cancelledOrdersArr);
	//returned orders
	$returnedOrdersArr = $general_cls_call->select_join_query($fields, $tables, $returned_orders_where, $returned_orders_params, 2);
	$returned_orders = count($returnedOrdersArr);
	

	ob_end_flush();
	//echo $total_orders;die;
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
        <div class="breadcrumb-title pe-3">Orders</div>
        <div class="ps-3">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 p-0">
              <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Summary</a>
              </li>
            </ol>
          </nav>
        </div>
      </div>
      <!--end breadcrumb-->

		<div class="row row-cols-1 row-cols-xl-6">
			<a href="<?php echo SITE_URL.'online-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-primary bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white"><?= $total_orders ? $total_orders : 0; ?></h5>
					  <p class="mb-0">Total orders</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>
			<a href="<?php echo SITE_URL.'online-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-info bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white"><?= $received_orders ? $received_orders : 0; ?></h5>
					  <p class="mb-0">Received orders</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>
			<a href="<?php echo SITE_URL.'online-processing-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-branding bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white"><?= $processed_orders ? $processed_orders : 0; ?></h5>
					  <p class="mb-0">Processed orders</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>
			<a href="<?php echo SITE_URL.'online-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-deep-blue bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white"><?= $out_for_delivery_orders ? $out_for_delivery_orders : 0; ?></h5>
					  <p class="mb-0">Out For Delivery</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>
			<a href="<?php echo SITE_URL.'online-completed-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-success bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white"><?= $delivered_orders ? $delivered_orders : 0; ?></h5>
					  <p class="mb-0">Delivered orders</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>
			<a href="<?php echo SITE_URL.'online-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-danger bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white"><?= $cancelled_orders ? $cancelled_orders : 0; ?></h5>
					  <p class="mb-0">Cancelled orders</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>
			<a href="<?php echo SITE_URL.'online-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-warning bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white"><?= $returned_orders ? $returned_orders : 0; ?></h5>
					  <p class="mb-0">Returned orders</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>
			
       
      </div>
  </main>
  <!--end main wrapper-->


	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->


  <!--plugins-->
  <script src="assets/plugins/apexchart/apexcharts.min.js"></script>
  <script src="assets/plugins/peity/jquery.peity.min.js"></script>
  <script>
    $(".data-attributes span").peity("donut")
  </script>
  <script src="assets/js/dashboard2.js"></script>

</body>

</html>