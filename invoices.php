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
	
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{
		//echo "<pre>";print_r($_POST);die;
		$fromDate = $_POST['fromDate'];
		$toDate = $_POST['toDate'];
		$whereDateRange = "created_at >= :fromDate AND created_at < DATE_ADD(:toDate, INTERVAL 1 DAY)";
		
		/*$params = [
			':fromDate' => $fromDate,
			':toDate'   => $toDate
		];*/
	}
	else
	{
		$whereDateRange = 'DATE(created_at) = CURDATE()';
		
	}

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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Invoices</a>
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
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by customer"></td>
										<td><input type="text" class="form-control" id="search-two" placeholder="Search by mobile"></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<th style="width:100px">Invoice Id</th>
									<th>Customer Name</th>
									<th class="text-center">Mobile</th>
									<th>Date Time</th>
									<th class="text-center">Total Sale</th>
									<th class="text-center">Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									if($_SESSION['ROLE_ID'] == 1)
									{
										$where = "WHERE ".$whereDateRange." ORDER BY created_at DESC";
										
										if(!empty($fromDate) && !empty($toDate))
										{
											$params = [
												':fromDate' => $fromDate,
												':toDate'   => $toDate
												];
										}
										else{
											$params = [];
										}
									}
									else{
										$where = "WHERE pos_user_id=:pos_user_id AND ".$whereDateRange."  ORDER BY created_at DESC";
										
										if(!empty($fromDate) && !empty($toDate))
										{
											$params = [
												':fromDate' => $fromDate,
												':toDate'   => $toDate,
												':pos_user_id'	=>	$_SESSION['SELLER_ID']
											];
										}
										else{
											$params = [
												':pos_user_id'	=>	$_SESSION['SELLER_ID']
											];
										}
									}
									
									
									$sqlQuery = $general_cls_call->select_query("*", POS_ORDERS, $where, $params, 2);
									//echo "<pre>";print_r($sqlQuery);die;
						
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $selectValue)
										{
											/*$customer = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id=:admin_id", [':admin_id' => $selectValue->pos_user_id], 1);*/
											
											$customer = $general_cls_call->select_query("*", USERS, "WHERE id=:id", [':id' => $selectValue->user_id], 1);
											
											$pos_order_item = $general_cls_call->select_query_sum( POS_ORDERS_ITEMS, "WHERE pos_order_id =:pos_order_id", array(':pos_order_id'=> $selectValue->id), 'total_price');											
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>">
										<td style="width:100px"><?PHP echo $selectValue->id; ?></td>
										<td><?PHP echo $customer->name; ?></td>
										<td class="text-center"><?PHP echo $customer->mobile; ?></td>
										<td><span class="d-none"><?PHP echo $selectValue->created_at; ?></span><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>
										<td class="text-center">₹<?PHP echo $pos_order_item->total; ?></td>
										<td class="text-center"><a href="<?php echo SITE_URL.'invoices-view'; ?>?order_id=<?php echo($selectValue->id);?>"><div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-warning bg-opacity-10 text-warning" title = "View details" data-bs-toggle="tooltip">
											<span class="material-icons-outlined fs-5">visibility</span>
										</div></a></td>
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
		order: [[3, 'desc']],
		columnDefs: [
        {
            targets: 0,        // 1st column
            orderable: true,  // allow manual ordering
            orderSequence: ['asc', 'desc'] // manual toggle only
        }
    ]
	});
});
</script>
</body>
</html>
