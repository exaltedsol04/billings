<?php
error_reporting(0);
include_once 'init.php';

$ord_id = $_GET['order_id'];

//-----------------------
$fields = "orders_id";
$tables = ORDERS;
$where ="WHERE id=:id";
$params = [
	':id' => $ord_id
];
$order_data = $general_cls_call->select_query($fields, $tables, $where, $params, 1);
$order_id = $order_data->orders_id;
//echo $order_id;die;
//---------------------------

$order = $general_cls_call->select_query("*", ORDERS, "WHERE id=:id", [':id' => $_GET['order_id']], 1);
//echo "<pre>"; print_r($order);die;

$customer = $general_cls_call->select_query("*", USERS, "WHERE id=:id", [':id' => $order->user_id], 1);
//echo "<pre>"; print_r($customer);die;
//--------------------------
	$fields = "*";
	$tables = ORDERS_ITEMS;
	$where = "WHERE orders_id=:orders_id";
	$params = [
		':orders_id' => $order_id
	];
	$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
	
//-----	package man data====
$fields = "po.*";
$tables = PACKAGING_OPERATORS . " po
INNER JOIN " . PACKAGING_OPERATORS_ASSIGN . " poa ON poa.packaging_operator_id = po.id";
$where = "WHERE poa.order_id=:order_id";
$params = [
	':order_id' => $_GET['order_id']
  ];
$sqlPacQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 1);
//echo "<pre>";print_r($sqlPacQuery);die;

// for QR code 
$qrUrl = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=" . urlencode( $_GET['order_id']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Receipt</title>

