<?PHP error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1];
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


  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Product List</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
     
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example2" class="table table-striped table-bordered">
								<thead>
									<tr>
										<!--<td></td>-->
										<td><input type="text" class="form-control" id="search-zero" placeholder="Search by barcode"></td>
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by product name"></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								  <tr>
									<!--<th>Image</th>-->
									<th>Barcode</th>
									<th>Name</th>
									<th>Stock</th>
									<th>Measurement</th>
									<th class="text-center">Print Barcode</th>
								  </tr>
								</thead>
								<tbody>
									<?php 
			
									$fields = "pv.id, pv.product_id, pv.type, pv.stock, pv.measurement, p.name, p.image, p.barcode";
									$tables = PRODUCT_VARIANTS . " pv
									INNER JOIN " . PRODUCTS . " p ON p.id = pv.product_id";
									$where = "WHERE 1 ORDER BY p.name";
									$params = [];
									$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
									//echo "<pre>";print_r($sqlQuery);die;
									if($sqlQuery[0] != '')
									{
										$i = 1;
										foreach($sqlQuery as $selectValue)
										{	
											/*$imagePath = MAIN_SERVER_PATH . $selectValue->image;
											if (!empty($selectValue->image) && file_exists($imagePath)) {
												$imagePath = MAIN_SERVER_PATH . $selectValue->image;
											} else {
												$imagePath = IMG_PATH . 'noImg.jpg';
											}*/
									?>
											  <tr id="dataRow<?php echo($selectValue->id);?>">
												<!--<td><img src="<?PHP echo $imagePath; ?>" height="50"></td>-->
												<td><?PHP echo !empty($selectValue->barcode)  ? $selectValue->barcode : 'N/A'; ?></td>
												<td><?PHP echo $general_cls_call->explode_name($selectValue->name); ?></td>
												<td><?PHP echo $selectValue->stock.' '.$selectValue->type; ?></td>
												<td><?PHP echo $selectValue->measurement; ?></td>
												<td class="text-center">
													<a href = "javascript:void(0)" onclick="printBarcode('<?php echo($selectValue->barcode);?>')" title = "Click here to Print Barcode"><i class="material-icons-outlined">printer</i></a>
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
												<td colspan="5">
												<div class="alert alert-warning text-center" role="alert"><strong>No record found.</strong></div>
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
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->


  <!--plugins-->
	<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/JsBarcode.all.min.js"></script>
	<script type="text/javascript">
		/*function printBarcode(ID) {

			// Enable barcode-only print mode
			document.body.classList.add('print-barcode-mode');

			document.getElementById('barcode').innerHTML = '';

			JsBarcode("#barcode", ID, {
				format: "CODE128",
				displayValue: true,
				height: 60,
				fontSize: 14
			});

			setTimeout(function () {
				window.print();

				// Disable after printing
				document.body.classList.remove('print-barcode-mode');
			}, 300);
		}*/
		
		
		
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
				font-family: "Courier New", monospace;
			}
			.label {
				width: 320px;
				padding: 12px;
				margin: auto;
				text-align: center;
			}
			.row {
				border-top: 1px solid #000;
				border-bottom: 1px solid #000;
				padding: 6px;
				margin: 8px 0;
				font-weight: bold;
			}
			@media print {
				@page { margin: 0; }
			}
		</style>
		</head>

		<body>
		<div class="label">
			<div class="brand"><b>RELIANCE SMART</b></div>
			<div class="product">GREEN PEAS</div>

			<svg id="barcode"></svg>

			<div class="row">
				Weight :- <span id="measurementdata">Loading...</span>
			</div>

			<div class="note">* Includes the weight of packaging</div>
		</div>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"><\/script>
		<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/JsBarcode.all.min.js"><\/script>

		<script>
			var ID = "${ID}"; // ✅ passed safely

			// Generate barcode
			JsBarcode("#barcode", ID, {
				format: "CODE128",
				displayValue: true,
				height: 60,
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
					var da = JSON.stringify(res);
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