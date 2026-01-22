<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
	ob_end_flush();
	
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/adminHeader.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/adminMenu.php"); ?>
	<!-- ######### HEADER END ############### -->

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
						</tr>
                      <tr  class="text-center">
						<th>Sl. No.</th>
						<th>Barcode</th>
						<th>Name</th>
						<th>POS stock.</th>
						<th>Online stock.</th>
						<th>Measurement</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode, pv.id as pvid";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
						$where = "WHERE pr.status=1 AND pr.seller_id ='" .$_SESSION['USER_ID']. "' GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						//echo "<pre>";print_r($sqlQuery);die;
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $k=>$arr)
							{	
							
							 // available online stock 
							 $wherePos = "WHERE product_id=:product_id AND product_variant_id=:product_variant_id AND  stock_type=:stock_type";
							 
							$paramsPos = [
								':product_id' => $arr->product_id,
								':product_variant_id' => $arr->pvid,
								':stock_type' => 1
							];
							$pos_stock = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $wherePos, $paramsPos, 'stock');
							
							$whereOnline = "WHERE product_id=:product_id AND product_variant_id=:product_variant_id AND  stock_type=:stock_type";
							 
							$paramsOnline = [
								':product_id' => $arr->product_id,
								':product_variant_id' => $arr->pvid,
								':stock_type' => 2
							];
							$online_stock = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $whereOnline, $paramsOnline, 'stock');
					?>
                     <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $k+1 ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo !empty($pos_stock->total) ? $pos_stock->total : '0'; ?></td>
						<td><?php echo !empty($online_stock->total) ? $online_stock->total : '0'; ?></td>
						<td><?PHP echo $arr->measurement. ' ' .$arr->stock_unit_name; ?></td>
					</tr>
						<?PHP
								$i++;
							}
						}
						else
						{
					?>
                      <tr>
                        <td colspan="6">No record found.
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
      </main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
	
  </body>
</html>
