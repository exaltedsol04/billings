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
							<td><input type="text" class="form-control" id="search-zero" placeholder="Search by barcode"></td>
							<td><input type="text" class="form-control" id="search-one" placeholder="Search by product name"></td>
							<td></td>
							<td></td>
						</tr>
                      <tr  class="text-center">
						<th>Baecode</th>
						<th>Name</th>
						<th>Available stock.</th>
						<th>Measurement</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
						$where = "WHERE pr.status=1 AND pr.seller_id ='" .$_SESSION['USER_ID']. "' GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $arr)
							{	
					?>
                     <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $arr->barcode; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->total_stock ?></td>
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
                        <td colspan="4">No record found.</div>
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
