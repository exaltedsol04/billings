<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
//error_reporting(1);
	ob_start();
	
	if($_SERVER['REQUEST_METHOD'] == "POST")
	{
		//echo "<pre>";print_r($_POST);die;
		
		extract($_POST);
		//echo "<pre>";print_r($_POST);die;
		//echo "<pre>";print_r($product_variant_id);die;
		if(!empty($product_variant_id))
		{
			$sucMsg = '';
			foreach($product_variant_id as $k=>$val) {
				
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $val), 1);
				//echo "<pre>";print_r($product_variant_dtls);die;
				$product_id = $product_variant_dtls->product_id;
				
				/*$whereCheck = "WHERE seller_id=:seller_id AND status=:status AND  transaction_type=:transaction_type AND product_id=:product_id AND product_variant_id=:product_variant_id";
				$paramCheck = [
					':seller_id' => $_SESSION['SELLER_ID'],
					':status' => 0,
					':transaction_type' => 7,
					':product_id' => $product_id,
					':product_variant_id' => $val
				];
				$count_record = $general_cls_call->select_query_count(PRODUCT_STOCK_TRANSACTION, $whereCheck, $paramCheck);
				if($count_record == 0)
				{*/					
					//echo $val.'-> '.$product_id; die;
					$unit_price = $product_variant_dtls->discounted_price;
					$total_price = $stock[$k] * $unit_price;
					
					$loose_stock_quantity = 0.00;
					$variant_type = $product_variant_dtls->type;
					$stock_qty = $general_cls_call->specialhtmlremover($stock[$k]);
					if($variant_type == 'loose')
					{
						$loose_stock_quantity = $stock_qty;
						$stock_qty = 0;
					}
					
					
					$field = "seller_id, product_variant_id, product_id, loose_stock_quantity, stock, stock_type, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id,approved_by, approved_date, order_id, remarks";
					$value = ":seller_id, :product_variant_id, :product_id, :loose_stock_quantity, :stock, :stock_type, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id, :remarks";
					
					$addExecute=array(
						':seller_id'			=> $_SESSION['SELLER_ID'],
						':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
						':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
						':loose_stock_quantity'			=> $general_cls_call->specialhtmlremover($loose_stock_quantity),
						':stock'				=> $stock_qty,
						':stock_type'			=> $general_cls_call->specialhtmlremover($stock_type),
						':created_date'			=> date("Y-m-d H:i:s"),
						':status'				=> 0,
						':selling_price'		=> $general_cls_call->specialhtmlremover($hid_purchase_price[$k]),
						':purchase_price'		=> $general_cls_call->specialhtmlremover($hid_price[$k]),
						':transaction_type'		=> 7,
						':received_selled_id'	=> 0,
						':parent_id'			=> 0,
						':approved_by'			=> 0,
						':approved_date'		=> '0000-00-00 00:00:00',
						':order_id'		       => 0,
						':remarks'		=> NULL,
					);
					
					$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
					
					$sucMsg = "Data has been submitted successfully";
					$_SESSION['call_js'] = true;
				//}
			}
			
			
			
			header("Location: ".SITE_URL.'purchase-order-instant?m=1');
			exit();
			
		}
		else
		{
			$erMsg = "Please choose product.";
		}
	}
	//total orders	
	$today_date = date('Y-m-d');
	ob_end_flush();
?>

	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP include_once("includes/sellerMenu.php"); ?>
	<!-- ######### MENU END ############### -->
	<style>
