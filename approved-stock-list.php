<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	

	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP include_once("includes/adminMenu.php"); ?>
	<!-- ######### MENU END ############### -->


  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Approved Stock List</a>
								</li>
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
										<td></td>
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by Product"></td>
										<td><input type="text" class="form-control" id="search-two" placeholder="Search by Measurement"></td>
										<td></td>
										<td></td>
									</tr>
								  <tr >
									<th style="width:100px">Sl. No.</th>
									<th>Product Name</th>
									<th class="text-center">Approved Stock</th>
									<th class="text-center">Measurement</th>
									<th class="text-center">Type</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$fields = "asp.id,
									asp.product_id,
									asp.product_variant_id,
									asp.status,
									SUM(
										CASE 
											WHEN pv.type = 'loose' 
												THEN asp.loose_stock_quantity
											ELSE asp.stock
										END
									) as total_stock,
									asp.created_at,
									u.name as unit_name,
									pv.measurement,
									pv.stock_unit_id,
									p.name,
									p.barcode,
									pv.type";
									
									$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
									INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
									INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
									INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
									
									$whereSrc = "asp.status=:status";
									$paramsSrc = [
										':status' => 1
									];
									
									$where = "WHERE ". $whereSrc ." GROUP BY asp.product_variant_id HAVING total_stock > 0 ORDER BY asp.created_at DESC";
									
									
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $paramsSrc, 2);
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$arr)
										{
											$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
											$unitname = $unit_dtls->name;
											if($arr->type == 'loose')
											{
												$measurement_arr = [
													'quantity' => 1 * $arr->measurement,
													'stock_unit_id' => $arr->stock_unit_id,
												];
												$measurement_units = $general_cls_call->convert_measurement($measurement_arr);			
												$unitname = $measurement_units['unit'];
											}
											
											$barcode = $arr->barcode;
								            $barcode = !empty($barcode) ? '(' . $barcode . ') ': '';
											
											
									?>
									  <tr id="dataRow<?php echo($arr->id);?>">
									    <td class="text-center" style="width:100px"><?php echo $k+1 ;?></td>
										<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($arr->name); ?></td>
										<td class="text-center"><?php echo $arr->total_stock; ?></td>
										<td class="text-center"><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
										<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type ;?></span></td>
									</tr>
										<?PHP
												$i++;
											}
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
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
<script>

</script>
</body>
</html>