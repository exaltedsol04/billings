<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
	ob_end_flush();
	
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/adminHeader.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/adminMenu.php"); ?>
	<!-- ######### HEADER END ############### -->

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
						</tr>
                      <tr  class="text-center">
						<th>Sl. No</th>
						<th>Barcode</th>
						<th>Name</th>
						<th class="text-center">Print Barcode</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.status, SUM(pr.stock) as total_stock, pv.measurement, p.name, p.barcode";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id";
						$where = "WHERE pr.status=1 AND pr.seller_id ='" .$_SESSION['USER_ID']. "' GROUP BY pr.product_variant_id";
						$params = [];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $arr)
							{	
					?>
                     <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $i; ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td class="text-center">
						<?php 
						if(!empty($arr->barcode))
						{
						?>
							<a href = "javascript:void(0)" onclick="printBarcode('<?php echo($arr->barcode);?>')" title = "Click here to Print Barcode"><i class="material-icons-outlined">printer</i></a>
							<?php 
						}
						?>
						</td>
					</tr>
						<?PHP
								$i++;
							}
						}
						else
						{
					?>
                      <tr>
                        <td colspan="3">No record found.</div>
						</td>
					  </tr>
					<?PHP
						}	
					?>
                   </tbody>
                  </table>
                  </div>
              </div>
            </div>
      </main>

<div id="printBarcodeArea" class="print-barcode-only">
    <svg id="barcode"></svg>
</div>
	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
	
	<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/JsBarcode.all.min.js"></script>
	<script type="text/javascript">
		function printBarcode(ID) {
			let printWindow = window.open('', '_blank');

			printWindow.document.write(`
		<!DOCTYPE html>
		<html>
		<head>
		<title>Print Barcode</title>
		<style>
			body {
				margin: 0;
				padding: 0;
				font-family: "Courier New", monospace;
				width: 80mm;
				height: auto;
				overflow: hidden;
			}

			.label {
				width: 80mm;
				padding: 4px;
				text-align: center;
				page-break-after: avoid;
			}

			.row {
				border-top: 1px solid #000;
				border-bottom: 1px solid #000;
				padding: 6px;
				margin: 6px 0;
				font-weight: bold;
				text-align: left;
			}
			
			.product {
				font-weight: bold;
			}
			
			.note {
				text-align: center;
			}

			@media print {
				@page {
					size: 80mm auto;
					margin: 0;
				}

				* {
					page-break-before: avoid !important;
					page-break-after: avoid !important;
					page-break-inside: avoid !important;
				}
			}
		</style>

		</head>

		<body>
		<div class="label">
			<div class="product">GREEN PEAS</div>

			<svg id="barcode"></svg>

			<div class="note">Weight: <span id="measurementdata">Loading...</span></div>
		</div>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"><\/script>
		<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/JsBarcode.all.min.js"><\/script>

		<script>
			var ID = "${ID}";

			// Generate barcode
			JsBarcode("#barcode", ID, {
				format: "CODE128",
				displayValue: true,
				height: 55,
				width: 2,
				fontSize: 14
			});

			// Fetch weight dynamically
			$.ajax({
				type: "POST",
				url: "<?= SITE_URL ?>ajax",
				data: { action: "productprint", barcode: ID },
				dataType: "json",
				success: function(res) {
					//alert(res);
					//var da = JSON.stringify(res);
					//var da = JSON.parse(res);
					//alert(da.measurement);
					if(res.measurement && res.unitname){
						$('#measurementdata').text(res.measurement + ' ' + res.unitname);
					} else {
						$('#measurementdata').text('N/A');
					}

					// PRINT AFTER EVERYTHING IS READY
					setTimeout(function(){
						window.print();
						window.close();
					}, 300);
				},
				error: function(){
					$('#measurementdata').text('Error');
					window.print();
					window.close();
				}
			});
		<\/script>

		</body>
		</html>
			`);

			printWindow.document.close();
		}
		
		
		function printBarcode_s(ID) {
			alert(ID);
			//var datapost = 'action=productprint&phone='+ID;
			$.ajax({
				type: "POST",
				url: "<?= SITE_URL ?>ajax",
				data: {
					action: "productprint",
					barcode: ID
				},
				success: function (response) {
					var data = JSON.parse(response);
					 //alert(data);
				
					var value = data[0].measurement +' ' + data[0].unitname;
					alert(value)
					$('#measurementdata').html(value);
					//print_product_barcode(ID)
				}
			});
		}
</script>
  </body>
</html>