/* Target column */
.table-striped tbody tr td:nth-child(6),
.table-striped thead tr th:nth-child(6) {
    background-color: yellow !important;
}
.table-striped>tbody>tr:nth-of-type(odd) td:nth-child(6) { 
	--bs-table-bg-type: yellow !important;
}
</style>
  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
		<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
			<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
			<div class="ps-3">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-0 p-0">
						<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Manage assign stock</a>
						</li>
					</ol>
				</nav>
			</div>
		</div>
		<!--end breadcrumb-->
		<div class="row">
			<div class="col-md-12" id="msg"></div>
		</div>
		<?PHP 
			//if(isset($sucMsg) && $sucMsg != '')
			if(isset($_GET['m']) && $_GET['m']== '1')
			{
			?>
				<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
					<div class="text-white"><strong>Success</strong> <?PHP echo "Data has been submitted successfully"; ?></div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			<?PHP
			}
		?>
		<h6 class="mb-0 text-uppercase">Search panel</h6>
		<hr>
		<div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
			<div class="card-body">
				<form class="row g-4" method="post" action="">
					<div class="col-md-6">
						<label for="input1" class="form-label">Search type</label>
						<select name="src_type" class="form-select select2-dropdown" onchange="selectdate(this.value)">
							<option value="">Select</option>
							<option value="today" <?php echo ($_POST['src_type'] == 'today' || empty($_POST)) ? 'selected' : '' ;?>>Today</option>
							<option value="yesterday" <?php echo $_POST['src_type'] == 'yesterday' ? 'selected' : '' ;?>>Yesterday</option>
							<option value="tomorrow" <?php echo $_POST['src_type'] == 'tomorrow' ? 'selected' : '' ;?>>Tomorrow</option>
							<option value="select_date" <?php echo $_POST['src_type'] == 'select_date' ? 'selected' : '' ;?>>Select date</option>
						</select>
					</div>
					<div class="col-md-6 date_div" style="display:none;">
						<label for="input5" class="form-label">To date</label>
						<input type="date" name="toDate" id="toDate" class="form-control" placeholder="End Date">
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
			<form name="frm" action="" method="post" id="submit_purchase">
				<input type="hidden" value="2" name="stock_type" id="stock_type">
				<div class="table-responsive">
					<table id="example2" class="table table-striped table-bordered dataTable">
						<thead>
							<tr>
								<td></td>
								<td><input type="text" class="form-control" id="search-one" placeholder="Search by product"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								
							</tr>
						  <tr>
							<th style="width:100px">Sr. no</th>
							<th>product name</th>
							<th class="text-center">Pos stock</th>
							<th class="text-center">Online available stock</th>
							<th>Total available stock</th>
							<th>To be purchase</th>
							<th class="text-center">Order stock</th>
							<th>Measurement</th>
							<th>Type</th>
							
						  </tr>
						</thead>
						<tbody>
						<?php
								
					/*$where = "WHERE
							DATE(o.created_at) = CURDATE()
							AND o.active_status = :active_status
							AND oi.seller_id = :seller_id*/
						
						$fields = "o.id, oi.product_variant_id, p.id AS product_id, p.name AS product_name, pv.discounted_price, pv.price, pv.stock_unit_id, 
							CASE 
								WHEN pv.type = 'loose' THEN pv.product_id
								ELSE oi.product_variant_id
							END AS item_key,
							pv.type,
							SUM(
								CASE
									/* LOOSE PRODUCT */
									WHEN pv.type = 'loose'
										THEN (oi.quantity * pv.measurement) / u.conversion

									/* NORMAL PRODUCT */
									ELSE oi.quantity
								END
							) AS total_used_stock";
			
						$tables = ORDERS_ITEMS . " oi

						INNER JOIN " . ORDERS . " o
							ON o.id = oi.order_id

						INNER JOIN " . PRODUCT_VARIANTS . " pv
							ON pv.id = oi.product_variant_id
						
						INNER JOIN " . PRODUCTS . " p
							ON p.id = pv.product_id
	
						INNER JOIN " . UNITS . " u
							ON u.id = pv.stock_unit_id";
					
					$where = "WHERE
						o.active_status = :active_status
						AND oi.seller_id = :seller_id
						AND (
							(o.order_type = 'instant' 
								AND DATE(o.created_at) = :date
							) OR
							(o.order_type != 'instant' 
								AND DATE(o.from_time) = :date
							)
						) GROUP BY
							CASE
								WHEN pv.type = 'loose' THEN pv.product_id
								ELSE oi.product_variant_id
							END";
					/* ================= DATE DEFAULT ================= */

					$from_time = date('Y-m-d'); // default = today

					if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['src_type'])) {

						$src_type = $_POST['src_type'];

						if ($src_type == 'yesterday') {
							$from_time = date('Y-m-d', strtotime('-1 day'));
						} 
						elseif ($src_type == 'today') {
							$from_time = date('Y-m-d');
						} 
						elseif ($src_type == 'tomorrow') {
							$from_time = date('Y-m-d', strtotime('+1 day'));
						} 
						elseif ($src_type == 'select_date' && !empty($_POST['toDate'])) {
							$from_time = date('Y-m-d', strtotime($_POST['toDate']));
						}
					}
					$params = [
						':seller_id'=>$_SESSION['SELLER_ID'],
						':active_status'=>2,
						':date'=> $from_time
					];
					
					//echo $from_time; 
							
					$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
								
							//echo "<pre>";print_r($params);die;
							
							if(!empty($sqlQuery[0]))
							{
								$i = 0;
								$tot_count = 0;
								foreach($sqlQuery as $k=>$arr)
								{
									$measurement_arr = [
										'stock_unit_id' => $arr->stock_unit_id,
										'quantity' => 1
									];
									$measurement  = $general_cls_call->convert_measurement($measurement_arr);
									$data = [
										'product_id' => $arr->product_id,
										'product_variant_id' => $arr->product_variant_id,
										'product_type' => $arr->type
									];
									
									//echo "<pre>";print_r($data);die;
									 
									$result = $ruf->available_stock_report($data);
									
									$tot_product_stock = $result->pos_stock + $result->available_stock;
									
									$used_stock = $arr->total_used_stock;
									
									//$to_be_purchase_stock = $tot_product_stock > $used_stock ? 0 : abs($tot_product_stock - $used_stock);
									$to_be_purchase_stock = abs($result->available_stock);
									
									//$used_stock = $result->used_stock;
									
							if($to_be_purchase_stock >0)	
							{
							?>
							<tr id="dataRow<?php echo($arr->id);?>">
								<td><?PHP echo $k+1; ?></td>
								 <td><?php echo $general_cls_call->cart_product_name($arr->product_name);  ?></td>
								<td class="text-center"><?php echo $result->pos_stock ; ?></td>
								<td class="text-center"><?php echo $result->available_stock ; ?></td>
								<td class="text-center"><?php echo $tot_product_stock ; ?></td>
								<td class="text-center"><?PHP echo $to_be_purchase_stock; ?></td>
								<td class="text-center"><input type="text" class="form-control form-control-sm" value="<?PHP echo $used_stock; ?>" name="stock[]"></td>
								<td class="text-center"><?PHP echo $measurement['unit']; ?></td>
								<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?PHP echo $arr->type; ?></span></td>
								
								<input type="hidden" value="<?php echo $arr->product_variant_id ;?>" name="product_variant_id[]">
								<input type="hidden" value="<?php echo $arr->discounted_price ;?>" name="hid_purchase_price[]">
								<input type="hidden" value="<?php echo $arr->price ;?>" name="hid_price[]">
								
							</tr>
								<?PHP
									$i++;
							}
									}
								}
							?>
						</tbody>
					</table>
				</div>
				<div class="box-footer text-center">

						<button type="button" name="btnSubmit" value="SAVE" class="btn btn-grd btn-grd-success px-5 submit-purchase">Purchase Now</button>
					
                  </div>
			</form>
			</div>
		</div>

    </div>
  </main>
  <!--end main wrapper-->
  <!-- Modal -->
  <!--- Auro load modal-->
	<div class="modal fade" id="timeframeModal">
	  <div class="modal-dialog modal-dialog-centered">
		<form method="post" action="" id="timeframeModalSubmit">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2 bg-grd-primary">
			<h5 class="modal-title btn-grd">Choose</h5>
			<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
			  <i class="material-icons-outlined">close</i>
			</a>
		  </div>
		  <div class="modal-body">
				<select name="src_type" class="form-select select2-dropdown" onchange="selectdate(this.value)">
					<option value="">Select</option>
					<option value="today" <?php echo ($_POST['src_type'] == 'today' || empty($_POST)) ? 'selected' : '' ;?>>Today</option>
					<option value="tomorrow" <?php echo $_POST['src_type'] == 'tomorrow' ? 'selected' : '' ;?>>Tomorrow</option>
				</select>
		  </div>
		  <div class="modal-footer border-top-0">
			<!--<button type="button" class="btn btn-grd btn-grd-danger rounded-0"
			  data-bs-dismiss="modal">Cancel</button>-->
			  <div class="col-md-12">
				<div class="d-md-flex d-grid justify-content-md-between">
					<button type="button" class="btn btn-outline-danger px-5" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-grd btn-grd-success px-5">Choose to Search</button>
				 </div>
			  </div>
		  </div>
		</div>
		</form>
	  </div>
	</div>
	<!--- stock available modal-->
