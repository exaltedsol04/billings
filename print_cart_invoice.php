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
	$fields = "poi.*, po.*";
	$tables = POS_ORDERS_ITEMS . " poi
	INNER JOIN " . POS_ORDERS . " po ON po.id = poi.pos_order_id";
	$where = "WHERE po.id= :order_id";
	$params = [
		':order_id' => $order_id
	];
	$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
	
	//$product = $general_cls_call->select_query("*", PRODUCTS, "WHERE id=:id", [':id' => $arr->id], 1);
	
	//echo "<pre>"; print_r($sqlQuery);die;
//------------------------
$pos_order_itm = $general_cls_call->select_query("*", POS_ORDERS_ITEMS, "WHERE pos_order_id=:pos_order_id", [':pos_order_id' => $order_id], 1);
$product_id = $pos_order_itm->product_id;

$product_variant_data  = $general_cls_call->select_query("*", PRODUCTS, "WHERE id=:id", [':id' => $product_id], 1);		
$barcode = 	$product_variant_data->barcode;		
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
        font-size: 10px;
    }

    th, td {
        text-align: left;
        padding: 0px 0;
    }

    th {
        border-bottom: 1px dashed #000;
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

    <div class="center bold">BILL OF SUPPLY</div>
    <div class="center small">********** Original for Recipient **********</div>

    <div class="divider"></div>

    <div class="small">
        Place of Supply & State Code: 27 MH<br>
        Customer: <?php echo $customer->name.' ('.$customer->mobile.')'; ?><br>
        Date: <?php echo date('d/m/Y H:i');?><br>
        Bill No: #<?php echo $order_id; ?><br>
        Store: <?php echo $seller->store_name; ?> &nbsp;&nbsp; Cashier: <?php echo $seller->name; ?><br>
        POS No: R106
    </div>

    <div class="divider"></div>

    <table>
        <thead>
            <tr>
                <th>HSN</th>
                <th>Item Description</th>
                <th class="right">Price</th>
                <th class="right">Qty</th>
                <th class="right">Value</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="5">CGST 0.00% &nbsp; SGST 0.00%</td>
            </tr>
			<?php 
				$sl =1;
				$tot_amt = 0;
				$count_qty = 0;
				if($sqlQuery[0] != '')
				{
					foreach($sqlQuery as $arr)
					{
						$product = $general_cls_call->select_query("*", PRODUCTS, "WHERE id=:id", [':id' => $arr->id], 1);
			?>
            <tr>
                <td><?= $barcode ?></td>
                <td><?= $general_cls_call->cart_product_name($product->name) ?></td>
                <td class="right">₹<?= $arr->unit_price ?></td>
                <td class="right"><?= $arr->quantity ?></td>
                <td class="right">₹<?= $arr->total_price ?></td>
            </tr>
            <?php 
				$sl++;
				  $tot_amt = $tot_amt + $arr->total_price;
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
        <tr>
            <td>Total Discount</td>
            <td></td>
            <td class="right">0.00</td>
        </tr>
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

    <div class="small">
        ITO PAY UPI ID: rx-7738-10112600<br>
        Amount Inclusive of Applicable Taxes
    </div>

    <div class="divider"></div>

    <div class="small">
        Payment Ref No: TMX1100616507012026<br>
        Bill of Supply: TMX110626100071<br>
        ROne Card No: 935XXXX061 ROne Bal (Amount): 6.33<br>
        Terms & Conditions Apply
    </div>

    <div class="qr">
        <!-- Replace src with real QR image -->
        <img src="https://api.qrserver.com/v1/create-qr-code/?size=100x100&data=RelianceSmartReceipt">
    </div>

    <div class="footer">
        I/we hereby certify that food/foods mentioned in this<br>
        invoice is/are warranted to be of the nature<br>
        and quality which it/these purports/supported to be.<br><br>

        ★ Thank You for Shopping With Us ★<br><br>

        Website: www.relianceretail.com<br>
        Customer Care email: customerservice@ril.com<br><br>

        Please refer our Website link<br>
        https://www.relianceretail.com/privacy-policy.html<br>
        for Privacy Policy<br><br>

        Dynamic Quick Response (QR) code is made<br>
        available to the Recipient through a digital display
    </div>

</div>

</body>
</html>
