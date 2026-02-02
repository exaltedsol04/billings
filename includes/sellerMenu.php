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
              <a href="<?php echo SITE_URL.'dashboard'; ?>">
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

			<li <?php if($page=='pos.php') { echo ('class="mm-active"');} ?>>
				<a href="<?php echo SITE_URL.'pos'; ?>">
					<div class="parent-icon"><i class="material-icons-outlined">shopping_bag</i></div>
					<div class="menu-title">POS Sell</div>
				</a>
			</li>
			<li <?php if($page=='purchase-request.php' || $page=='purchase-report' || $page=='approved-purchase-report') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">inventory_2</i>
				</div>
				<div class="menu-title">PURCHASE</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'purchase-request'; ?>"><i class="material-icons-outlined">arrow_right</i>Purchase Request</a></li>
				<li><a href="<?php echo SITE_URL.'purchase-accept'; ?>"><i class="material-icons-outlined">arrow_right</i>Purchase Inward</a></li>
				<li><a href="<?php echo SITE_URL.'purchase-report'; ?>"><i class="material-icons-outlined">arrow_right</i>Purchase Report</a></li>
				<li><a href="<?php echo SITE_URL.'approved-purchase-report'; ?>"><i class="material-icons-outlined">arrow_right</i>Approved Purchase</a></li>
			  </ul>
			</li>
			<li <?php if($page=='stock-transfer.php' || $page=='available-stock-report.php' || $page=='barcode.php' || $page=='online-stock-transfer.php' || $page=='available-online-report.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">sync_alt</i>
				</div>
				<div class="menu-title">Stock Management</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'online-stock-transfer'; ?>"><i class="material-icons-outlined">arrow_right</i>AsSign Online Stock</a></li>
				<li><a href="<?php echo SITE_URL.'available-online-report'; ?>"><i class="material-icons-outlined">arrow_right</i>Available Online Stock</a></li>
				<li><a href="<?php echo SITE_URL.'available-stock-report'; ?>"><i class="material-icons-outlined">arrow_right</i>Available Stock Report</a></li>
				<li><a href="<?php echo SITE_URL.'stock-transfer'; ?>"><i class="material-icons-outlined">arrow_right</i>Stock Transfer</a></li>
			  </ul>
			</li>
			
			<li <?php if($page=='stock-transfer.php' || $page=='available-stock-report.php' || $page=='barcode.php' || $page=='online-stock-transfer.php' || $page=='available-online-report.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">sync_alt</i>
				</div>
				<div class="menu-title">PRODUCT</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'barcode'; ?>"><i class="material-icons-outlined">arrow_right</i>Product List</a></li>
				<li><a href="<?php echo SITE_URL.'barcode'; ?>"><i class="material-icons-outlined">arrow_right</i>Print Barcode</a></li>
			  </ul>
			</li>
			
			
			<li <?php if($page=='packaging-operator-add.php' || $page=='packaging-operator-list.php' || $page=='packaging-operator-assign.php' || $page=='online-order-packaging-operator-assign.php') { echo ('class="mm-active"');} ?>>
			  <a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class="material-icons-outlined">inventory_2</i>
				</div>
				<div class="menu-title">MANAGE PACKAGING OPERATOR</div>
			  </a>
			  <ul>
				<li><a href="<?php echo SITE_URL.'packaging-operator-add'; ?>"><i class="material-icons-outlined">arrow_right</i>Add</a></li>
				<li><a href="<?php echo SITE_URL.'packaging-operator-list'; ?>"><i class="material-icons-outlined">arrow_right</i>Packaging Operator List</a></li>
			  </ul>
			</li>

			<li <?php if($page=='online-assigned-orders.php' || $page=='online-order-assign.php') { echo ('class="mm-active"');} ?>>
				  <a href="javascript:;" class="has-arrow">
					<div class="parent-icon"><i class="material-icons-outlined">receipt_long</i>
					</div>
					<div class="menu-title">ORDER ASSIGNMENT</div>
				  </a>
				  <ul>
				    <li><a href="<?php echo SITE_URL.'packaging-operator-assign'; ?>"><i class="material-icons-outlined">arrow_right</i>Assign to pack</a></li>
					<li><a href="<?php echo SITE_URL.'online-assigned-orders'; ?>"><i class="material-icons-outlined">arrow_right</i>Assigned order</a></li>
					</li>
				  </ul>
				</li>
				<li <?php if($page=='order-summary.php' || $page=='online-orders.php' || $page=='online-order-details.php' || $page=='online-completed-orders.php' || $page=='online-processing-orders.php') { echo ('class="mm-active"');} ?>>
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