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
		
		function available_stock_report($data)
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
			WHERE 1
			/*(
				(COALESCE(online.online_stock,0) - COALESCE(oi.used_qty,0)) > 0
				OR COALESCE(pos.pos_stock,0) > 0
			)*/
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
		
		function order_status_time($order_id)
		{
			$fields = 'status, created_at';
			$tables = ORDERS_STATUSES;
			$where = 'WHERE order_id=:order_id';
			$params = [
				':order_id' => $order_id
			];
			$sqlQuery = $this->general->select_join_query(
				$fields,
				$tables,
				$where,
				$params,
				2
			);
			$starusArr = [];
			foreach($sqlQuery as $val)
			{
				$starusArr[$val->status] = $val->created_at;
			}
			
			return $starusArr;
		}
		
		function time_diff_format_in_minute($from_time, $to_time)
		{
			if (empty($from_time) || empty($to_time)) {
				return 0;
			}

			$from = new DateTime($from_time);
			$to   = new DateTime($to_time);

			$diffInSeconds = $to->getTimestamp() - $from->getTimestamp();

			return floor($diffInSeconds / 60); // return total minutes
		}
		
		// from table admin_stock_puchase_list fields loose_stock_quantity/stock
		 //and status=1 -sum of +ve loose_stock_quantity/stock
		function admin_credit_stock($data)
		{
			$product_id         = $data['product_id'];
			$product_variant_id = $data['product_variant_id'];
			//return $product_id.''.$product_variant_id;
			
			$fieldsCredit = "
				SUM(
					CASE 
						WHEN pv.type = 'loose'
							THEN asp.loose_stock_quantity
						ELSE asp.stock
					END
				) AS total_stock
				";

				$tablesCredit = ADMIN_STOCK_PURCHASE_LIST . " asp
				INNER JOIN " . PRODUCT_VARIANTS . " pv 
					ON pv.id = asp.product_variant_id
				";

				$whereCredit = "
				WHERE asp.status = :status
				AND asp.product_stock_transaction_id = :product_stock_transaction_id

				AND (
						/* LOOSE → check by product_id */
						(pv.type = 'loose' AND asp.product_id = :product_id)

						OR

						/* NON LOOSE → check by variant_id */
						(pv.type != 'loose' AND asp.product_variant_id = :product_variant_id)
					)
				";

				$paramsCredit = [
					':product_id' => $product_id,
					':product_variant_id' => $product_variant_id, // required for non-loose
					':product_stock_transaction_id' => 0,
					':status' => 1
				];

				$stock_credit = $this->general->select_join_query(
					$fieldsCredit,
					$tablesCredit,
					$whereCredit,
					$paramsCredit,
					1
				);
				
			return $stock_credit->total_stock ? $stock_credit->total_stock : 0;
		}
		
		// from table admin_stock_puchase_list fields loose_stock_quantity/stock
		 //and status=1 -sum of -ve loose_stock_quantity/stock
		function admin_debit_stock($data)
		{
			
			$product_id         = $data['product_id'];
			$product_variant_id = $data['product_variant_id'];
			// dedit debit admin_stock_transaction 
			$fieldsDebit = "
			SUM(
				CASE 
					WHEN pv.type = 'loose'
						THEN asp.loose_stock_quantity
					ELSE asp.stock
				END
			) AS total_stock
			";

			$tablesDebit = ADMIN_STOCK_PURCHASE_LIST . " asp
			INNER JOIN " . PRODUCT_VARIANTS . " pv 
				ON pv.id = asp.product_variant_id
			";

			$whereDebit = "
			WHERE asp.status = :status
			AND asp.product_stock_transaction_id != :product_stock_transaction_id

			AND (
					/* LOOSE → check by product_id */
					(pv.type = 'loose' AND asp.product_id = :product_id)

					OR

					/* NON LOOSE → check by variant_id */
					(pv.type != 'loose' AND asp.product_variant_id = :product_variant_id)
				)
			";

			$paramsDebit = [
				':product_id' => $product_id,
				':product_variant_id' => $product_variant_id, // required for non-loose
				':product_stock_transaction_id' => 0,
				':status' => 1
			];

			$admin_stock_debit = $this->general->select_join_query(
				$fieldsDebit,
				$tablesDebit,
				$whereDebit,
				$paramsDebit,
				1
			);
			
			return $admin_stock_debit->total_stock ? abs($admin_stock_debit->total_stock) : 0;
		}
		function generate_order_id($table, $field)
		{
			$fields = "MAX(CAST($field AS UNSIGNED)) as max_id";
			$result = $this->general->select_query($fields, $table, '', [], 1);
			$next = 1;

			if (!empty($result) && !empty($result->max_id)) {
				$next = $result->max_id + 1;
			}

			$order_id = str_pad($next, 4, '0', STR_PAD_LEFT);
			
			return $order_id;
		}
	}
?>