<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => false,
		'daterangepicker' => true,
		'pageAccessRoleIds' => [3]
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
	
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{
		//echo "<pre>";print_r($_POST);die;
		$fromDate = $_POST['fromDate'];
		$toDate = $_POST['toDate'];
		$whereDateRange = "o.created_at >= :fromDate AND o.created_at < DATE_ADD(:toDate, INTERVAL 1 DAY)";
		
		// total sales 
		$total_orders_sales_where = "WHERE oi.seller_id=:seller_id AND ".$whereDateRange." GROUP BY o.orders_id";
		$total_orders_sales_params = [
			':seller_id'	=> $_SESSION['SELLER_ID'],
			':fromDate' => $_POST['fromDate'],
			':toDate'   => $_POST['toDate']
		];
		
		// total cod 
		$total_orders_cod_where = "WHERE o.payment_method=:payment_method AND oi.seller_id=:seller_id  AND ".$whereDateRange." GROUP BY o.orders_id";
		$total_orders_cod_params = [
			':seller_id'	=> $_SESSION['SELLER_ID'],
			':payment_method'	=> 'COD',
			':fromDate' => $_POST['fromDate'],
			':toDate'   => $_POST['toDate']
		];
		
		
		// total online 
		$total_orders_online_where = "WHERE o.payment_method=:payment_method AND oi.seller_id=:seller_id  AND ".$whereDateRange." GROUP BY o.orders_id";
		$total_orders_online_params = [
			':seller_id'	=> $_SESSION['SELLER_ID'],
			':payment_method'	=> 'Razorpay',
			':fromDate' => $_POST['fromDate'],
			':toDate'   => $_POST['toDate']
		];
		
		// total Wallet 
		$total_orders_wallet_where = "WHERE o.payment_method=:payment_method AND oi.seller_id=:seller_id  AND ".$whereDateRange." GROUP BY o.orders_id";
		$total_orders_wallet_params = [
			':seller_id'	=> $_SESSION['SELLER_ID'],
			':payment_method'	=> 'Wallet',
			':fromDate' => $_POST['fromDate'],
			':toDate'   => $_POST['toDate']
		];
		
	}
	else
	{
		// total sales 
			$total_orders_sales_where = "WHERE oi.seller_id=:seller_id AND DATE(o.created_at) = CURDATE() GROUP BY o.orders_id";
			$total_orders_sales_params = [
				':seller_id'	=> $_SESSION['SELLER_ID']
			];
			
			// total cod 
			$total_orders_cod_where = "WHERE o.payment_method=:payment_method AND oi.seller_id=:seller_id  AND DATE(o.created_at) = CURDATE() GROUP BY o.orders_id";
			$total_orders_cod_params = [
				':seller_id'	=> $_SESSION['SELLER_ID'],
				':payment_method'	=> 'COD'
			];
			
			
			// total online 
			$total_orders_online_where = "WHERE o.payment_method=:payment_method AND oi.seller_id=:seller_id  AND DATE(o.created_at) = CURDATE() GROUP BY o.orders_id";
			$total_orders_online_params = [
				':seller_id'	=> $_SESSION['SELLER_ID'],
				':payment_method'	=> 'Razorpay'
			];
			
			// total Wallet 
			$total_orders_wallet_where = "WHERE o.payment_method=:payment_method AND oi.seller_id=:seller_id  AND DATE(o.created_at) = CURDATE() GROUP BY o.orders_id";
			$total_orders_wallet_params = [
				':seller_id'	=> $_SESSION['SELLER_ID'],
				':payment_method'	=> 'Wallet'
			];
		
	}
	
	$fields_sales = "o.id, o.final_total";
	$tables_sales = ORDERS . " o
	INNER JOIN " . ORDERS_ITEMS . " oi ON oi.orders_id = o.orders_id";
	//total orders
	$totalOrdersArr = $general_cls_call->select_join_query($fields_sales, $tables_sales, $total_orders_sales_where, $total_orders_sales_params, 2);
	//echo count($totalOrdersArr);
	//echo "<pre>";print_r($totalOrdersArr);die;
	$totalsales = 0;
	foreach($totalOrdersArr as $val)
	{
		$totalsales = $totalsales + $val->final_total;
	}
	
	// total cod
	$fields_cod = "o.id, o.final_total";
	$tables_cod = ORDERS . " o
	INNER JOIN " . ORDERS_ITEMS . " oi ON oi.orders_id = o.orders_id";
	//total orders
	$totalCodsArr = $general_cls_call->select_join_query($fields_cod, $tables_cod, $total_orders_cod_where, $total_orders_cod_params, 2);
	//$total_cod = count($totalCodsArr);
	//echo count($totalCodsArr);die;
	//echo "<pre>";print_r($totalCodsArr);die;
	$totalsalescod = 0;
	foreach($totalCodsArr as $val)
	{
		$totalsalescod = $totalsalescod + $val->final_total;
	}	
	
	
	// total online
	$fields_online = "o.id, o.final_total";
	$tables_online = ORDERS . " o
	INNER JOIN " . ORDERS_ITEMS . " oi ON oi.orders_id = o.orders_id";
	//total orders
	$totalonlineArr = $general_cls_call->select_join_query($fields_online, $tables_online, $total_orders_online_where, $total_orders_online_params, 2);
	//$total_wallet = count($totalWalletArr);
	//echo "<pre>";print_r($totalonlineArr);die;
	$totalsalesonline = 0;
	foreach($totalonlineArr as $val)
	{
		$totalsalesonline = $totalsalesonline + $val->final_total;
	}
	
	// total wallet
	$fields_wallet = "o.id, o.total";
	$tables_wallet = ORDERS . " o
	INNER JOIN " . ORDERS_ITEMS . " oi ON oi.orders_id = o.orders_id";
	//total orders
	$totalWalletArr = $general_cls_call->select_join_query($fields_wallet, $tables_wallet, $total_orders_wallet_where, $total_orders_wallet_params, 2);
	//$total_wallet = count($totalWalletArr);
	//echo "<pre>";print_r($totalWalletArr);die;
	$totalsaleswallet = 0;
	foreach($totalWalletArr as $val)
	{
		$totalsaleswallet = $totalsaleswallet + $val->total;
	}
	
	
	
	$received_orders = 0;
	$processed_orders = 0;
	$out_for_delivery_orders = 0;
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
              <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Online sales report</a>
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

		<div class="row row-cols-1 row-cols-xl-6">
			<a href="<?php echo SITE_URL.'online-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-primary bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white">₹ <?= $totalsalescod + $totalsaleswallet + $totalsalesonline; ?></h5>
					  <p class="mb-0">Total sale price</p>
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
					  <h5 class="mb-0 text-white">₹ <?= $totalsalescod ? $totalsalescod : 0; ?></h5>
					  <p class="mb-0">COD</p>
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
					  <h5 class="mb-0 text-white">₹ <?= $totalsalesonline ? $totalsalesonline : 0; ?></h5>
					  <p class="mb-0">Online</p>
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
					  <h5 class="mb-0 text-white">₹ <?= $totalsaleswallet ? $totalsaleswallet : 0; ?></h5>
					  <p class="mb-0">Wallet</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>
			<!--<a href="<?php echo SITE_URL.'online-completed-orders'; ?>">
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
			
			<a href="<?php echo SITE_URL.'online-incomplete-orders'; ?>">
			<div class="col d-flex">
			  <div class="card rounded-4 w-100 bg-grd-royal bg-gradient text-white">
				<div class="card-body">
				  <div class="d-flex align-items-start justify-content-between mb-1">
					<div class="">
					  <h5 class="mb-0 text-white"><?= $incompleted_orders ? $incompleted_orders : 0; ?></h5>
					  <p class="mb-0">Incompleted</p>
					</div>
				  </div>
				</div>
			  </div>
			</div>
			</a>-->
			
       
      </div>
  </main>
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
</script>
</body>

</html>