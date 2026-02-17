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
						<th>POS stock.</th>
						<th>Online stock.</th>
						<th>Measurement</th>
						<th>Type</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						/*$fields = "pr.id, pr.product_id, pr.product_variant_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode, pv.id as pvid, pv.type";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
						$where = "WHERE pr.status=:status AND pr.seller_id =:seller_id GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
						$params = [
							':status'			=> 1,
							':seller_id'		=> $_SESSION['SELLER_ID']
						];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);*/
						$fields = "
							pr.product_id,
							pr.status,
							p.name,
							p.barcode,

							pv.id AS product_variant_id,
							pv.measurement,
							pv.type,

							u.name AS stock_unit_name,

							/* =========================
							   ONLINE TOTAL STOCK
							   ========================= */
							SUM(
								CASE 
									WHEN pv.type = 'loose' THEN pr.loose_stock_quantity
									ELSE pr.stock
								END
							) AS online_total_stock,

							/* USED STOCK FROM ORDERS */
							COALESCE(MAX(oi.used_qty), 0) AS used_stock,

							/* FINAL ONLINE AVAILABLE */
							(
								SUM(
									CASE 
										WHEN pv.type = 'loose' THEN pr.loose_stock_quantity
										ELSE pr.stock
									END
								) - COALESCE(MAX(oi.used_qty), 0)
							) AS available_stock,


							/* =========================
							   POS STOCK (NEW)
							   ========================= */
							COALESCE(MAX(pos.pos_stock),0) AS pos_stock
						";


						$tables = PRODUCT_STOCK_TRANSACTION . " pr

						INNER JOIN " . PRODUCTS . " p
							ON p.id = pr.product_id

						INNER JOIN " . PRODUCT_VARIANTS . " pv
							ON pv.id = pr.product_variant_id

						INNER JOIN " . UNITS . " u
							ON u.id = pv.stock_unit_id


						/* =========================
						   ORDER USED STOCK
						   ========================= */
						LEFT JOIN (
							SELECT 
								pv2.product_id,
								oi.product_variant_id,

								SUM(
									CASE 
										WHEN pv2.type = 'loose' THEN 
											(oi.quantity * pv2.measurement) / child_u.conversion
										ELSE oi.quantity
									END
								) AS used_qty

							FROM " . ORDERS_ITEMS . " oi

							INNER JOIN " . PRODUCT_VARIANTS . " pv2
								ON pv2.id = oi.product_variant_id

							INNER JOIN " . UNITS . " child_u
								ON child_u.id = pv2.stock_unit_id

							WHERE oi.active_status != 7
							AND oi.seller_id = :seller_id

							GROUP BY pv2.product_id, oi.product_variant_id

						) oi ON (
								(pv.type = 'loose' AND oi.product_id = pr.product_id)
							 OR (pv.type != 'loose' AND oi.product_variant_id = pr.product_variant_id)
						)



						/* =========================
						   POS STOCK (NEW BLOCK)
						   ========================= */
						LEFT JOIN (
							SELECT
								pst.product_id,

								/* for normal product */
								pst.product_variant_id,

								SUM(
									CASE 
										WHEN pv3.type = 'loose'
											THEN pst.loose_stock_quantity
										ELSE pst.stock
									END
								) AS pos_stock

							FROM " . PRODUCT_STOCK_TRANSACTION . " pst

							INNER JOIN " . PRODUCT_VARIANTS . " pv3
								ON pv3.id = pst.product_variant_id

							WHERE pst.status = 1
							AND pst.stock_type = 1
							AND pst.seller_id = :seller_id

							/* ⭐ KEY FIX */
							GROUP BY
								pst.product_id,
								CASE 
									WHEN pv3.type = 'loose' THEN pst.product_id
									ELSE pst.product_variant_id
								END

						) pos ON (
								/* loose → match by product */
								(pv.type = 'loose' AND pos.product_id = pr.product_id)

							 OR

								/* normal → match by variant */
								(pv.type != 'loose' AND pos.product_variant_id = pr.product_variant_id)
						)

						";


						$where = "
						WHERE pr.stock_type = 2
						AND pr.status = 1
						AND pr.seller_id = :seller_id

						/* ONLY PARENT UNIT FOR LOOSE */
						AND (
								pv.type != 'loose'
							 OR (pv.type = 'loose' AND COALESCE(u.parent_id,0) = 0)
						)

						GROUP BY pr.product_variant_id

						HAVING (
								(
									SUM(
										CASE 
											WHEN pv.type = 'loose' THEN pr.loose_stock_quantity
											ELSE pr.stock
										END
									) - COALESCE(MAX(oi.used_qty),0)
								) > 0

								OR

								COALESCE(MAX(pos.pos_stock),0) > 0
						)
						";


						$params = [
							':seller_id' => $_SESSION['SELLER_ID']
						];

						$sqlQuery = $general_cls_call->select_join_query(
							$fields,
							$tables,
							$where,
							$params,
							2
						);

						//echo "<pre>";print_r($sqlQuery);die;
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $k=>$arr)
							{	
							
							 // available online stock 
							 /*$wherePos = "WHERE product_id=:product_id AND product_variant_id=:product_variant_id AND  stock_type=:stock_type AND seller_id=:seller_id AND status=:status";
							 
							$paramsPos = [
								':product_id' => $arr->product_id,
								':product_variant_id' => $arr->pvid,
								':stock_type' => 1,
								':seller_id' => $_SESSION['SELLER_ID'],
								':status' => 1
							];
							$pos_stock = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $wherePos, $paramsPos, 'stock');
							
							$whereOnline = "WHERE product_id=:product_id AND product_variant_id=:product_variant_id AND  stock_type=:stock_type AND seller_id=:seller_id AND status=:status";
							 
							$paramsOnline = [
								':product_id' => $arr->product_id,
								':product_variant_id' => $arr->pvid,
								':stock_type' => 2,
								':seller_id' => $_SESSION['SELLER_ID'],
								':status' => 1
							];
							$online_stock = $general_cls_call->select_query_sum( PRODUCT_STOCK_TRANSACTION, $whereOnline, $paramsOnline, 'stock');
							
							$whereOrdItm = "WHERE product_variant_id=:product_variant_id AND active_status!=:active_status AND seller_id=:seller_id";
							$paramsOrdItm = [
								':product_variant_id' => $arr->product_variant_id,
								':seller_id' => $_SESSION['SELLER_ID'],
								'active_status' => 7
							];
							$qty_used = $general_cls_call->select_query_sum( ORDERS_ITEMS, $whereOrdItm, $paramsOrdItm, 'quantity');
							 
							$qty_used = !empty($qty_used->total) ? $qty_used->total : 0;*/
					?>
                     <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $k+1 ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->pos_stock; ?></td>
						<td><?PHP echo $arr->available_stock; ?></td>
						<td><?PHP echo $arr->type == 'loose' ? $arr->stock_unit_name : $arr->measurement. ' ' .$arr->stock_unit_name; ?></td>
						<td><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type; ?></span></td>
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
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->
	
  </body>
</html>
