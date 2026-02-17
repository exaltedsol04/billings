<!--start sidebar-->
    <aside class="sidebar-wrapper" data-simplebar="true">
      <div class="sidebar-header">
        <div class="logo-icon">
          <img src="assets/images/logo-icon.png" class="logo-img" alt="">
        </div>
        <div class="logo-name flex-grow-1">
          <h5 class="mb-0"><?php echo SITE_TITLE; ?></h5>
        </div>
        <div class="sidebar-close">
          <span class="material-icons-outlined">close</span>
        </div>
      </div>
      <div class="sidebar-nav">
          <!--navigation-->
          <ul class="metismenu" id="sidenav">
            <li <?php if($page=='vendor-dashboard.php') { echo ('class="mm-active"');} ?>>
              <a href="<?php echo SITE_URL.'vendor-dashboard'; ?>">
                <div class="parent-icon"><i class="material-icons-outlined">home</i>
                </div>
                <div class="menu-title">Dashboard</div>
              </a>
            </li>
			
			<li <?php if($page=='vendor-pending-stock-list.php' || $page=='vendor-approved-stock-list.php' || $page=='vendor-rejected-stock-list') { echo ('class="mm-active"');} ?>>
				  <a href="javascript:;" class="has-arrow">
					<div class="parent-icon"><i class="material-icons-outlined">card_giftcard</i>
					</div>
					<div class="menu-title">Purchase stock</div>
				  </a>
				  <ul>
					<li><a href="<?php echo SITE_URL.'vendor-pending-stock-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Pending stock</a></li>
					<li><a href="<?php echo SITE_URL.'vendor-approved-stock-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Approved stock</a></li>
					<li><a href="<?php echo SITE_URL.'vendor-rejected-stock-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Rejected stock</a></li>
				  </ul>
				</li>
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