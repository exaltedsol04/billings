<?php
error_reporting(0);
include_once 'init.php';

if(isset($_GET['group_id']))
{
	$fields = "asp.id, asp.group_id, asp.loose_stock_quantity, asp.product_id, asp.remarks, asp.status, asp.stock, asp.created_at, asp.purchase_price, u.name as unit_name, pv.measurement, p.name, p.barcode, v.name as vendor, pv.id as pvid, pv.type, v.email as vendor_email, v.mobile as vendor_mobile, v.city as vendor_city, v.pincode as vendor_pincode, v.address as vendor_address";
	$tables = ADMIN_STOCK_PURCHASE_LIST . " asp
	INNER JOIN " . PRODUCT_VARIANTS . " pv ON asp.product_variant_id = pv.id
	INNER JOIN " . PRODUCTS . " p ON p.id = asp.product_id
	INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id
	LEFT JOIN " . VENDORS . " v ON v.id = asp.vendor_id";
	$where = "WHERE asp.group_id=:group_id AND asp.product_stock_transaction_id=:product_stock_transaction_id";
	$params = [
		':group_id' => $_GET['group_id'],
		':product_stock_transaction_id'=>0
	];
	$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
	//echo "<pre>";print_r($sqlQuery);die;
	
	/// ADMIN DETAILS
	$admin_details = $general_cls_call->select_query("username, email", ADMIN_MASTER, "WHERE role_id=:role_id", array(':role_id'=>$_SESSION['ROLE_ID']), 1);
}	
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>

<style>
    body {
        font-family: "arial";
    }

    .receipt {
        width: calc(100% - 20px);
        padding: 10px;
        color: #000;
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
        width: 100%;
        border-collapse: collapse;
        font-size: 10px;
    }

    th, td {
        text-align: left;
        padding: 0px 0;
    }

    th {
		border-bottom: 1px solid #000;
    }
	.bfoot tr {
        border-top: 1px solid #000;
		 border-bottom: 1px solid #000;
		
    }
	.bfoot td {
		padding:5px;
		font-weight: bold;
		font-size: 12px;
	}
	.bb tr {
        border-bottom: 1px dashed #000;
		padding:2px;
		
    }
	.bb td {
		padding-bottom:5px
	}
	.bb tr:first-child, .bb tr:last-child {
        /*border-bottom: 0px;*/
    }

    .right {
        text-align: right;
    }

    .totals td {
        padding: 4px 0;
    }


</style>
</head>
<!---->
<body onload="window.print();">

