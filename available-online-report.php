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
						$fields = "
							p.id AS product_id,
							p.name,
							p.barcode,

							pv.id AS product_variant_id,
							pv.measurement,
							pv.type,
							u.name AS stock_unit_name,

							/* TOTAL STOCK */
							CASE
								WHEN pv.type = 'loose' THEN COALESCE(ps.total_loose_stock,0)
								ELSE COALESCE(ps.total_variant_stock,0)
							END AS total_stock,

							/* USED STOCK */
							CASE
								WHEN pv.type = 'loose' THEN COALESCE(ou.used_loose_qty,0)
								ELSE COALESCE(ou.used_variant_qty,0)
							END AS used_stock,

							/* AVAILABLE */
							(
								CASE
									WHEN pv.type = 'loose' THEN COALESCE(ps.total_loose_stock,0)
									ELSE COALESCE(ps.total_variant_stock,0)
								END
								-
								CASE
									WHEN pv.type = 'loose' THEN COALESCE(ou.used_loose_qty,0)
									ELSE COALESCE(ou.used_variant_qty,0)
								END
							) AS available_stock
						";



						$tables = PRODUCTS . " p

						INNER JOIN " . PRODUCT_VARIANTS . " pv
							ON pv.product_id = p.id

						INNER JOIN " . UNITS . " u
							ON u.id = pv.stock_unit_id



						/* =========================
						   STOCK TOTAL
						   ========================= */
						LEFT JOIN (
							SELECT
								product_id,
								product_variant_id,
								SUM(stock) AS total_variant_stock,
								SUM(loose_stock_quantity) AS total_loose_stock
							FROM " . PRODUCT_STOCK_TRANSACTION . "
							WHERE status = 1
							AND stock_type = 2
							AND seller_id = " . $_SESSION['SELLER_ID'] . "
							GROUP BY product_id, product_variant_id
						) ps ON (
							(pv.type = 'loose' AND ps.product_id = p.id)
							OR
							(pv.type != 'loose' AND ps.product_variant_id = pv.id)
						)



						/* =========================
						   ORDER USED STOCK
						   ========================= */
						LEFT JOIN (
							SELECT
								pv2.product_id,
								oi.product_variant_id,

								/* LOOSE USED */
								SUM(
									CASE
										WHEN pv2.type = 'loose'
										THEN (oi.quantity * pv2.measurement) / child_u.conversion
										ELSE 0
									END
								) AS used_loose_qty,

								/* NORMAL USED */
								SUM(
									CASE
										WHEN pv2.type != 'loose'
										THEN oi.quantity
										ELSE 0
									END
								) AS used_variant_qty

							FROM " . ORDERS_ITEMS . " oi

							INNER JOIN " . PRODUCT_VARIANTS . " pv2
								ON pv2.id = oi.product_variant_id

							INNER JOIN " . UNITS . " child_u
								ON child_u.id = pv2.stock_unit_id

							WHERE oi.active_status != 7
							AND oi.seller_id = " . $_SESSION['SELLER_ID'] . "

							GROUP BY pv2.product_id, oi.product_variant_id
						) ou ON (
							(pv.type = 'loose' AND ou.product_id = p.id)
							OR
							(pv.type != 'loose' AND ou.product_variant_id = pv.id)
						)
						";
						$where = "
						WHERE p.deleted_at IS NULL
						AND (
								pv.type != 'loose'
							 OR (pv.type = 'loose' AND u.parent_id = 0)
						)
						GROUP BY pv.id
						HAVING available_stock > 0
						";

						$params = [];

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
					?>
                     <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $k+1 ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->available_stock; //$arr->total_stock - $qty_used ?></td>
						<td><?PHP echo $arr->type == 'loose' ? $arr->stock_unit_name : $arr->measurement. ' ' .$arr->stock_unit_name; ?></td>
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
