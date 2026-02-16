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
            <li <?php if($page=='dashboard.php') { echo ('class="mm-active"');} ?>>
              <a href="<?php echo SITE_URL.'admin-dashboard'; ?>">
                <div class="parent-icon"><i class="material-icons-outlined">home</i>
                </div>
                <div class="menu-title">Dashboard</div>
              </a>
            </li>
			<li <?php if($page=='invoices.php' || $page=='invoices-view.php') { echo ('class="mm-active"');} ?>>
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
			
			<li <?php if($page=='vendor-add.php' || $page=='vendor-list.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">storefront</i>
				</div>
				<div class="menu-title">Vendor</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'vendor-add'; ?>"><i class="material-icons-outlined">arrow_right</i>Add</a>
				</li>
				<li><a href="<?php echo SITE_URL.'vendor-list'; ?>"><i class="material-icons-outlined">arrow_right</i>List</a>
				</li>
			  </ul>
			</li>
			
			<li <?php if($page=='purchase-stock-add.php' || $page=='purchase-stock-list.php'  || $page=='purchase-stock-list-view.php' || $page=='approved-stock-list.php' || $page=='purchase-summary-list.php' || $page== 'purchase-stock-multiple-add.php' || $page=='admin-stock-puchase-list.php' || $page=='admin-puchase-order-list.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">card_giftcard</i>
				</div>
				<div class="menu-title">Purchases Stock</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'purchase-stock-add'; ?>"><i class="material-icons-outlined">arrow_right</i>Add</a></li>
				<li><a href="<?php echo SITE_URL.'purchase-stock-multiple-add'; ?>"><i class="material-icons-outlined">arrow_right</i>Add Multiple</a></li>
				<li><a href="<?php echo SITE_URL.'purchase-stock-list'; ?>"><i class="material-icons-outlined">arrow_right</i>List</a></li>
				<li><a href="<?php echo SITE_URL.'admin-pending-stock-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Pending Stock</a></li>
				<li><a href="<?php echo SITE_URL.'admin-approved-stock-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Approved Stock</a></li>
				<!--<li><a href="<?php echo SITE_URL.'admin-rejected-stock-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Rejected Stock</a></li>-->
				<li><a href="<?php echo SITE_URL.'approved-stock-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Approved Stock List</a></li>
				<li><a href="<?php echo SITE_URL.'purchase-summary-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Purchase Summary</a></li>
				<li><a href="<?php echo SITE_URL.'admin-puchase-order-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Purchase Order</a></li>
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
			<li <?php if($page=='seller-list.php' || $page=='seller-edit.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'seller-list'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">inventory</i></div>
					<div class="menu-title">Sellers</div>
				</a>
			</li>
			
			<li <?php if($page=='deliveryboy-list.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'deliveryboy-list'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">inventory</i></div>
					<div class="menu-title">Delivery Boys</div>
				</a>
			</li>
				
				<li <?php if($page=='order-summary.php' || $page=='online-orders.php' || $page=='online-order-details.php' || $page=='online-completed-orders.php' || $page=='online-processing-orders.php' || $page=='online-incomplete-orders.php' || $page=='online-sales-report') { echo ('class="mm-active"');} ?>>
				  <a href="javascript:;" class="has-arrow">
					<div class="parent-icon"><i class="material-icons-outlined">receipt_long</i>
					</div>
					<div class="menu-title">Online order Reports</div>
				  </a>
				  <ul>
					<li><a href="<?php echo SITE_URL.'order-summary'; ?>"><i class="material-icons-outlined">arrow_right</i>Order summary</a>
					</li>
					<li><a href="<?php echo SITE_URL.'online-orders'; ?>"><i class="material-icons-outlined">arrow_right</i>All Orders</a>
					</li>
					<li><a href="<?php echo SITE_URL.'online-processing-orders'; ?>"><i class="material-icons-outlined">arrow_right</i>Processing orders</a></li>
					<li><a href="<?php echo SITE_URL.'online-completed-orders'; ?>"><i class="material-icons-outlined">arrow_right</i>Delivered orders</a>
					</li>
					<li><a href="<?php echo SITE_URL.'online-incomplete-orders'; ?>"><i class="material-icons-outlined">arrow_right</i>Incomplete orders</a>
					</li>
				</ul>
				</li>
			<li <?php if($page=='notification-add.php' || $page=='notification-list.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">apps</i>
				</div>
				<div class="menu-title">Notification</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'notification-add'; ?>"><i class="material-icons-outlined">arrow_right</i>Add</a>
				</li>
				<li><a href="<?php echo SITE_URL.'notification-list'; ?>"><i class="material-icons-outlined">arrow_right</i>List</a>
				</li>
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