<div class="modal fade" id="purchase-qty-modal">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header border-bottom-0 py-2 bg-grd-primary">
                        <h5 class="modal-title btn-grd">Confirmation</h5>
                        <a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
                          <i class="material-icons-outlined">close</i>
                        </a>
                      </div>
                      <div class="modal-body">
						<div class="col-md-12 mb-2"><strong>Do you want to update the purchase stock? please choose stock type.</strong></div>
						<div class="col-md-12">
							<select name="stock_type" class="form-select select2-dropdown" onchange="chooseStockType(this.value)">
								<option value="2">Online</option>
								<option value="1">POS</option>
							</select>
						</div>
                      </div>
                      <div class="modal-footer border-top-0">
                        <!--<button type="button" class="btn btn-grd btn-grd-danger rounded-0"
                          data-bs-dismiss="modal">Cancel</button>-->
						  <div class="col-md-12">
							<div class="d-md-flex d-grid justify-content-md-between">
								<button type="button" class="btn btn-outline-danger px-5" data-bs-dismiss="modal">Cancel</button>
								<button type="button" class="btn btn-grd btn-grd-success px-5" onclick="purchase_now()">Puschase</button>
							 </div>
						  </div>
                      </div>
                    </div>
                  </div>
                </div>
<!--end main wrapper-->
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
<script>

