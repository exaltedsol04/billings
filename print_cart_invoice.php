<?php
error_reporting(0);
include_once 'init.php';

$order_id = $_GET['order_id'];

$order = $general_cls_call->select_query("*", POS_ORDERS, "WHERE id=:id", [':id' => $order_id], 1);
//echo "<pre>"; print_r($order);die;
$seller = $general_cls_call->select_query("*", SELLERS, "WHERE admin_id=:admin_id", [':admin_id' => $order->store_id], 1);
//echo "<pre>"; print_r($seller);die;

$customer = $general_cls_call->select_query("*", USERS, "WHERE id=:id", [':id' => $order->pos_user_id], 1);

//--------------------------
	$fields = "pv.*, p.*";
	$tables = POS_ORDERS_ITEMS . " pv
	INNER JOIN " . POS_ORDERS . " p ON p.id = pv.pos_order_id";
	$where = "WHERE p.id= '".$order_id."' ";
	$params = [];
	$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
	
	//echo "<pre>"; print_r($sqlQuery);die;
						
?>
<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            color: #000;
        }

        .invoice-container {
            width: 58mm;
            margin: auto;
        }

        .center {
            text-align: center;
        }

        .right {
            text-align: right;
        }

        .bold {
            font-weight: bold;
        }

        .invoice-header {
            text-align: center;
            margin-bottom: 15px;
        }

        .invoice-details {
            width: 100%;
            margin-bottom: 15px;
        }

        .invoice-details td {
            padding: 2px 0;
        }

        .invoice-title {
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            margin: 15px 0;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }

        table.items {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table.items th,
        table.items td {
            border-bottom: 1px solid #000;
            padding: 6px;
            text-align: center;
        }

        table.items th {
            font-weight: bold;
        }

        .summary {
            width: 100%;
            margin-top: 15px;
        }

        .summary td {
            padding: 4px 0;
        }

        .summary .label {
            text-align: right;
            padding-right: 10px;
        }

        .summary .value {
            text-align: right;
            width: 100px;
        }

        @media print {
            body {
                margin: 0;
            }
        }
    </style>
</head>

<body onload="window.print()">

<div class="invoice-container">

    <!-- HEADER -->
    <div class="invoice-header">
        <div>Mobile: <?= $seller->mobile ?>, Email: <?= $seller->email ?></div>
    </div>

    <!-- DETAILS -->
    <table class="invoice-details">
        <tr>
            <td><strong>Invoice ID:</strong></td>
            <td><?= $order_id ?></td>
        </tr>
        <!--<tr>
            <td><strong>VAT-Reg:</strong></td>
            <td>654321</td>
        </tr>-->
        <tr>
            <td><strong>Date:</strong></td>
            <td><?= date('j M Y g:i A', strtotime($order->created_at)) ?></td>
        </tr>
        <!--<tr>
            <td><strong>GST Reg:</strong></td>
            <td></td>
        </tr>-->
        <tr>
            <td><strong>Customer Name:</strong></td>
            <td><?= $customer->name ?></td>
        </tr>
        <tr>
            <td><strong>Phone:</strong></td>
            <td><?= $customer->mobile ?></td>
        </tr>
        <!--<tr>
            <td><strong>Address:</strong></td>
            <td>address</td>
        </tr>-->
        <!--<tr>
            <td><strong>GTIN:</strong></td>
            <td>147258</td>
        </tr>-->
    </table>

    <!-- TITLE -->
    <div class="invoice-title">INVOICE</div>

    <!-- ITEMS -->
    <table class="items">
        <thead>
            <tr>
                <th>Sl.</th>
                <th>Name</th>
                <th>Qty</th>
                <th>Price</th>
                <th>Amount</th>
            </tr>
        </thead>

        <tbody>
		<?php 
		$sl =1;
		$tot_amt = 0;
		if($sqlQuery[0] != '')
		{
			foreach($sqlQuery as $arr)
			{
				$product = $general_cls_call->select_query("*", PRODUCTS, "WHERE id=:id", [':id' => $arr->id], 1);
		?>
				<tr>
					<td><?= $sl ?></td>
					<td><?= $general_cls_call->cart_product_name($product->name) ?></td>
					<td><?= $arr->quantity ?><br><small>Pieces</small></td>
					<td>₹<?= $arr->unit_price ?></td>
					<td>₹<?= $arr->total_price ?></td>
				</tr>
		<?php 
			$sl++;
			  $tot_amt = $tot_amt + $arr->total_price;
			}
		}
		?>
        </tbody>
    </table>

    <!-- SUMMARY -->
    <table class="summary">
        <tr>
            <td class="label bold">Total Amt:</td>
            <td class="value bold">₹<?= $tot_amt  ?></td>
        </tr>
        <!--<tr>
            <td class="label">Order Tax:</td>
            <td class="value">0.00</td>
        </tr>
        <tr>
            <td class="label">Discount:</td>
            <td class="value">0.00</td>
        </tr>
        <tr>
            <td class="label">Shipping Chrg:</td>
            <td class="value">0.00</td>
        </tr>
        <tr>
            <td class="label">Others Chrg:</td>
            <td class="value">0.00</td>
        </tr>-->
    </table>

</div>

</body>
</html>

