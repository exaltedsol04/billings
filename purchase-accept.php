<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => true,
		'daterangepicker' => true,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
		{
			$fromDate = $_POST['fromDate'];
			$toDate = $_POST['toDate'];
			$whereDateRange = "AND pr.created_date >= :fromDate AND pr.created_date < DATE_ADD(:toDate, INTERVAL 1 DAY)";
			
			
			$params = [
				':status' => 3,
				':transaction_type' => 1,
				':seller_id'=> $_SESSION['SELLER_ID'],
				':fromDate' => $_POST['fromDate'],
				':toDate'   => $_POST['toDate']
			];
			
		}
		else
		{
			//$whereDateRange = 'AND DATE(os.created_at) = CURDATE()';
			$whereDateRange = 'AND DATE(pr.created_date) BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()';

			
			$params = [
				':status'=> 3,
				':transaction_type' => 1,
				':seller_id'=> $_SESSION['SELLER_ID']
			];
			
		}
	
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/sellerMenu.php"); ?>
	<!-- ######### HEADER END ############### -->

	<main class="main-wrapper">
    <div class="main-content">
		<h6 class="mb-0 text-uppercase">Search panel</h6>
						<hr>
						<div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
							<div class="card-body">
								<form class="row g-4" method="post" action="">
									<div class="col-md-6">
										<label for="input1" class="form-label">From date</label>
										<input type="text" name="fromDate" id="fromDate" class="form-control" placeholder="Start Date" readonly>
									</div>
									<div class="col-md-6">
										<label for="input5" class="form-label">To date</label>
										<input type="text" name="toDate" id="toDate" class="form-control" placeholder="End Date" readonly>
									</div>
									
									<div class="col-md-12">
									  <div class="d-md-flex d-grid justify-content-md-between">
										<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
										<button type="submit" class="btn btn-grd btn-grd-success px-4" name="btnUser" value="SAVE">Search</button>
									  </div>
									</div>
								</form>
							</div>
						</div>
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
							<td></td>
						</tr>
                      <tr  class="text-center">
						<th>Sl. No.</th>
						<th>Barcode</th>
						<th>Name</th>
						<th>Request Qty.</th>
						<th>Measurement</th>
						<th>Type</th>
						<th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php 
						$fields = "pr.id, pr.product_id, pr.status, pr.stock as pqty, pv.stock_unit_id, pv.type, pv.stock, pv.measurement, p.name, p.image, p.barcode, pv.id as product_variant_id";
						$tables = PRODUCT_STOCK_TRANSACTION . " pr
						INNER JOIN " . PRODUCT_VARIANTS . " pv ON pr.product_variant_id = pv.id
						INNER JOIN " . PRODUCTS . " p ON p.id = pr.product_id";
						//$where = "WHERE pr.status=0 AND pr.transaction_type = '1' AND pr.seller_id ='" .$_SESSION['USER_ID']. "' ORDER BY pr.created_date DESC";
						
						/*$where = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type AND pr.seller_id =:seller_id ORDER BY pr.created_date DESC";
						$params = [
							':status' => 3,
							':transaction_type' => 1,
							':seller_id' => $_SESSION['SELLER_ID']
						];*/
						
						
						$where = "WHERE pr.status = :status AND pr.transaction_type = :transaction_type AND pr.seller_id =:seller_id ". $whereDateRange;
						
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
						<td><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type ?></span></td>
						<td>
						<a href="javascript:void(0);" onclick="accept_purchase(<?php echo $arr->id ;?>, <?php echo $arr->product_id ;?>, <?php echo $arr->product_variant_id ;?>)">
						<button type="button" class="btn btn-success raised d-flex gap-2" title = "Accept" data-bs-toggle="tooltip"><i class="lni lni-checkmark-circle fs-5"></i>Accept</button></a></td>
                      </tr>
						<?PHP
								$i++;
							}
						}
					?>
                   </tbody>
                  </table>
				  
					  
                  </div>
              </div>
            </div>
        </div>
	</main>
		
		<!-- Modal -->
	<div class="modal fade" id="acceptModal">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2 bg-grd-success">
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
				  <div id="error_qty"></div>
				</div>
				<input type="hidden" id="product_stock_transaction_id">
				<div class="col-md-12">
				  <div class="d-md-flex d-grid justify-content-md-between">
					<input type="hidden" id="order_id" name="order_id">
					<input type="hidden" id="hid_product_id" name="hid_product_id">
					<input type="hidden" id="hid_product_variant_id" name="hid_product_variant_id">
					
					<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
					<button type="button" id="acceptSave" class="btn btn-grd btn-grd-success px-4">Save</button>
				  </div>
				</div>
			  </form>
			</div>
		  </div>
		</div>
	  </div>
	</div>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->
	<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
  </body>
</html>
<script>
$(function () {

  //let start = moment().startOf('today');
  let start = moment().subtract(1, 'month').startOf('day');
  let end   = moment().endOf('today');

  function setDates(start, end) {
    $('#fromDate').val(start.format('YYYY-MM-DD'));
    $('#toDate').val(end.format('YYYY-MM-DD'));
  }

	// Apply picker on FROM field (controls both)
	$('#fromDate').daterangepicker({
		startDate: start,
		endDate: end,
		autoUpdateInput: false,
		parentEl: 'body',          // ⭐ FIX POSITION
		opens: 'right',            // open next to input
		drops: 'down',             // force downward
		locale: {
			cancelLabel: 'Clear'
		}
	});


  // When range selected
  $('#fromDate').on('apply.daterangepicker', function (ev, picker) {
      setDates(picker.startDate, picker.endDate);
  });

  // Clear
  $('#fromDate').on('cancel.daterangepicker', function () {
      $('#fromDate, #toDate').val('');
  });

  // Set default
  setDates(start, end);
});

$(document).on('click', '#acceptSave', function(){
	let status = $('#status_id').val();
	//alert(status);
	let stock_transaction_id = $('#product_stock_transaction_id').val();
	let qty = $('#qty').val();
	if(status==2 || status==3 || status==4)
	{
		if(qty == '')
		{
			$('#error_qty').html('<span class="text-danger">Enter quantity</span>');
			return false;
		}
	}
	
	let product_id = $('#hid_product_id').val();
	let product_variant_id = $('#hid_product_variant_id').val();
	
	//var datapost = $('#cart-list-form').serialize();
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {action:'purchaseAccept', accept_status:status,stock_transaction_id:stock_transaction_id,qty:qty,product_id:product_id,product_variant_id:product_variant_id},
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
			
			setTimeout(() => {
				window.location.reload();
			}, "2000");
		}
	});
})
function accept_purchase(id,pid,pvid)
{
	//alert(id);alert(pid);alert(pvid);
	$('#msgText').html('');
	$('#error_qty').html('');
	$('#status_id').val('').trigger('change');
	$('#qty').val('');
	
	$('#product_stock_transaction_id').val(id);
	$('#hid_product_id').val(pid);
	$('#hid_product_variant_id').val(pvid);
	$('#acceptModal').modal('show');
}
function select_status(val)
{
	if(val==2 || val == 3 || val == 4)
	{
		$('.qty-div').show();
		$('#error_qty').html('');
	}
	else{
		$('.qty-div').hide();
	}
}
</script>
