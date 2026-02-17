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
							pv.stock_unit_id,
							pv.id AS product_variant_id,
							pv.measurement,
							pv.type,
							u.name AS stock_unit_name,

							/* TOTAL STOCK (ONLINE) */
							COALESCE(ps.total_stock,0) AS total_stock,

							/* USED STOCK */
							COALESCE(ou.used_qty,0) AS used_stock,

							/* AVAILABLE */
							(
								COALESCE(ps.total_stock,0)
								-
								COALESCE(ou.used_qty,0)
							) AS available_stock
						";

						$tables = PRODUCTS . " p

						/* ================= VARIANT SELECTION ================= */
						/* loose -> pick only one variant per product */
						INNER JOIN (
							SELECT pv1.*
							FROM " . PRODUCT_VARIANTS . " pv1
							LEFT JOIN " . PRODUCT_VARIANTS . " pv2
								ON pv1.product_id = pv2.product_id
								AND pv1.type='loose'
								AND pv2.type='loose'
								AND pv2.id < pv1.id
							WHERE pv2.id IS NULL
							   OR pv1.type!='loose'
						) pv ON pv.product_id = p.id

						INNER JOIN " . UNITS . " u
							ON u.id = pv.stock_unit_id


						/* =========================
						   ONLINE STOCK TOTAL
						   ========================= */
						LEFT JOIN (
							SELECT
								CASE WHEN pv2.type='loose' THEN pst.product_id ELSE NULL END AS loose_product_id,
								CASE WHEN pv2.type!='loose' THEN pst.product_variant_id ELSE NULL END AS normal_variant_id,

								SUM(
									CASE
										WHEN pv2.type='loose'
											THEN pst.loose_stock_quantity
										ELSE pst.stock
									END
								) AS total_stock
							FROM " . PRODUCT_STOCK_TRANSACTION . " pst
							INNER JOIN " . PRODUCT_VARIANTS . " pv2
								ON pv2.id = pst.product_variant_id
							WHERE pst.status = 1
							AND pst.stock_type = 2
							AND pst.seller_id = " . $_SESSION['SELLER_ID'] . "
							GROUP BY loose_product_id, normal_variant_id
						) ps ON (
								(pv.type='loose' AND ps.loose_product_id = p.id)
							 OR (pv.type!='loose' AND ps.normal_variant_id = pv.id)
						)


						/* =========================
						   ORDER USED STOCK
						   ========================= */
						LEFT JOIN (
							SELECT
								CASE WHEN pv3.type='loose' THEN pv3.product_id ELSE NULL END AS loose_product_id,
								CASE WHEN pv3.type!='loose' THEN oi.product_variant_id ELSE NULL END AS normal_variant_id,

								SUM(
									CASE
										WHEN pv3.type='loose'
											THEN (oi.quantity * pv3.measurement)/u2.conversion
										ELSE oi.quantity
									END
								) AS used_qty
							FROM " . ORDERS_ITEMS . " oi
							INNER JOIN " . PRODUCT_VARIANTS . " pv3
								ON pv3.id = oi.product_variant_id
							INNER JOIN " . UNITS . " u2
								ON u2.id = pv3.stock_unit_id
							WHERE oi.active_status != 7
							AND oi.seller_id = " . $_SESSION['SELLER_ID'] . "
							GROUP BY loose_product_id, normal_variant_id
						) ou ON (
								(pv.type='loose' AND ou.loose_product_id = p.id)
							 OR (pv.type!='loose' AND ou.normal_variant_id = pv.id)
						)
						";

												$where = "
						WHERE p.deleted_at IS NULL
						AND (
							COALESCE(ps.total_stock,0) - COALESCE(ou.used_qty,0)
						) > 0
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
								$unit_dtls = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
								$unitname = $unit_dtls->name;
								if($arr->type == 'loose')
								{
									$measurement_arr = [
										'quantity' => 1 * $arr->measurement,
										'stock_unit_id' => $arr->stock_unit_id,
									];
									$measurement_units = $general_cls_call->convert_measurement($measurement_arr);			
									$unitname = $measurement_units['unit'];
								}
					?>
                     <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $k+1 ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->available_stock; //$arr->total_stock - $qty_used ?></td>
						<td><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
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