<style>
    body {
        font-family: "arial";
    }

    .receipt {
        width: 300px;
        margin: 0px auto;
        padding: 0px;
        color: #000;
        box-shadow: 0 0 5px rgba(0,0,0,0.2);
        font-size: 11px;
    }

    .center {
        text-align: center;
    }

    .bold {
        font-weight: bold;
    }

    .divider {
        border-top: 1px dashed #000;
        margin: 8px 0;
    }

    .logo {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .small {
        font-size: 11px;
        line-height: 1;
    }

    table {
        width: 98%;
        border-collapse: collapse;
        font-size: 12px;
    }

    th, td {
        text-align: left;
        padding: 0px 0;
    }

    th {
        border-bottom: 1px dashed #000;
    }
	.bb tr {
        border-bottom: 1px solid #000;
		padding:2px;
		
    }
	.bb td {
		padding-bottom:5px
	}
	.bb tr:first-child, .bb tr:last-child {
        border-bottom: 0px;
    }

    .right {
        text-align: right;
    }

    .totals td {
        padding: 4px 0;
    }

    .qr {
        text-align: center;
        margin: 10px 0;
    }

    .qr img {
        width: 80px;
        height: 80px;
    }

    .footer {
        font-size: 9px;
        line-height: 1;
        margin-top: 8px;
        text-align: center;
    }

    @media print {
		@page {
			
			margin: 0;
		}

		body {
			margin: 0;
			padding: 0;
			display: flex;
			justify-content: center;
		}

		.receipt {
			margin-left: 0px;
			margin-right:30px;
			width: 280px;
			box-shadow: none;
			padding:0px;
			font-size: 10px;
			line-height: -2;
		}
	}

</style>
</head>
<!-- -->
<body onload="window.print()">

<div class="receipt">

    <div class="center logo"><img src="https://admin.ecofresh.in/storage/logo/1762600335_71147.png" width="100"/></div>

    <div class="center small">
        <strong><?php echo SITE_TITLE; ?></strong><br>
        Near Shushma Petrol Pump Wadhe Phata,<br>
        Highway, Bangalore, Satara, Maharashtra 415001<br>
        Satara - Maharashtra - 415001<br><br>

        Customer Care: 18008910001<br>
        FSSAI Lic No: 11525039000226
    </div>

    <div class="divider"></div>

    <div class="center bold">Packaging List</div>
    <div class="center small">********** Original for Recipient **********</div>

    <div class="divider"></div>
	<div class="center bold" style="font-size:20px;margin-bottom:10px;">Order Id #<?php echo $_GET['order_id']; ?></div>
    <div class="small">
	    Packaging Person: <?php echo $sqlPacQuery->name;?> (<?php echo $sqlPacQuery->mobile;?>)<br>
        Place of Supply & State Code: 27 MH<br>
		<?php 
		if(!empty($customer->name))
		{
		?>
        Customer: <?php echo $customer->name.' (M. '.$customer->mobile.')'; ?><br>
		<?php 
		}
		?>
        Date: <?php echo date('d/m/Y H:i');?><br>
    </div>

    <div class="divider"></div>

    <table>
        <thead>
            <tr>
                <th>HSN</th>
                <th>Item Description</th>
                <th>Price</th>
                <th>Qty</th>
                <th>Unit</th>
                <th>Value</th>
            </tr>
        </thead>
        <tbody class="bb">
            <tr>
                <td colspan="6">CGST 0.00% &nbsp; SGST 0.00%</td>
            </tr>
			<?php 
				$sl =1;
				$tot_amt = 0;
				$count_qty = 0;
				if($sqlQuery[0] != '')
				{
					foreach($sqlQuery as $arr)
					{
						$fields = "pv.id as product_variant_id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price, p.name as product_name, p.image, p.barcode, u.name as stock_unit_name";
						$tables = PRODUCT_VARIANTS . " pv
						INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id
						INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
						$where = "WHERE pv.id=:id";
						$params = [
							':id'=>$arr->product_variant_id
						];
						$product_data = $general_cls_call->select_join_query($fields, $tables, $where, $params, 1);
			?>
            <tr>
                <td><?= !empty($product_data->barcode) ?  $product_data->barcode : ' '; ?></td>
                <td><?= $general_cls_call->explode_name($product_data->product_name) ?></td>
                <td>₹<?= $arr->discounted_price ?></td>
                <td><?= $arr->quantity ?></td>
                <td><?= $product_data->measurement.''.$product_data->stock_unit_name ?></td>
                <td>₹<?= $arr->quantity * $arr->discounted_price ?></td>
            </tr>
            <?php 
				$sl++;
				  $tot_amt = $tot_amt + ($arr->quantity * $arr->discounted_price);
				  $count_qty = $count_qty + $arr->quantity;
				}
			}
			?>
        </tbody>
    </table>

    <div class="divider"></div>

    <table class="totals">
        <tr>
            <td>Items: <?php echo $sl; ?></td>
            <td class="right">Qty: <?= $count_qty  ?></td>
            <td class="right">₹<?= $tot_amt  ?></td>
        </tr>
        <tr>
            <td>Gross Sales Value</td>
            <td></td>
            <td class="right">₹<?= $tot_amt  ?></td>
        </tr>
        <!--<tr>
            <td>Total Discount</td>
            <td></td>
            <td class="right">0.00</td>
        </tr>-->
        <tr>
            <td>Net Sales Value (Inclusive of GST)</td>
            <td></td>
            <td class="right">₹<?= $tot_amt  ?></td>
        </tr>
        <tr class="bold">
            <td>Total Amount Paid</td>
            <td></td>
            <td class="right">₹<?= $tot_amt  ?></td>
        </tr>
	</table>
	<div class="divider"></div>
	<div class="qr">
        <!--real QR image -->
        <img src="<?= $qrUrl ?>" alt="QR Code">
    </div>

</div>
<script>
window.onload = function () {
 
    // wait a bit so page loads fully
    setTimeout(() => {
        window.print();
    }, 300);
 
    // close tab AFTER print dialog finishes
    window.onafterprint = function () {
        window.close();
    };
 
    // fallback close (if afterprint not triggered)
    setTimeout(() => {
        window.close();
    }, 5000);
};
</script>
</body>
</html>

