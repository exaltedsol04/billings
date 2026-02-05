<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	
	// dashboard work
	$admin_product_stock= 0;
	$admin_purchase_stock= 0;
	$admin_total_sell= 0;
	
	$user_available_stock= 0;
	$user_purchase_stock= 0;
	
	// admin ,
	
	$adminstock_products = $general_cls_call->select_query("DISTINCT(product_id)", ADMIN_STOCK_PURCHASE_LIST, "WHERE 1", array(), 2);
	$admin_product_stock = count($adminstock_products);
	
	// purchase stock
	$wherePurchase = "WHERE status=:status AND product_stock_transaction_id=:product_stock_transaction_id";
	$paramsPurchase = [
		':status'=>1,
		':product_stock_transaction_id'=>0
	];
	$admin_parchase_data = $general_cls_call->select_query_sum(ADMIN_STOCK_PURCHASE_LIST, $wherePurchase, $paramsPurchase, 'stock');
	$admin_purchase_stock = $admin_parchase_data->total;
	
	// purchase request from seller 
	
	$fields = "pr.id, pr.product_id, pr.status, pr.stock as pqty, pr.created_date, pv.type, pv.stock, pv.measurement, pv.stock_unit_id, p.name, p.image, p.barcode, a.username";
	$tables = PRODUCT_STOCK_TRANSACTION . " pr
	INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
	INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
	INNER JOIN " . ADMIN_MASTER . " a ON a.id = pr.seller_id";
	$where = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type ORDER BY pr.created_date DESC";
	$params = [
		':status' => 0,
		':transaction_type' => 1							
	];
	$sqlQueryPR = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
	
	$purchase_request_count = count($sqlQueryPR);
	
	// purchase approved 
	
	$fieldsApr = "pr.id, pr.product_id, pr.status, pr.stock as pqty, pr.created_date, pv.type, pv.stock, pv.measurement, pv.stock_unit_id, p.name, p.image, p.barcode, a.username";
	$tablesApr = PRODUCT_STOCK_TRANSACTION . " pr
	INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
	INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
	INNER JOIN " . ADMIN_MASTER . " a ON a.id = pr.seller_id";
	$whereApr = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type ORDER BY pr.created_date DESC";
	$paramsApr = [
		':status' => 1,
		':transaction_type' => 1	
	];
	$sqlQueryApr = $general_cls_call->select_join_query($fieldsApr, $tablesApr, $whereApr, $paramsApr, 2);
	$purchase_approved_count = count($sqlQueryApr);
	
	// total sell
	$whereSell = "WHERE status=:status";
	$paramsSell = [
		':status'	=>	6
	];
	// check from product_stock_transaction 
	$total_sell_data = $general_cls_call->select_query_sum( ORDERS, $whereSell, $paramsSell, 'final_total');
	$admin_total_sell = $total_sell_data->total;
	//echo $admin_total_sell; die;
	
	// users
	$available_stock_data = $general_cls_call->select_query_sum(PRODUCT_STOCK_TRANSACTION, "WHERE  status!=:status AND seller_id=:seller_id", array(':status'=>2, ':seller_id'=> $_SESSION['SELLER_ID']), 'stock');
	
	$user_available_stock = $available_stock_data->total;
	
	$parchase_stock_data = $general_cls_call->select_query_sum(PRODUCT_STOCK_TRANSACTION, "WHERE transaction_type=:transaction_type AND status=:status AND seller_id=:seller_id", array(':transaction_type'=> 1, ':status'=>0, ':seller_id'=> $_SESSION['SELLER_ID']), 'stock');
	
	$user_purchase_stock = $parchase_stock_data->total;
	
	// total order
	
	if($_SESSION['ROLE_ID'] == 1)
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
	ob_end_flush();
?>

 <!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			$menuFile = 'adminMenu.php';
			include_once("includes/" . $menuFile);
		?>
	<!-- ######### MENU END ############### -->


    

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
                    <h3 class="mb-0 text-indigo"><?php echo $purchase_request_count ? $purchase_request_count : 0; ?></h3>
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
                  <h5 class="mb-0">Purchase Request Approved</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo"><?php echo $purchase_approved_count ? $purchase_approved_count : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'purchase-approved-list'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
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
                    <a href="javascript;void(0);"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
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
		
		<div class="col-12 col-lg-4 col-xxl-4 d-flex">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="">
                <div class="d-flex align-items-center gap-2 mb-2">
                  <h5 class="mb-0">Assign order</h5>
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