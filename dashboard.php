<?PHP  error_reporting(0);
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
        <div class="breadcrumb-title pe-3">Dashboard</div>
        <div class="ps-3">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 p-0">
              <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">summary</li>
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
                    <h3 class="mb-0 text-indigo">123</h3>
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
                    <h3 class="mb-0 text-indigo">123</h3>
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
                    <h3 class="mb-0 text-indigo">123</h3>
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
                    <h3 class="mb-0 text-indigo">123</h3>
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
                    <h3 class="mb-0 text-indigo">123</h3>
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