<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => true,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
		{
			$fromDate = $_POST['fromDate'];
			$toDate = $_POST['toDate'];
			$whereDateRange = "AND pr.created_date >= :fromDate AND pr.created_date < DATE_ADD(:toDate, INTERVAL 1 DAY)";
			
			$params = [
				':seller_id'=> $_SESSION['SELLER_ID'],
				':transaction_type' => 1,
				':fromDate' => $_POST['fromDate'],
				':toDate'   => $_POST['toDate'],
				':status'   => 1
			];
			
		}
		else
		{
			$whereDateRange = 'AND DATE(pr.created_date) = CURDATE()';
			$params = [
				':seller_id'=> $_SESSION['SELLER_ID'],
				':transaction_type' => 1,
				':status'   => 1
			];
		}
	
	
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/sellerMenu.php"); ?>
	<!-- ######### HEADER END ############### -->

<main class="main-wrapper">
	<div class="main-content">
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
						<th>Sl.no.</th>
						<th>Barcode</th>
						<th>Name</th>
						<th>Request Qty.</th>
						<th>Measurement</th>
						<th>Type</th>
						<th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.status, pr.stock as pqty, pv.stock_unit_id, pv.type, pv.stock, pv.measurement, p.name, p.image, p.barcode";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id";
						//$where = "WHERE pr.status=0 AND pr.transaction_type = '1' AND pr.seller_id ='" .$_SESSION['USER_ID']. "' ORDER BY pr.created_date DESC";
						//$where = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type AND pr.seller_id =:seller_id ORDER BY pr.created_date DESC";
						
						/*$params = [
							':status' => 1,
							':transaction_type' => 1,
							':seller_id' => $_SESSION['SELLER_ID']
						];*/
						
						$where = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type AND pr.seller_id =:seller_id " .$whereDateRange;
						
						
						
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);

						//echo "<pre>"; print_r($sqlQuery);die;
						
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $k=>$arr)
							{	
								/*$imagePath = MAIN_SERVER_PATH . $arr->image;
								if (!empty($arr->image) && file_exists($imagePath)) {
									$imagePath = MAIN_SERVER_PATH . $arr->image;
								} else {
									$imagePath = IMG_PATH . 'noImg.jpg';
								}*/
								
								$unitdata = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
					?>
                      <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $k+1 ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->pqty ?></td>
						<td><?PHP echo $arr->measurement . ' ' .$unitdata->name; ?></td>
						<td><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type ?></span></td>
						
						<td>
						<?PHP echo $arr->status == 1 ? '<p class="dash-lable mb-0 bg-success bg-opacity-10 text-success rounded-2">Approved</p>' : '<p class="dash-lable mb-0 bg-warning bg-opacity-10 text-warning rounded-2">Pending</p>' ; ?></td>
                      </tr>
						<?PHP
								$i++;
							}
						}
						else
						{
					?>
                      <tr>
                        <td colspan="6">No record found.</div>
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
</script>
  </body>
</html>
