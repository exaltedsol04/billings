<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => true,
		'pageAccessRoleIds' => [1,3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	
	ob_start();
	
		if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
		{
			$fromDate = $_POST['fromDate'];
			$toDate = $_POST['toDate'];
			$whereDateRange = "asp.product_stock_transaction_id=:product_stock_transaction_id AND asp.created_at >= :fromDate AND asp.created_at < DATE_ADD(:toDate, INTERVAL 1 DAY)";
			$paramsV = [
				':product_stock_transaction_id' => 0,
				':fromDate' => $_POST['fromDate'],
				':toDate'   => $_POST['toDate']
			];
		}
		else
		{
			$whereDateRange = "asp.product_stock_transaction_id = :product_stock_transaction_id";
			$paramsV = [
				':product_stock_transaction_id' => 0
			];
		}
		
		$fieldsV = "v.id as vendor_id, v.name";

		$tablesV = ADMIN_STOCK_PURCHASE_LIST . " asp
		INNER JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
		$whereV = "WHERE ". $whereDateRange ." GROUP BY asp.vendor_id";

		$sqlQryVendors = $general_cls_call->select_join_query(
			$fieldsV,
			$tablesV,
			$whereV,
			$paramsV,
			2
		);
	//echo "<pre>";print_r($sqlQryVendors);die;
		
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP 
			$menuFile = 'sellerMenu.php';
			if ($_SESSION['ROLE_ID'] == 1) {
				$menuFile = 'adminMenu.php';
			}
			include_once("includes/" . $menuFile);
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i>Purchase Summary</a>
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
									<div class="col-md-6">
										<label for="input1" class="form-label">From date</label>
										<input type="text" name="fromDate" id="fromDate" class="form-control" placeholder="Start Date" readonly>
									</div>
									<div class="col-md-6">
										<label for="input5" class="form-label">To date</label>
										<input type="text" name="toDate" id="toDate" class="form-control" placeholder="End Date" readonly>
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
						<div class="accordion" id="accordionExample">
						<?php 
						foreach($sqlQryVendors as $k => $vendors)
						{
						?>
							<div class="accordion-item">

								<h2 class="accordion-header" id="heading<?= $k ?>">
									<button 
										class="accordion-button <?= $k != 0 ? 'collapsed' : '' ?>" 
										type="button"
										data-bs-toggle="collapse"
										data-bs-target="#collapse<?= $k ?>"
										aria-expanded="<?= $k == 0 ? 'true' : 'false' ?>"
										aria-controls="collapse<?= $k ?>">

										<?= $vendors->name ?>
									</button>
								</h2>

								<div 
									id="collapse<?= $k ?>" 
									class="accordion-collapse collapse <?= $k == 0 ? 'show' : '' ?>" 
									aria-labelledby="heading<?= $k ?>"
									data-bs-parent="#accordionExample">

									<div class="accordion-body">
										<div class="table-responsive">
												<table class="table table-striped table-bordered datatable">
													<thead>
														<tr class="text-center">
															<th style="width:180px">Product name</th>
															<th style="width:20px">Measurement</th>
															<th style="width:10px">Quantity</th>
															<th style="width:20px">Purchase price</th>
															<th style="width:40px">Total price</th>
														</tr>
													</thead>
													<tbody>
													<?php 
													
													$fields = "asp.*, p.name as product_name, p.barcode, u.name as unit_name, pv.measurement, pv.discounted_price";
													$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
													INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
													INNER JOIN " . PRODUCT_VARIANTS . " pv ON pv.id = asp.product_variant_id
													INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
													$where = "WHERE asp.vendor_id=:vendor_id AND asp.product_stock_transaction_id=:product_stock_transaction_id";
													$params = [
														':vendor_id'=> $vendors->vendor_id, 
														':product_stock_transaction_id'=>0
													];
													$sqlDetails = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
													//echo "<pre>";print_r($sqlDetails);
													foreach($sqlDetails as $val)
													{
													?>
														<tr>
															<td><?php echo $val->product_name ?></td>
															<td><?php echo $val->measurement.' '.$val->unit_name ?></td>
															<td><?php echo $val->stock ?></td>
															<td>₹<?php echo $val->purchase_price ?></td>
															<td>₹<?php echo $val->discounted_price ?></td>
														</tr>
													<?php 
													}
													?>
													</tbody>
												</table>
											</div>
									</div>
								</div>

							</div>
						<?php 
						}
						?>
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

<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script>

$(function () {

  let start = moment().startOf('today');
  let end   = moment().endOf('today');

  function setDates(start, end) {
    $('#fromDate').val(start.format('YYYY-MM-DD'));
    $('#toDate').val(end.format('YYYY-MM-DD'));
  }

	// Apply picker on FROM field (controls both)
	$('#fromDate').daterangepicker({
		startDate: start,
		endDate: end,
		autoUpdateInput: false,
		parentEl: 'body',          // ⭐ FIX POSITION
		opens: 'right',            // open next to input
		drops: 'down',             // force downward
		locale: {
			cancelLabel: 'Clear'
		}
	});


  // When range selected
  $('#fromDate').on('apply.daterangepicker', function (ev, picker) {
      setDates(picker.startDate, picker.endDate);
  });

  // Clear
  $('#fromDate').on('cancel.daterangepicker', function () {
      $('#fromDate, #toDate').val('');
  });

  // Set default
  setDates(start, end);
});


$(document).ready(function(){
	
	$('.datatable').each(function(){
        $(this).DataTable({
            pageLength: 50,
            //order: [[3, 'asc']]
        });
    });
});
</script>
</body>
</html>
