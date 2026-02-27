<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1,3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	//echo $_SESSION['USER_ID'];die;
	
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
		{
			$fromDate = $_POST['fromDate'];
			$toDate = $_POST['toDate'];
			$vendor_id = $_POST['vendor_id'];
			//$whereDateRange = "asp.created_at >= :fromDate AND asp.created_at < DATE_ADD(:toDate, INTERVAL 1 DAY) AND";
			
			$params = [
				':status'=>1,
				':product_stock_transaction_id'=>0
			];
			if (isset($vendor_id) && $vendor_id != '') {
				$whereDateRange .= " asp.vendor_id = :vendor_id AND ";
				$params[':vendor_id']   = $vendor_id;
			} else if (isset($fromDate) && $fromDate != '' && isset($toDate) && $toDate != '') {
				$whereDateRange .= " asp.created_at >= :fromDate AND asp.created_at < DATE_ADD(:toDate, INTERVAL 1 DAY) AND ";
				$params[':fromDate']   	= $fromDate;
				$params[':toDate']   	= $toDate;
			}
		}
		else
		{
			$whereDateRange = 'DATE(asp.created_at) = CURDATE() AND';
			//$whereDateRange = '';
			$params = [
				':status'=>1,
				':product_stock_transaction_id'=>0
			];
		}
	

		$fields = "asp.id, asp.product_id, asp.remarks, asp.status, asp.stock, asp.created_at, asp.purchase_price, asp.loose_stock_quantity, u.name as unit_name, pv.measurement, pv.stock_unit_id, p.name, p.barcode, v.name as vendor, pv.id as pvid, pv.type, asp.po_status";
		$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
		LEFT JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
		$where = "WHERE ".$whereDateRange." asp.status=:status AND asp.product_stock_transaction_id=:product_stock_transaction_id";
		$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
				


	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			include_once("includes/adminMenu.php");
		?>
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Product Wise Purchase Report</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<h6 class="mb-0 text-uppercase">Search panel</h6>
				<hr>
				<div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
					<div class="card-body">
						<form class="row g-4" method="post" action="">
							<div class="col-md-4">
								<label for="input1" class="form-label">From date</label>
								<input type="date" name="fromDate" id="fromDate" class="form-control" placeholder="Start Date">
							</div>
							<div class="col-md-4">
								<label for="input5" class="form-label">To date</label>
								<input type="date" name="toDate" id="toDate" class="form-control" placeholder="End Date">
							</div>
							<div class="col-md-4">
								<label for="input5" class="form-label">Vendor</label>
								<select name="vendor_id" id="vendor_id" class="form-select select2-dropdown" tabindex="1">
								<option value="">Select...</option>
								<?php 
									$fields = "*";
									$where = "WHERE 1";
									$params = [];
									$sqlVen = $general_cls_call->select_query($fields, VENDORS, $where, $params, 2);
									if($sqlVen[0] != '')
									{
										foreach($sqlVen as $arr)
										{
								?>
										<option value="<?php echo $arr->id ?>" <?php echo ($_POST['vendor_id'] == $arr->id) ? 'selected' : '' ?>><?php echo $arr->name ?></option>
								<?php 
										}
									}
								?>
							</select>
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
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by Vendor"></td>
										<td><input type="text" class="form-control" id="search-two" placeholder="Search by name"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<th class="text-center">Sl. No.</th>
									<th>Vendor</th>
									<th>Product Name</th>
									<th class="text-center">Stock</th>
									<th>Measurement</th>
									<th>Type</th>
									<th>Purchase Price</th>
									<th>Purchase Date</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$purchase_price = 0.00;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										
										foreach($sqlQuery as $k=>$arr)
										{
											$purchase_price += $arr->purchase_price;
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
										<td class="text-center"></td>
										<td><?PHP echo $arr->vendor; ?></td>
										<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($arr->name); ?></td>
										<td class="text-center"><?PHP echo $arr->type == 'loose' ? $arr->loose_stock_quantity : $arr->stock ?></td>
										<td class="text-center"><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
										<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type ;?></span></td>
										<td>₹ <?php echo $arr->purchase_price ?></td>
										<td><?PHP echo $general_cls_call->change_date_format($arr->created_at, 'j M Y g:i A'); ?></td>
										
									  </tr>
										<?PHP
												$i++;
											}
										}
									?>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" style="text-align:right"><h5>Purchase Price</h5></td>
										<td colspan="2"><h5>₹ <?PHP echo $purchase_price; ?></h5></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
    </div>
  </main>
  <!--end main wrapper-->
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
</body>
</html>
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
	
	var table = $('#example2').DataTable({
		order: [[7, 'desc']],
		columnDefs: [
			{
				targets: 0,
				orderable: false
			}
		]
	});
	
	table.on('order.dt search.dt', function () {
    table.column(0, { search:'applied', order:'applied' }).nodes()
			.each(function (cell, i) {
				cell.innerHTML = i + 1;
			});
	}).draw();
});
</script>