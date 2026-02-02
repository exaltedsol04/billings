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
	$order_id = '';
	if(isset($_GET['order_id']))
	{
		$order_id = $_GET['order_id'];
		
		$fields = "po.pos_user_id, poi.quantity, poi.unit_price, poi.total_price, pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, pv.stock_unit_id ,p.name, p.image, p.barcode, u.name as unit_name";
		
		$tables = POS_ORDERS_ITEMS . " poi INNER JOIN " . PRODUCT_VARIANTS . " pv ON poi.product_variant_id = pv.id
		INNER JOIN " . POS_ORDERS . " po ON po.id = poi.pos_order_id
		INNER JOIN " . PRODUCTS . " p ON p.id = poi.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
		";
		
		if($_SESSION['ROLE_ID'] == 1)
		{
			$where = "WHERE poi.pos_order_id=:pos_order_id ORDER BY poi.id";
				$params = [
				':pos_order_id'	=>	$order_id
			];
		}
		else{
			$where = "WHERE po.pos_user_id=:pos_user_id AND poi.pos_order_id=:pos_order_id ORDER BY poi.id";
				$params = [
				':pos_order_id'	=>	$order_id,
				':pos_user_id'	=>	$_SESSION['SELLER_ID']
			];
		}
		
		
		$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
				
		//echo "<pre>";print_r($sqlQuery);die;
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
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Invoices View</a>
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
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by product"></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<th>S. No.</th>
									<th>Product Name</th>
									<th class="text-center">Quantity</th>
									<th class="text-center">Measurement</th>
									<th class="text-center">Unit Price</th>
									<th class="text-center">Total Price</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $k=>$selectValue)
										{
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>">
										<td style="width:100px"><?PHP echo $k+1; ?></td>
										<td><?PHP echo $general_cls_call->cart_product_name($selectValue->name); ?></td>
										<td class="text-center"><?PHP echo $selectValue->quantity; ?></td>
										<td class="text-center"><?PHP echo $selectValue->measurement.'  '.$selectValue->unit_name; ?></td>
										<td class="text-center">₹<?PHP echo $selectValue->unit_price; ?></td>
										<td class="text-center">₹<?PHP echo $selectValue->total_price; ?></td>
										
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
</body>
</html>