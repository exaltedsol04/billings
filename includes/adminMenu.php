<!--start sidebar-->
    <aside class="sidebar-wrapper" data-simplebar="true">
      <div class="sidebar-header">
        <div class="logo-icon">
          <img src="assets/images/logo-icon.png" class="logo-img" alt="">
        </div>
        <div class="logo-name flex-grow-1">
          <h5 class="mb-0">Maxton</h5>
        </div>
        <div class="sidebar-close">
          <span class="material-icons-outlined">close</span>
        </div>
      </div>
      <div class="sidebar-nav">
          <!--navigation-->
          <ul class="metismenu" id="sidenav">
            <li <?php if($page=='dashboard.php') { echo ('class="mm-active"');} ?>>
              <a href="<?php echo SITE_URL.'dashboard'; ?>">
                <div class="parent-icon"><i class="material-icons-outlined">home</i>
                </div>
                <div class="menu-title">Dashboard</div>
              </a>
            </li>
			<?php if(isset($_SESSION['ROLE_ID']) && $_SESSION['ROLE_ID']==1) {?>
			<li <?php if($page=='products.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">apps</i>
				</div>
				<div class="menu-title">Products</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'products'; ?>"><i class="material-icons-outlined">arrow_right</i>Product List</a>
				</li>
			  </ul>
			</li>
			<li <?php if($page=='sellers.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">apps</i>
				</div>
				<div class="menu-title">sellers</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'sellers'; ?>"><i class="material-icons-outlined">arrow_right</i>Sellers List</a>
				</li>
			  </ul>
			</li>
			<li <?php if($page=='invoices.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">description</i>
				</div>
				<div class="menu-title">Billing</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'invoices'; ?>"><i class="material-icons-outlined">arrow_right</i>Invoices</a>
				</li>
			  </ul>
			</li>
			<li <?php if($page=='purchase-request-list.php' || $page=='purchase-approved-list' || $page=='purchase-rejected-list') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">card_giftcard</i>
				</div>
				<div class="menu-title">Purchases</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'purchase-request-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Request List</a></li>
				<li><a href="<?php echo SITE_URL.'purchase-approved-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Approved List</a></li>
				<li><a href="<?php echo SITE_URL.'purchase-rejected-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Rejected List</a></li>
			  </ul>
			</li>

			<?php } elseif(isset($_SESSION['ROLE_ID']) && $_SESSION['ROLE_ID']==3) {?>
			<li <?php if($page=='pos.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'pos'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">shopping_bag</i></div>
					<div class="menu-title">POS</div>
				</a>
			</li>
			<li <?php if($page=='purchase-request.php' || $page=='purchase-report') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">inventory_2</i>
				</div>
				<div class="menu-title">Purchases</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'purchase-request'; ?>"><i class="material-icons-outlined">arrow_right</i>Request</a></li>
				<li><a href="<?php echo SITE_URL.'purchase-report'; ?>"><i class="material-icons-outlined">arrow_right</i>Purchase Report</a></li>
			  </ul>
			</li>
			<li <?php if($page=='stock-transfer.php' || $page=='available-stock-report.php' || $page=='barcode.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">sync_alt</i>
				</div>
				<div class="menu-title">Stock Management</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'stock-transfer'; ?>"><i class="material-icons-outlined">arrow_right</i>Available Stock</a></li>
				<li><a href="<?php echo SITE_URL.'available-stock-report'; ?>"><i class="material-icons-outlined">arrow_right</i>Available Stock Report</a></li>
				<li><a href="<?php echo SITE_URL.'barcode'; ?>"><i class="material-icons-outlined">arrow_right</i>Barcode</a></li>
			  </ul>
			</li>
			<?php } ?>
			<li>
				<a href="<?php echo SITE_URL.'logout'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">power_settings_new</i></div>
					<div class="menu-title">Logout</div>
				</a>
			</li>
		
           </ul>
          <!--end navigation-->
      </div>
    </aside>
  <!--end sidebar-->