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
								<li class="breadcrumb-item active" aria-current="page">Product List</li>
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
										<!--<td></td>-->
										<td><input type="text" class="form-control" id="search-zero" placeholder="Search by barcode"></td>
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by product name"></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<!--<th>Image</th>-->
									<th>Barcode</th>
									<th>Name</th>
									<th>Stock</th>
									<th>Measurement</th>
									<th class="text-center">Print Barcode</th>
								  </tr>
								</thead>
								<tbody>
									<?php 
			
									$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, p.name, p.image, p.barcode";
									$tables = PRODUCT_VARIANTS . " pv
									INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id";
									$where = "WHERE 1 ORDER BY p.name";
									$params = [];
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
									
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $selectValue)
										{	
											/*$imagePath = MAIN_SERVER_PATH . $selectValue->image;
											if (!empty($selectValue->image) && file_exists($imagePath)) {
												$imagePath = MAIN_SERVER_PATH . $selectValue->image;
											} else {
												$imagePath = IMG_PATH . 'noImg.jpg';
											}*/
									?>
											  <tr id="dataRow<?php echo($selectValue->id);?>">
												<!--<td><img src="<?PHP echo $imagePath; ?>" height="50"></td>-->
												<td><?PHP echo $selectValue->barcode; ?></td>
												<td><?PHP echo $selectValue->name; ?></td>
												<td><?PHP echo $selectValue->stock.' '.$selectValue->type; ?></td>
												<td><?PHP echo $selectValue->measurement; ?></td>
												<td class="text-center">
													<a href = "javascript:void(0)" onclick="printBarcode('<?php echo($selectValue->barcode);?>')" title = "Click here to Print Barcode"><i class="material-icons-outlined">printer</i></a>
												</td>
											  </tr>
									<?PHP
											$i++;
										}
									}
									else
									{
								?>
											  <tr>
												<td colspan="5">
												<div class="alert alert-warning text-center" role="alert"><strong>No record found.</strong></div>
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


  <!--plugins-->
	<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/JsBarcode.all.min.js"></script>
		<script type="text/javascript">
		function printBarcode(ID) {
			//alert(ID);
			$('#barcodeModal').modal("show");
			JsBarcode("#barcode", ID, {
				format: "CODE128",
				displayValue: true,
				height: 60,
				fontSize: 14
			});
		};

		</script>


</body>

</html>