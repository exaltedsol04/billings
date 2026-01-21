<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1];
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
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Purchase Stock</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
     
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example2" class="table table-striped table-bordered">
								<thead>
									<tr>
										<td><input type="text" class="form-control" id="search-zero" placeholder="Search by Invoice Id"></td>
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by name"></td>
										<td></td>
										
										<td></td>
										<td></td>
									</tr>
								  <tr class="text-center">
									<th style="width:100px">Sl. No.</th>
									<th>Vendors</th>
									<th>Product Name</th>
									<th>Variant Name</th>
									<th>Purchase Stock</th>
									<th>Purchase Date</th>
									<th>Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$fields = "asp.stock, asp.created_at, pv.measurement, p.name, p.image, p.barcode, u.name as unit_name, v.name as vendor";
									
									$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
										INNER JOIN " . PRODUCT_VARIANTS . " pv ON pv.id = asp.product_variant_id
										INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
										INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id 
										INNER JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
										
									$where = "WHERE 1";
									$params = [];
									
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$selectValue)
										{
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>" class="text-center">
									    <td style="width:100px"><?php echo $k+1 ;?></td>
										<td style="width:100px"><?PHP echo $selectValue->vendor; ?></td>
										<td><?PHP echo $general_cls_call->cart_product_name($selectValue->name); ?></td>
										<td><?PHP echo $selectValue->measurement.'  '.$selectValue->unit_name; ?></td>
										<td><?PHP echo $selectValue->stock; ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>
										<td><a href="<?php echo SITE_URL.'invoices-view'; ?>?order_id=<?php echo($selectValue->id);?>&mode=1"><i class="lni lni-keyword-research"></i></a></td>
									  </tr>
										<?PHP
												$i++;
											}
										}
										else
										{
									?>
									  <tr>
										<td colspan="7">
										 No record found.
										</td>
									  </tr>
						<?PHP
							}	
						?>
								</tbody>
							</table>
						</div>
					</div>
				</div>

    </div>
  </main>
  <!--end main wrapper-->
  <div class="modal fade" id="barcodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="display:inline-block">Product Barcode</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body text-center">
				<svg id="barcode"></svg>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>
<!--end main wrapper-->
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/adminFooter.php"); ?>
<!-- ######### FOOTER END ############### -->
</body>
</html>