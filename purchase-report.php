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
							<td></td>
						</tr>
                      <tr  class="text-center">
						<th>Baecode</th>
						<th>Name</th>
						<th>Request Qty.</th>
						<th>Measurement</th>
						<th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.status, pr.stock as pqty, pv.stock_unit_id, pv.type, pv.stock, pv.measurement, p.name, p.image, p.barcode";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id";

						/*$where = "WHERE u.status = :status";
						$params = [
							':status' => 1
						];*/
						$where = "WHERE pr.status=0 AND pr.transaction_type = '1' AND pr.seller_id ='" .$_SESSION['USER_ID']. "' ORDER BY pr.created_date DESC";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);

						//echo "<pre>"; print_r($sqlQuery);die;
						
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $arr)
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
						<td><?PHP echo $arr->barcode; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->pqty ?></td>
						<td><?PHP echo $arr->measurement . ' ' .$unitdata->name; ?></td>
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
                        <td colspan="5">No record found.</div>
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
