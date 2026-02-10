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
						<th>Available stock.</th>
						<th>Measurement</th>
						<th>Type</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode ,pv.id as product_variant_id, pv.type";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
						$where = "WHERE pr.stock_type=:stock_type AND pr.status=:status AND pr.seller_id =:seller_id GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
						$params = [
							':stock_type' 		=> 2,
							':status'			=> 1,
							':seller_id'		=> $_SESSION['SELLER_ID']
						];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						//echo "<pre>";print_r($sqlQuery);die;
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $k=>$arr)
							{	
							  $whereOrdItm = "WHERE product_variant_id=:product_variant_id AND active_status!=:active_status AND seller_id=:seller_id";
							  $paramsOrdItm = [
									':product_variant_id' => $arr->product_variant_id,
									':seller_id' => $_SESSION['SELLER_ID'],
									'active_status' => 7
								];
							  
							  $qty_used = $general_cls_call->select_query_sum( ORDERS_ITEMS, $whereOrdItm, $paramsOrdItm, 'quantity');
							 
							  $qty_used = !empty($qty_used->total) ? $qty_used->total : 0;
					?>
                     <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $k+1 ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->total_stock - $qty_used ?></td>
						<td><?PHP echo $arr->measurement. ' ' .$arr->stock_unit_name; ?></td>
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
	
  </body>
</html>
