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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Instant Purchase List</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example2" class="table table-striped table-bordered">
								<thead>
								  <tr class="text-center">
									<th style="width:100px">Sl. No.</th>
									<th>Purchase Order Id</th>
									<th>Created Date</th>
									<th>Stock Type</th>
									<th>Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$sqlQuery = $general_cls_call->select_query("*", PRODUCT_STOCK_TRANSACTION,
												"WHERE transaction_type = :transaction_type 
												 AND purchase_order_id != '' 
												 GROUP BY purchase_order_id 
												 HAVING SUM(CASE WHEN status = 0 THEN 1 ELSE 0 END) > 0",
												array(':transaction_type' => 7),
												2
											);
									
									// echo "<pre>";print_r($sqlQuery);die;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$arr)
										{
											$checkWhere = "WHERE purchase_order_id = :purchase_order_id";
											$checkParams = [
												':purchase_order_id' => $arr->purchase_order_id							
											];
											$checkQuery = $general_cls_call->select_query('*', ADMIN_STOCK_PURCHASE_LIST, $checkWhere, $checkParams, 1);
											if(empty($checkQuery)){
									?>
									  <tr id="dataRow<?php echo($arr->id);?>" class="text-center">
									    <td style="width:100px"><?php echo $i ;?></td>
										<td><?PHP echo $arr->purchase_order_id; ?></td>
										<td><?php echo $general_cls_call->change_date_format($arr->created_date, 'j M Y g:i A') ?></td>
										<td><?PHP echo $arr->stock_type == 1 ? 'POS' : 'Online'; ?></td>
										<td><a href="<?php echo SITE_URL.'instant-purchase-list-view'; ?>?pid=<?php echo $arr->purchase_order_id;?>"><div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-warning bg-opacity-10 text-warning" title = "View details" data-bs-toggle="tooltip">
											<span class="material-icons-outlined fs-5">visibility</span>
										</div></a></td>
									</tr>
									<?PHP
										$i++;
											}
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
<!--end main wrapper-->
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
</body>
</html>