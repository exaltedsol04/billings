<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [3]
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
		<?PHP include_once("includes/sellerMenu.php"); ?>
	<!-- ######### MENU END ############### -->

<main class="main-wrapper">
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				  <table id="example2" class="table table-striped table-bordered">
                    <thead>
						<tr>
							<td></td>
							<td><input type="text" class="form-control" id="search-one" placeholder="Search by barcode"></td>
							<td><input type="text" class="form-control" id="search-two" placeholder="Search by product name"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                      <tr  class="text-center">
						<th>Sl. No.</th>
						<th>Barcode</th>
						<th>Name</th>
						<th>Stock.</th>
						<th>Treanfer date.</th>
						<th>Measurement</th>
						<th>Type</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "
							pv.id as product_variant_id,
							pv.product_id,
							pv.type,
							pv.stock,
							pv.measurement,
							pv.discounted_price,
							p.name,
							p.image,
							p.barcode,
							u.name as unit_name,
							pst.created_date,

							SUM(
								CASE
									WHEN pv.type = 'loose'
										THEN pst.loose_stock_quantity
									ELSE pst.stock
								END
							) AS total_stock
							";
							
							$tables = PRODUCT_STOCK_TRANSACTION . " pst
							INNER JOIN " . PRODUCT_VARIANTS . " pv ON pv.id = pst.product_variant_id
							INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id
							INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
							
							$where = "WHERE pst.stock_type = :stock_type 
									  GROUP BY pst.product_variant_id";

							$params = [
								':stock_type' => 2
							];

							$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
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
					?>
                     <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $k+1 ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->total_stock; //$arr->total_stock - $qty_used ?></td>
						<td><?PHP echo $arr->type == 'loose' ? $arr->measurement.' ('. $arr->unit_name .')' : $arr->measurement.' ('. $arr->unit_name .')'; ?></td>
						<td><?php echo $general_cls_call->change_date_format($arr->created_date, 'j M Y g:i A') ?></td>
						<td><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type; ?></span></td>
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
      </main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->
<script>
$(document).ready(function(){
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}
	
	$('#example2').DataTable({
		order: [[4, 'asc']],
		columnDefs: [
        {
            targets: 0,        // 1st column
            orderable: true,  // allow manual ordering
            orderSequence: ['asc', 'desc'] // manual toggle only
        }
    ]
	});
	/*startCountdowns();
	$('#example2').on('draw.dt', function () {
		startCountdowns();
	});*/
});
</script>
  </body>
</html>
