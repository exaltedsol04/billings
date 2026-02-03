<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{
		//echo $vendor_id = $_POST['vendor_id'];die;
		$whereSrc = "asp.vendor_id=:vendor_id";
		$paramsSrc = [
			':vendor_id' => $_POST['vendor_id']
		];
		
	}
	else{
		$whereSrc = "1";
		$paramsSrc = [];
	}

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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Vendor List</a>
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
										<label for="input5" class="form-label">Vendor</label>
										<select name="vendor_id" id="vendor_id" class="form-select select2-dropdown" tabindex="1" required>
										<option value="">Select...</option>
										<?php 
											$fields = "*";
											$where = "WHERE 1";
											$params = [];
											$sqlQuery = $general_cls_call->select_query($fields, VENDORS, $where, $params, 2);
											if($sqlQuery[0] != '')
											{
												foreach($sqlQuery as $arr)
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
										<button type="submit" class="btn btn-grd btn-grd-success px-5" name="btnUser" value="SAVE">Search</button>
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
									</tr>
								  <tr class="text-center">
									<th style="width:100px">Sl. No.</th>
									<th>Name</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Created Date</th>
									<th>Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$fieldsVen = "*";
									$whereVen = "WHERE 1";
									$paramsVen = [];
									$sqlQueryVen = $general_cls_call->select_query($fieldsVen, VENDORS, $whereVen, $paramsVen, 2);
									//echo "<pre>";print_r($sqlQueryVen);die;
									if($sqlQueryVen[0] != '')
									{
										foreach($sqlQueryVen as $k=>$selectValue)
										{
											
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>" class="text-center">
									    <td style="width:100px"><?php echo $k+1 ;?></td>
										<td style="width:100px"><?PHP echo $selectValue->name; ?></td>
										<td><?PHP echo $selectValue->email; ?></td>
										<td><?php echo $selectValue->mobile; ?></td>
										
										<td><span class="d-none"><?PHP echo $selectValue->created_at; ?></span><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>
										<td><a href="<?php echo SITE_URL.'vendor-add'; ?>?vendor_id=<?php echo($selectValue->id);?>">
										<div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-success bg-opacity-10 text-success" title = "Edit seller" data-bs-toggle="tooltip">
											<i class="fadeIn animated bx bx-edit-alt"></i>
										</div>
										
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
										<td colspan="10">
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
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
<script>
$(document).ready(function(){
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}
	
	$('#example2').DataTable({
		order: [[4, 'desc']],
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