<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
	
	ob_end_flush();
	
	$orWhere = '';
	if(isset($_GET['sid'])  && $_GET['sid'] != '')
	{
		$seller_id = $_GET['sid'];
		$orWhere = "AND pr.seller_id ='" .$seller_id. "'";
	}
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
				<div class="row">
					<div class="col-md-5">
						<select name="seller_id" id="seller_id" class="form-select select2-dropdown" tabindex="1" onchange="select_sellers(this.value)">
							<option value="">Select...</option>
							<option value="">All</option>
							<?PHP
								$sqlQuery = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id!=:admin_id", array(':admin_id'=>$_SESSION['USER_ID']), 2);
								if($sqlQuery[0] != '')
								{
									foreach($sqlQuery as $arr)
									{	
							?>
								<option value="<?PHP echo $arr->admin_id ?>"><?PHP echo $arr->name; ?></option>
							<?PHP
									}
								}
							?>
						</select>
						<span class="text-danger" id="err_seller"></span>
					</div>
				</div>
			
				<div class="card mt-4">
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
										
									</tr>
								  <tr class="text-center">
									<!--<th>Image</th>-->
									<th>Barcode</th>
									<th>Name</th>
									<th>Available Stock</th>
									<th>Measurement</th>
									</tr>
								</thead>
								<tbody>
									<?php 
								
									$fields = "pr.id, pr.product_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
						$where = "WHERE pr.status=1 ".$orWhere." GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $arr)
										{	
									?>
											  <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
												<td><?PHP echo $arr->barcode; ?></td>
												<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
												<td><?PHP echo $arr->total_stock ?></td>
												<td><?PHP echo $arr->measurement. ' ' .$arr->stock_unit_name; ?></td>
											</tr>
									<?PHP
											$i++;
										}
									}
									else
									{
								?>
											  <tr>
												<td colspan="4">
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
  <!--<div class="modal fade" id="barcodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>-->
<div id="printBarcodeArea" class="print-barcode-only">
    <svg id="barcode"></svg>
</div>


<!--end main wrapper-->
	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->

</body>

</html>
<script>
function select_sellers(id)
{
	
	if(id != '')
	{
		window.location.href = "<?= SITE_URL ?>products?sid=" + id;
	}
	else{
		window.location.href = "<?= SITE_URL ?>products";
	}
}
</script>