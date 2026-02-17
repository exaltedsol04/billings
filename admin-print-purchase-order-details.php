<?php
error_reporting(0);
include_once 'init.php';

if(isset($_GET['group_id']))
{
	$fields = "asp.id, asp.group_id, asp.loose_stock_quantity, asp.product_id, asp.remarks, asp.status, asp.stock, asp.created_at, asp.purchase_price, u.name as unit_name, pv.stock_unit_id, pv.measurement, p.name, p.barcode, v.name as vendor, pv.id as pvid, pv.type, v.email as vendor_email, v.mobile as vendor_mobile, v.city as vendor_city, v.pincode as vendor_pincode, v.address as vendor_address";
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
    <div class="divider"></div>

    <table>
        <thead>
            <tr>
                <th class="center">Sl. No.</th>
				<th>Product Name</th>				
				<th>Type</th>
				<th>Measurement</th>
				<th>Quantity</th>
				<th>Purchase Price</th>
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
            <tr>
                <td class="center"><?PHP echo $k+1; ?></td>
				<td><?PHP echo $barcode.''.$general_cls_call->cart_product_name($arr->name); ?></td>
				<td><?PHP echo $arr->type ;?></td>				
				<td><?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?></td>
				<td><?PHP echo $arr->type== 'loose'  ? $arr->loose_stock_quantity : $arr->stock ?></td>
				<td>₹ <?php echo $arr->purchase_price ?></td>
				<td>₹ <?php echo $arr->type== 'loose'  ? $arr->loose_stock_quantity*$arr->purchase_price : $arr->stock*$arr->purchase_price; ?></td>
            </tr>
            <?php 
				$sl++;
				  $total_amt = $arr->type== 'loose'  ? $total_amt+ $arr->loose_stock_quantity*$arr->purchase_price : $total_amt+ $arr->stock*$arr->purchase_price;
				}
			}
			?>
        </tbody>

		<tfoot class="bfoot">
			<tr class="bold">
            <td class="right" colspan="6">Total Amount: </td>
			<td>₹ <?= $total_amt  ?></td>
			</tr>
		</tfoot>
    </table>

</div>

</body>
</html>
