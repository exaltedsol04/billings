<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [6]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	
	// dashboard work
	
	
	// total order
	
	
	$whereAppr = "WHERE vendor_id=:vendor_id AND po_status=:po_status";		
	$paramsAppr = [
		':po_status'=> 2,
		':vendor_id'=> $_SESSION['VENDOR_ID']
	];
	
	$pending_stock = $general_cls_call->select_query_count(ADMIN_STOCK_PURCHASE_LIST, $whereAppr, $paramsAppr);
	
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
			} elseif ($_SESSION['ROLE_ID'] == 6) {
				$menuFile = 'vendorMenu.php';
			}
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

	<div class="row">
        <div class="col-12 col-lg-4 col-xxl-4 d-flex">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="">
                <div class="d-flex align-items-center gap-2 mb-2">
                  <h5 class="mb-0">Pending Request</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo"><?= $pending_stock->total ? $pending_stock->total : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'vendor-pending-stock-list'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
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
                  <h5 class="mb-0">Approved Request</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo"><?php echo $user_purchase_stock ? $user_purchase_stock : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'vendor-approved-stock-list'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
		
		<!--<div class="col-12 col-lg-4 col-xxl-4 d-flex">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="">
                <div class="d-flex align-items-center gap-2 mb-2">
                  <h5 class="mb-0">Assign order</h5>
                </div>
                <p class="mb-4">You are the best seller of this monnth</p>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="">
                    <h3 class="mb-0 text-indigo"><?php echo $count_received ? $count_received : 0; ?></h3>
                    <p class="mb-3"></p>
                    <a href="<?php echo SITE_URL.'purchase-request'; ?>"><button class="btn btn-grd btn-grd-primary rounded-5 border-0 px-4">View Details</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>-->
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