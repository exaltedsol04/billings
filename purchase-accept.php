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
							<td></td>
							<td></td>
						</tr>
                      <tr  class="text-center">
						<th>Sl. No.</th>
						<th>Barcode</th>
						<th>Name</th>
						<th>Request Qty.</th>
						<th>Measurement</th>
						<th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.status, pr.stock as pqty, pv.stock_unit_id, pv.type, pv.stock, pv.measurement, p.name, p.image, p.barcode";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id";
						//$where = "WHERE pr.status=0 AND pr.transaction_type = '1' AND pr.seller_id ='" .$_SESSION['USER_ID']. "' ORDER BY pr.created_date DESC";
						$where = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type AND pr.seller_id =:seller_id ORDER BY pr.created_date DESC";
						$params = [
							':status' => 3,
							':transaction_type' => 1,
							':seller_id' => $_SESSION['USER_ID']
						];
						$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);

						//echo "<pre>"; print_r($sqlQuery);die;
						
						if($sqlQuery[0] != '')
						{
							$i = 1;
							foreach($sqlQuery as $key=>$arr)
							{	
								/*$imagePath = MAIN_SERVER_PATH . $arr->image;
								if (!empty($arr->image) && file_exists($imagePath)) {
									$imagePath = MAIN_SERVER_PATH . $arr->image;
								} else {
									$imagePath = IMG_PATH . 'noImg.jpg';
								}*/
								
								$unitdata = $general_cls_call->select_query("*", UNITS, "WHERE id =:id ", array(':id'=> $arr->stock_unit_id), 1);
					?>
                      <tr class="text-center" id="dataRow<?php echo($arr->id);?>">
						<td><?PHP echo $key+1; ?></td>
						<td><?PHP echo !empty($arr->barcode) ? $arr->barcode : 'N/A'; ?></td>
						<td><?PHP echo $general_cls_call->cart_product_name($arr->name); ?></td>
						<td><?PHP echo $arr->pqty ?></td>
						<td><?PHP echo $arr->measurement . ' ' .$unitdata->name; ?></td>
						<td>
						<a href="javascript:void(0);" onclick="accept_purchase(<?php echo $arr->id ;?>)">
						<button type="button" class="btn btn-success raised d-flex gap-2" title = "Accept" data-bs-toggle="tooltip"><i class="lni lni-checkmark-circle fs-5"></i>Accept</button></a></td>
                      </tr>
						<?PHP
								$i++;
							}
						}
						else
						{
					?>
                      <tr>
                        <td colspan="6">No record found.</div>
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
		
		<!-- Modal -->
	<div class="modal fade" id="acceptModal">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2 bg-grd-info">
			<h5 class="modal-title btn-grd">Accept Purchase</h5>
			<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
			  <i class="material-icons-outlined">close</i>
			</a>
		  </div>
		  <div class="modal-body">
			<div class="form-body">
			  <form name="frm" action="" method="post" class="row g-3">
			  <span id="msgText"></span>
				<div class="col-md-12">
				  <label for="operator_id" class="form-label">Stock Status</label>
				  <select id="status_id" class="form-select select2-dropdown status_id" tabindex="1" onchange="select_status(this.value)">
				  <option value="">Choose..</option>
				  <?php 
				  foreach($purchase_accept_array as $k=>$val)
				  {
				  ?>
				  <option value="<?php echo $k; ?>"><?php echo $val; ?></option>
				  <?php 
				  }
				  ?>
				  </select>
				</div>
				
				<div class="col-md-12 qty-div"  style="display:none">
				  <label for="operator_id" class="form-label">Quantity</label>
				  <input type="text" class="form-control" id="qty"  placeholder="Quantity"  oninput="this.value = this.value.replace(/[^0-9]/g, '')">
				</div>
				<input type="hidden" id="product_stock_transaction_id">
				<div class="col-md-12">
				  <div class="d-md-flex d-grid justify-content-md-between">
					<input type="hidden" id="order_id" name="order_id">
					
					<button type="reset" class="btn btn-grd btn-grd-info px-4">Reset</button>
					<button type="button" id="acceptSave" class="btn btn-grd btn-grd-danger px-4">Save</button>
				  </div>
				</div>
			  </form>
			</div>
		  </div>
		</div>
	  </div>
	</div>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
	
  </body>
</html>
<script>

$(document).on('click', '#acceptSave', function(){
	let status = $('#status_id').val();
	//alert(status);
	let stock_transaction_id = $('#product_stock_transaction_id').val();
	let qty = $('#qty').val();
	
	//var datapost = $('#cart-list-form').serialize();
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {action:'purchaseAccept', accept_status:status,stock_transaction_id:stock_transaction_id,qty:qty},
		dataType: "json",
		success: function(response){
			//alert(response.status);
			if(response.status==400)
			{
				$('#msgText').html(response.msg);
			}
			else if(response.status==200)
			{
				$('#msgText').html(response.msg);
			}
			/*$('#actionstatus').val('paynow');
			$('#supplier_id').val('');
			$('#check-stock-pay-div').html('');
			var order_id = JSON.parse(response);
			clearCart();
			$('#paymentmode-modal').modal('hide');
			clearCart();
			window.open(
				"<?= SITE_URL ?>print_cart_invoice?order_id=" + order_id,
				"_blank"
			);*/
		}
	});
})
function accept_purchase(id)
{
	$('#msgText').html('');
	$('#status_id').val('').trigger('change');
	$('#qty').val('');
	
	$('#product_stock_transaction_id').val(id);
	$('#acceptModal').modal('show');
}
function select_status(val)
{
	if(val==2 || val == 3 || val == 4)
	{
		$('.qty-div').show();
	}
	else{
		$('.qty-div').hide();
	}
}
</script>
