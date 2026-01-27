<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1,3,5];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
	ob_end_flush();
	
	// dashboard work
	$admin_product_stock= 0;
	$admin_purchase_stock= 0;
	$admin_total_sell= 0;
	
	$user_available_stock= 0;
	$user_purchase_stock= 0;
	
	// admin 
	$admin_product_data = $general_cls_call->select_query_sum(PRODUCTS, "WHERE 1", array(), 'id');
	$admin_product_stock = $admin_product_data->total;
	
	$admin_parchase_data = $general_cls_call->select_query_sum(PRODUCT_STOCK_TRANSACTION, "WHERE status!=:status", array('status'=>2), 'stock');
	$admin_purchase_stock = $admin_parchase_data->total;
	
	$admin_total_sell_data = $general_cls_call->select_query_sum(POS_ORDERS, "WHERE 1", array(), 'total_amount');
	$admin_total_sell = $admin_total_sell_data->total;
	//echo $admin_total_sell; die;
	
	// users
	$available_stock_data = $general_cls_call->select_query_sum(PRODUCT_STOCK_TRANSACTION, "WHERE  status!=:status AND seller_id=:seller_id", array('status'=>2, 'seller_id'=> $_SESSION['USER_ID']), 'stock');
	
	$user_available_stock = $available_stock_data->total;
	
	$parchase_stock_data = $general_cls_call->select_query_sum(PRODUCT_STOCK_TRANSACTION, "WHERE transaction_type=:transaction_type AND status=:status AND seller_id=:seller_id", array('transaction_type'=> 1, 'status'=>0, 'seller_id'=> $_SESSION['USER_ID']), 'stock');
	
	$user_purchase_stock = $parchase_stock_data->total;
	
	// total order
	
	if($_SESSION['USER_ID'] == 1)
	{
		$wheretotOrder = "WHERE 1";
		$paramstotStatus = [];
		
	}
	else{
		$wheretotOrder = "WHERE seller_id=:seller_id  GROUP BY orders_id";		
		$paramstotStatus = [
			':seller_id'=> 14
		];
	}
	$total_orders = $general_cls_call->select_query_count(ORDERS_ITEMS, $wheretotOrder, $paramstotStatus);
	
	//echo $user_purchase_stock; die;
	//echo $total_orders;die;
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
        <div class="breadcrumb-title pe-3">Dashboard</div>
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

	<?php if($_SESSION['ROLE_ID'] == 1) { ?>
      <div class="row">
        <div class="col-12 col-lg-4 col-xxl-4 d-flex">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="">
                <div class="d-flex align-items-center gap-2 mb-2">
                  <h5 class="mb-0">Products</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo"><?= $admin_product_stock ? $admin_product_stock : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'products'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-4 col-xxl-4 d-flex">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="">
                <div class="d-flex align-items-center gap-2 mb-2">
                  <h5 class="mb-0">Purchase Request</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo"><?php echo $admin_purchase_stock ? $admin_purchase_stock : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'purchase-request-list'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-4 col-xxl-4 d-flex">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="">
                <div class="d-flex align-items-center gap-2 mb-2">
                  <h5 class="mb-0">Total Sale</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo">₹<?= $admin_total_sell ? $admin_total_sell : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'invoices'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } if($_SESSION['ROLE_ID'] == 3) { ?>
        <div class="row">
        <div class="col-12 col-lg-4 col-xxl-4 d-flex">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="">
                <div class="d-flex align-items-center gap-2 mb-2">
                  <h5 class="mb-0">Available Stock</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo"><?= $user_available_stock ? $user_available_stock : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'stock-transfer'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-4 col-xxl-4 d-flex">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="">
                <div class="d-flex align-items-center gap-2 mb-2">
                  <h5 class="mb-0">Purchase Request</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo"><?php echo $user_purchase_stock ? $user_purchase_stock : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'purchase-request'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
		<?php } ?>

      </div><!--end row-->
    </div>
  </main>
  <!--end main wrapper-->


	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
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