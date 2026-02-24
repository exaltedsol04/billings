<?php 
	class RUF
	{
		private $db;
		private $general;
		public function __construct($database, $general)
		{
				$this->db = $database;
				$this->general = $general;
		}
		
		function available_stock_report ($data)
		{
			$product_id         = $data['product_id'];
			$product_variant_id = $data['product_variant_id'];
			$product_type       = $data['product_type'];

			$fields = "
				p.id AS product_id,
				p.name,
				p.barcode,
				pv.stock_unit_id,
				pv.id AS product_variant_id,
				pv.measurement,
				pv.type,

				u.name AS stock_unit_name,

				COALESCE(online.online_stock,0) AS online_total_stock,
				COALESCE(oi.used_qty,0) AS used_stock,

				(COALESCE(online.online_stock,0) - COALESCE(oi.used_qty,0))
					AS available_stock,

				COALESCE(pos.pos_stock,0) AS pos_stock
			";

			$tables = PRODUCTS . " p

			/* ================= VARIANT SELECTION ================= */
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


			/* ================= ONLINE STOCK ================= */
			LEFT JOIN (
				SELECT
					CASE WHEN pv2.type='loose' THEN pst.product_id ELSE NULL END AS loose_product_id,
					CASE WHEN pv2.type!='loose' THEN pst.product_variant_id ELSE NULL END AS normal_variant_id,
					SUM(
						CASE
							WHEN pv2.type='loose' THEN pst.loose_stock_quantity
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
							WHEN pv3.type='loose' THEN pst.loose_stock_quantity
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


			/* ================= FILTER ================= */
			$where = "
			WHERE
			(
				(COALESCE(online.online_stock,0) - COALESCE(oi.used_qty,0)) > 0
				OR COALESCE(pos.pos_stock,0) > 0
			)
			";

			/* ⭐ ADD THIS PART ONLY */
			if ($product_type === 'loose') {
				$where .= " AND p.id = :product_id ";
			} else {
				$where .= " AND pv.id = :product_variant_id ";
			}


			$params = [
				':seller_id' => $_SESSION['SELLER_ID']
			];

			if ($product_type === 'loose') {
				$params[':product_id'] = $product_id;
			} else {
				$params[':product_variant_id'] = $product_variant_id;
			}


			$sqlQuery = $this->general->select_join_query(
				$fields,
				$tables,
				$where,
				$params,
				1
			);

			return $sqlQuery;
		}
	}
?>