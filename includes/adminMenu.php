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
				<a href="<?php echo SITE_URL.'products'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">apps</i></div>
					<div class="menu-title">Products</div>
				</a>
			</li>
			
			<li <?php if($page=='invoices.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'invoices'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">description</i></div>
					<div class="menu-title">Invoices</div>
				</a>
			</li>	
			<li <?php if($page=='purchases.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'purchases'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">card_giftcard</i></div>
					<div class="menu-title">Purchases</div>
				</a>
			</li>	
			<?php } elseif(isset($_SESSION['ROLE_ID']) && $_SESSION['ROLE_ID']==3) {?>
			<li <?php if($page=='cart.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'cart'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">shopping_bag</i></div>
					<div class="menu-title">Cart</div>
				</a>
			</li>	
			<li <?php if($page=='purchase-request.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'purchase-request'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">inventory_2</i></div>
					<div class="menu-title">Purchase Request</div>
				</a>
			</li>
			<li <?php if($page=='stock-transfer.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'stock-transfer'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">inventory_2</i></div>
					<div class="menu-title">Stock Transfer</div>
				</a>
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