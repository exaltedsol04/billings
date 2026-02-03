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
	
	/*if(!empty($_GET['vendor_id']) && $_GET['vendor_id'] !='')
	{
		
		$setValues="status=:status";
		$updateExecute=array(
			':status'	=> $_GET['status'],
			':id'	    => $_GET['vendor_id']
		);
		$whereClause=" WHERE id = :id";
		$general_cls_call->update_query(VENDORS, $setValues, $whereClause, $updateExecute);
		
		$sucMsg = "Status Updated Successfully";
	}*/

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
				<span id="updatemsg"></span>
				<?PHP
						if(isset($sucMsg) && $sucMsg != '')
						{
					?>
						<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
							<div class="text-white"><strong>Success</strong> <?PHP echo $sucMsg; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
					?>
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
									<th>Status</th>
									<th>Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$fieldsVen = "*";
									$whereVen = "WHERE status!=:status";
									$paramsVen = [
										':status'=>2
									];
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
										<td>
										<?php 
										if($selectValue->status == 1)
										{
										?>
										<div class="ms-auto">
											<div class="btn-group">
												<p class="dash-lable mb-0 bg-success bg-opacity-10 text-success rounded-2">Active</p>
											</div>
										</div>
										<?php 
										}
										else
										{
										?>
										<div class="ms-auto">
											<div class="btn-group">
												<p class="dash-lable mb-0 bg-danger bg-opacity-10 text-danger rounded-2">Inactive</p>
											</div>
										</div>
										<?php 
										}
										?>
										</td>
										<td>
											<div class="dropdown">
												<button class="btn btn-sm btn-filter dropdown-toggle dropdown-toggle-nocaret"
												  type="button" data-bs-toggle="dropdown">
												  <i class="bi bi-three-dots"></i>
												</button>
												<ul class="dropdown-menu">
												  <li><a href="<?php echo SITE_URL.'vendor-add'; ?>?vendor_id=<?php echo($selectValue->id);?>" class="dropdown-item" title="Click here to edit">Edit</a></li>
												  <li><a href="javascript:void(0);" class="dropdown-item" title="Click here to delete"  onclick="deleteData('<?PHP echo VENDORS; ?>', <?PHP echo $selectValue->id; ?>)">Delete</a></li>
												  <?php 
												  if($selectValue->status == 1)
												  {
												  ?>
												  <li><a href="javascript:vois(0);" class="dropdown-item" title="Click here to inactive"  onclick="status_change('<?PHP echo VENDORS; ?>', <?PHP echo $selectValue->id; ?>)">Inactive</a></li>
												  <?php 
												  }elseif($selectValue->status == 0)
												  {
												  ?><li><a href="javascript:void(0);" class="dropdown-item" title="Click here to active" onclick="status_change('<?PHP echo VENDORS; ?>', <?PHP echo $selectValue->id; ?>)">Active</a></li>
												  <?php 
												  }
												  ?>
												</ul>
											</div>
										</td>
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