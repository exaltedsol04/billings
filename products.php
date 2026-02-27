<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	
	$orWhere = '';
	if(isset($_GET['sid'])  && $_GET['sid'] != 'admin')
	{
		$seller_id = $_GET['sid'];
		/*$orWhere = "AND pr.seller_id =:seller_id";
		
		$fields = "pr.id, pr.product_id, pr.status, SUM(pr.stock) as total_stock, u.name as stock_unit_name, pv.measurement, p.name, p.barcode, u.name as unit_name";
		$tables = PRODUCT_STOCK_TRANSACTION . " pr
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
		$where = "WHERE pr.status=:status ".$orWhere." GROUP BY pr.product_variant_id HAVING SUM(pr.stock) > 0";
		$params = [
			':status'			=> 1,
			':seller_id'		=> $seller_id
		];
		$sqlQueryP = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);*/
		
		$fields = "
				p.id AS product_id,
				p.name,
				p.barcode,
				pv.stock_unit_id,
				pv.id AS product_variant_id,
				pv.measurement,
				pv.type,

				u.name AS stock_unit_name,

				/* ONLINE STOCK */
				COALESCE(online.online_stock,0) AS online_total_stock,

				/* USED */
				COALESCE(oi.used_qty,0) AS used_stock,

				/* FINAL ONLINE */
				(COALESCE(online.online_stock,0) - COALESCE(oi.used_qty,0))
					AS available_stock,

				/* POS STOCK */
				COALESCE(pos.pos_stock,0) AS pos_stock
			";


			$tables = PRODUCTS . " p

			/* ================= VARIANT SELECTION ================= */
			/* loose -> pick only ONE variant per product */
			INNER JOIN (
				SELECT
					pv1.*
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


			/* ================= ONLINE STOCK ================= */
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
					) AS online_stock
				FROM " . PRODUCT_STOCK_TRANSACTION . " pst
				INNER JOIN " . PRODUCT_VARIANTS . " pv2
					ON pv2.id = pst.product_variant_id
				WHERE pst.status=1
				AND pst.stock_type=2
				AND pst.seller_id=:seller_id
				GROUP BY loose_product_id, normal_variant_id
			) online ON (
					(pv.type='loose' AND online.loose_product_id = p.id)
				 OR (pv.type!='loose' AND online.normal_variant_id = pv.id)
			)


			/* ================= ORDER USED ================= */
			LEFT JOIN (
				SELECT
					CASE WHEN pv2.type='loose' THEN pv2.product_id ELSE NULL END AS loose_product_id,
					CASE WHEN pv2.type!='loose' THEN oi.product_variant_id ELSE NULL END AS normal_variant_id,
					SUM(
						CASE
							WHEN pv2.type='loose'
								THEN (oi.quantity * pv2.measurement)/u2.conversion
							ELSE oi.quantity
						END
					) AS used_qty
				FROM " . ORDERS_ITEMS . " oi
				INNER JOIN " . PRODUCT_VARIANTS . " pv2
					ON pv2.id = oi.product_variant_id
				INNER JOIN " . UNITS . " u2
					ON u2.id = pv2.stock_unit_id
				WHERE oi.active_status!=7
				AND oi.seller_id=:seller_id
				GROUP BY loose_product_id, normal_variant_id
			) oi ON (
					(pv.type='loose' AND oi.loose_product_id = p.id)
				 OR (pv.type!='loose' AND oi.normal_variant_id = pv.id)
			)


			/* ================= POS STOCK ================= */
			LEFT JOIN (
				SELECT
					CASE WHEN pv3.type='loose' THEN pst.product_id ELSE NULL END AS loose_product_id,
					CASE WHEN pv3.type!='loose' THEN pst.product_variant_id ELSE NULL END AS normal_variant_id,
					SUM(
						CASE
							WHEN pv3.type='loose'
								THEN pst.loose_stock_quantity
							ELSE pst.stock
						END
					) AS pos_stock
				FROM " . PRODUCT_STOCK_TRANSACTION . " pst
				INNER JOIN " . PRODUCT_VARIANTS . " pv3
					ON pv3.id = pst.product_variant_id
				WHERE pst.status=1
				AND pst.stock_type=1
				AND pst.seller_id=:seller_id
				GROUP BY loose_product_id, normal_variant_id
			) pos ON (
					(pv.type='loose' AND pos.loose_product_id = p.id)
				 OR (pv.type!='loose' AND pos.normal_variant_id = pv.id)
			)
			";

			$where = "
			WHERE
			(
				(COALESCE(online.online_stock,0) - COALESCE(oi.used_qty,0)) > 0
				OR COALESCE(pos.pos_stock,0) > 0
			)
			";

			$params = [
				':seller_id'=> $_GET['sid']
			];

			$sqlQueryP = $general_cls_call->select_join_query(
				$fields,
				$tables,
				$where,
				$params,
				2
			);
		//echo "<pre>";print_r($sqlQueryP);die;
	}
	else if(isset($_GET['sid'])  && $_GET['sid'] == 'admin')
	{
		/*$fields = "pv.id as pvid, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, p.name, p.image, p.barcode, u.name as unit_name";
		$tables = PRODUCT_VARIANTS . " pv
		INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id 
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
		$where = "WHERE 1 GROUP BY pv.id ORDER BY p.name";
		$params = [];
		$sqlQueryP = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);*/
		
		$fields = "asp.id, asp.product_id, asp.product_variant_id, asp.status, SUM(asp.stock) as total_stock, asp.created_at, u.name as stock_unit_name, pv.measurement, p.name, p.barcode, v.name as vendor, pv.type";
									
		$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
		INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
		INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
		INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
		LEFT JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
		$where = "WHERE 1 GROUP BY
		CASE 
			WHEN pv.type = 'loose' 
				THEN asp.product_id
			ELSE asp.product_variant_id
		END
		ORDER BY asp.created_at DESC";
		
		
		$sqlQueryP = $general_cls_call->select_join_query($fields, $tables, $where, $paramsSrc, 2);
		//echo "<pre>";print_r($sqlQueryP);die;
	}
	//echo "<pre>";print_r($sqlQueryP);die;
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
     
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/adminMenu.php"); ?>
	<!-- ######### HEADER END ############### -->


  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Products List</a>
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<div class="row">
					<div class="col-md-5">
						<select name="seller_id" id="seller_id" class="form-select select2-dropdown" tabindex="1" onchange="select_sellers(this.value)">
							<option value="">Select...</option>
							<option value="admin">Admin</option>
							<?PHP
								$sqlQuery = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id!=:admin_id", array(':admin_id'=>$_SESSION['USER_ID']), 2);
								if($sqlQuery[0] != '')
								{
									foreach($sqlQuery as $arr)
									{	
							?>
								<option value="<?PHP echo $arr->id ?>"><?PHP echo $arr->name; ?></option>
							<?PHP
									}
								}
							?>
						</select>
						<span class="text-danger" id="err_seller"></span>
					</div>
				</div>
			
				<div class="card mt-4">
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
								  <tr class="text-center">
									<!--<th>Image</th>-->
									<th>Sl. No.</th>
									<th>Barcode</th>
									<th>Name</th>
									<th>Available Stock</th>
									<th>Unit</th>
									<th>Measurement</th>
									</tr>
								</thead>
								<tbody>
									<?php 
								
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQueryP[0] != '')
									{
										$i = 1;
										$total_stock = 0;
										foreach($sqlQueryP as $k=>$arr)
										{	
										  
										  if(isset($_GET['sid'])  && $_GET['sid'] != 'admin')
										  {
											  $available_stock = round($arr->pos_stock,2).' (pos) / '.round($arr->available_stock,2).' (online)';
											  
										  }
										  else{
												$available_stock = $ruf->admin_credit_stock(['product_id'=>$arr->product_id, 'product_variant_id'=> $arr->product_variant_id]) - $ruf->admin_debit_stock(['product_id'=>$arr->product_id, 'product_variant_id'=> $arr->product_variant_id]);
										  }
									?>
											  <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
												<td><?PHP echo $k+1; ?></td>
												<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
												<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
												<!--<td><?PHP echo $total_stock ?></td>-->
												<td><?PHP echo $available_stock; ?></td>
												<td><span class="badge bg-grd-primary dash-lable"><?php echo $arr->type ;?></span></td>
												<td><?PHP echo $arr->measurement. ' ' .$arr->stock_unit_name; ?></td>
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
  <!--<div class="modal fade" id="barcodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>-->
<div id="printBarcodeArea" class="print-barcode-only">
    <svg id="barcode"></svg>
</div>


<!--end main wrapper-->
	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->

</body>

</html>
<script>
function select_sellers(id)
{
	
	if(id != '')
	{
		window.location.href = "<?= SITE_URL ?>products?sid=" + id;
	}
	else{
		window.location.href = "<?= SITE_URL ?>products";
	}
}
</script>