$(document).ready(function () {
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}

	$('#example2').DataTable({
		paging: false
	});
	
    // Check if already submitted
    if (!localStorage.getItem("modalSubmitted")) {
        $('#timeframeModal').modal('show');
    }

    // On form submit
    $('#timeframeModalSubmit').on('submit', function () {
        localStorage.setItem("modalSubmitted", "true");
    });
});

$(document).on('click', '.submit-purchase', function(){
	$('#purchase-qty-modal').modal('show');
		
})
function purchase_now()
{
	$('#purchase-qty-modal').modal('hide');
	$('#submit_purchase').submit();
}


function assignOperator(orderId)
{
	$('#no_operator').html('');
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {
		  action: 'operatorList',
		  order_id: orderId
		},
		dataType: "json",
		success: function(response){
			var html = '<option value="">Choose...</option>';
			if (response.status == 200) {
				$.each(response.rec, function (i, r) {
					html += '<option value="'+ r.id +'"> '+ r.name +' </option>';
				});
				$('#assignModal').find('#operator_id').html(html);
				$('#assignModal').find('#order_id').val(orderId);
				$('#assignModal').modal('show');
			} else if (response.status == 400) {
				$('#assignModal').find('#operator_id').html(html);
				$('#assignModal').find('#no_operator').html(response.msg);
				$('#assignModal').modal('show');
			} else {
				$('#assignModal').find('#operator_id').html('');
				$('#assignModal').find('#no_operator').html('');
				$('#assignModal').modal('hide');
			}
		}
	});
}
$(document).on('click', '#assignOperatorSave', function (e) {
  e.preventDefault();

  let operator_id = $('#operator_id').val();
  $('#no_operator').html('');
  if(operator_id == '')
  {
	  $('#no_operator').html('<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show"><div class="text-white"><strong>Error!</strong> Please choose operator.</div><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
	  return false;
  }
  // Example data (change to your fields)
  let operatorId = $('#operator_id').val();
  let orderId    = $('#order_id').val();

  $.ajax({
    url: "<?PHP echo SITE_URL; ?>ajax",
    type: 'POST',
    data: {
      action: 'assign_operator_save',
      packaging_operator_id: operatorId,
      order_id: orderId
    },
	dataType: "json",
    beforeSend: function () {
      $('#assignOperatorSave').prop('disabled', true).text('Assigning...');
    },
    success: function (response) {
		//var result = JSON.parse(response);
		if (response.status == 200) {
			console.log(response);
			$('#msg').html(response.msg);
			$('#assignModal').find('#operator_id').html('');
			$('#assignModal').modal('hide');
			window.open(
				"<?= SITE_URL ?>print_packaging_operator_invoice?order_id=" + orderId,
				"_blank"
			);
			
			setTimeout(() => {
				window.location.reload();
			}, 2000);
		}
    },
    error: function (xhr) {
      console.log(xhr.responseText);
      alert('Something went wrong');
    },
    complete: function () {
      $('#assignOperatorSave').prop('disabled', false).text('Assign Operator');
    }
  });

});

$(document).ready(function(){
	
	<?php 
	if($auto_update == 1)
	{
	?>
		setInterval(insertPackageOperator, <?php echo $auto_time ;?>);
	<?php 
	}
	?>
});
function insertPackageOperator()
{
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {
		  action: 'auto_assign_operator'
		},
		dataType: "json",
		success: function(response){
			//alert(response);

			$.each(response, function(i, id){
				if(id !='')
				{
					window.open(
						"<?= SITE_URL ?>print_auto_packaging_operator_invoice?order_id=" + id,
						"_blank"
					);
				}
			});
		}
	});
}
function selectdate(val)
{
	if(val == 'select_date')
	{
		$('.date_div').show();
	}
	else{
		$('.date_div').hide();
	}
}
function chooseStockType(val) {
	$('#stock_type').val(val);
}



</script>
</body>
</html>
