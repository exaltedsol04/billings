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
	
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{
		$fromDate = $_POST['fromDate'];
		$toDate = $_POST['toDate'];
		$whereDateRange = "AND pst.created_date >= :fromDate AND pst.created_date < DATE_ADD(:toDate, INTERVAL 1 DAY)";
		
		
		$params = [
			':seller_id'=> $_SESSION['SELLER_ID'],
			':fromDate' => $_POST['fromDate'],
			':toDate'   => $_POST['toDate'],
			':stock_type' => 2
		];
		
	}
	else
	{
		$whereDateRange = 'AND DATE(pst.created_date) = CURDATE()';
		$params = [
			':seller_id'=> $_SESSION['SELLER_ID'],
			':stock_type' => 2
		];
	}
	
	ob_end_flush();
	
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP include_once("includes/sellerMenu.php"); ?>
	<!-- ######### MENU END ############### -->

<main class="main-wrapper">
	<div class="main-content">
			<h6 class="mb-0 text-uppercase">Search panel</h6>
				<hr>
				<div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
					<div class="card-body">
						<form class="row g-4" method="post" action="">
							<div class="col-md-6">
								<label for="input1" class="form-label">From date</label>
								<input type="date" name="fromDate" id="fromDate" class="form-control" placeholder="Start Date">
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">To date</label>
								<input type="date" name="toDate" id="toDate" class="form-control" placeholder="End Date">
							</div>
							
							<div class="col-md-12">
							  <div class="d-md-flex d-grid justify-content-md-between">
								<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
								<button type="submit" class="btn btn-grd btn-grd-success px-4" name="btnUser" value="SAVE">Search</button>
							  </div>
							</div>
						</form>
					</div>
				</div>
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
									
									
									$where = "WHERE  pst.stock_type = :stock_type AND pst.seller_id=:seller_id ". $whereDateRange ." GROUP BY pst.product_variant_id";
											  
									/*$where = "WHERE pst.stock_type = :stock_type 
											  GROUP BY pst.product_variant_id";

									$params = [
										':stock_type' => 2
									];*/

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
								<td><?php echo $general_cls_call->change_date_format($arr->created_date, 'j M Y g:i A') ?></td>
								<td><?PHP echo $arr->type == 'loose' ? $arr->measurement.' ('. $arr->unit_name .')' : $arr->measurement.' ('. $arr->unit_name .')'; ?></td>
								
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
	</div>
</main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->
<script>
document.getElementById("fromDate").addEventListener("change", function () {
    var fromDate = this.value;
    // Set minimum selectable date for To Date
    document.getElementById("toDate").setAttribute("min", fromDate);

    // If already selected toDate is smaller → reset it
    if (document.getElementById("toDate").value < fromDate) {
        document.getElementById("toDate").value = "";
    }
});
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