<div class="receipt">

    <div class="center logo"><img src="https://admin.ecofresh.in/storage/logo/1762600335_71147.png" width="100"/></div>

    <div class="center small" style="margin-top:10px;">
        <strong><?php echo SITE_TITLE; ?></strong>
	</div>
	
	<div style="margin-top:15px;margin-bottom:10px;"><p style="font-size:20px;"> PURCHASE ORDER [PO]</p>
		 <table width="100%" style="border-collapse:collapse;">
        <tr>
            
            <!-- FROM -->
            <td width="33%" valign="top">
                <small><b>From</b></small>
                <address style="margin-top:5px;">
                    <strong>
                        Hello, <?php echo $_SESSION['ROLE_ID']==1 ? $_SESSION['USERNAME'] : 'Seller'; ?><br>
                    </strong>
					Email: <?php echo $admin_details->email; ?>
                </address>
            </td>

            <!-- TO -->
            <td width="33%" valign="top">
                <?php if(!empty($sqlQuery[0]->vendor)) { ?>
                    <small><b>To</b></small>
                    <address style="margin-top:5px;">
                        <strong><?php echo $sqlQuery[0]->vendor; ?></strong><br>

                        <?php if(!empty($sqlQuery[0]->vendor_email)) { ?>
                            Email: <?php echo $sqlQuery[0]->vendor_email ?><br>
                        <?php } ?>

                        <?php if(!empty($sqlQuery[0]->vendor_mobile)) { ?>
                            Mobile: <?php echo $sqlQuery[0]->vendor_mobile ?><br>
                        <?php } ?>

                        <?php if(!empty($sqlQuery[0]->vendor_city)) { ?>
                            City: <?php echo $sqlQuery[0]->vendor_city; ?><br>
                        <?php } ?>

                        <?php if(!empty($sqlQuery[0]->vendor_pincode)) { ?>
                            Pincode: <?php echo $sqlQuery[0]->vendor_pincode; ?><br>
                        <?php } ?>

                        <?php if(!empty($sqlQuery[0]->vendor_address)) { ?>
                            Address: <?php echo $sqlQuery[0]->vendor_address; ?>
                        <?php } ?>
                    </address>
                <?php } ?>
            </td>

            <!-- DATE -->
            <td width="33%" valign="top" align="right">
                <small><b>Date</b></small>
                <div style="margin-top:5px;">
                    <b>
                        <?php echo $general_cls_call->change_date_format(
                            $sqlQuery[0]->created_at,
                            'j M Y g:i A'
                        ); ?>
                    </b>
                </div>
            </td>

        </tr>
    </table>
			
	</div>
	
	
	  
	
    <!--<div style="margin-top:10px;margin-bottom:10px;">Invoice date: <?PHP echo $general_cls_call->change_date_format($sqlQuery[0]->created_at, 'j M Y g:i A'); ?>
    </div>-->

    <!--<div class="center bold">BILL OF SUPPLY</div>
    <div class="center small">********** Original for Recipient **********</div>

    <div class="divider"></div>-->

    <!--<div class="small">
        Place of Supply & State Code: 27 MH<br>
        Customer: <?php echo $customer->name.' (M. '.$customer->mobile.')'; ?><br>
        Date: <?php echo date('d/m/Y H:i');?><br>
        Bill No: #<?php echo $order_id; ?><br>
        Store: <?php echo $seller->store_name; ?> &nbsp;&nbsp; Cashier: <?php echo $seller->name; ?><br>
        POS No: R106
    </div>-->
	
		

    <div class="divider"></div>

    <table>
        <thead>
            <tr>
                <th class="text-center">Sl. No.</th>
				<th>Vendor</th>
				<th>Product Name</th>
				
				<th>Measurement</th>
				<th>Type</th>
				<th class="text-center">Quantity</th>
				<th>Purchase Price</th>
				<!--<th>Purchase Date</th>-->
				<th>Total price</th>
            </tr>
        </thead>
        <tbody class="bb">
            <?php 
				$sl =1;
				//$tot_amt = 0;
				$total_amt = 0;
				if($sqlQuery[0] != '')
				{
					foreach($sqlQuery as $k=>$selectValue)
					{
						
			?>
            <tr>
                <td class="text-center"><?PHP echo $k+1; ?></td>
				<td><?PHP echo $selectValue->vendor; ?></td>
				<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($selectValue->name); ?></td>
				
				<td class="text-center"><?PHP echo $selectValue->measurement.'  '.$selectValue->unit_name; ?></td>
				<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?PHP echo $selectValue->type ;?></span></td>
				
				<!--<td><?PHP echo $general_cls_call->change_date_format($selectValue->created_at, 'j M Y g:i A'); ?></td>-->
				<td class="text-center">
				<?PHP echo $selectValue->type== 'loose'  ? $selectValue->loose_stock_quantity : $selectValue->stock ?>
				</td>
				<td>₹ <?php echo $selectValue->purchase_price ?></td>
				<td>₹ <?php echo $selectValue->type== 'loose'  ? $selectValue->loose_stock_quantity*$selectValue->purchase_price : $selectValue->stock*$selectValue->purchase_price; ?></td>
            </tr>
            <?php 
				$sl++;
				  $total_amt = $selectValue->type== 'loose'  ? $total_amt+ $selectValue->loose_stock_quantity*$selectValue->purchase_price : $total_amt+ $selectValue->stock*$selectValue->purchase_price;
				}
			}
			?>
        </tbody>

		<tfoot class="bfoot">
			<tr class="bold">
            <td class="right" colspan="7">Total Amount: </td>
			<td>₹ <?= $total_amt  ?></td>
			</tr>
		</tfoot>
    </table>

</div>

</body>
</html>
