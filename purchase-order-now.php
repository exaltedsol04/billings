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
error_reporting(1);
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
			$purchase_order_id = $ruf->generate_order_id(PRODUCT_STOCK_TRANSACTION, 'purchase_order_id');
			foreach($product_variant_id as $k=>$val) {
				
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $val), 1);
				//echo "<pre>";print_r($product_variant_dtls);die;
				$product_id = $product_variant_dtls->product_id;
				
				$whereCheck = "WHERE seller_id=:seller_id AND status=:status AND  transaction_type=:transaction_type AND product_id=:product_id AND product_variant_id=:product_variant_id";
				$paramCheck = [
					':seller_id' => $_SESSION['SELLER_ID'],
					':status' => 0,
					':transaction_type' => 7,
					':product_id' => $product_id,
					':product_variant_id' => $val
				];
				$count_record = $general_cls_call->select_query_count(PRODUCT_STOCK_TRANSACTION, $whereCheck, $paramCheck);
				if($count_record == 0)
				{					
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
					
					
					$field = "purchase_order_id, seller_id, product_variant_id, product_id, loose_stock_quantity, stock, stock_type, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id,approved_by, approved_date, order_id, remarks";
					$value = ":purchase_order_id, :seller_id, :product_variant_id, :product_id, :loose_stock_quantity, :stock, :stock_type, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id, :remarks";
					
					$addExecute=array(
						':purchase_order_id'	=> $purchase_order_id,
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
				}
			}
			
			
			
			header("Location: ".SITE_URL.'purchase-order-now?m=1');
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
							<th class="text-center">Order stock</th>
							<th class="text-center">Pos stock</th>
							<th class="text-center">Online available stock</th>
							<th>Total available stock</th>
							<th>To be purchase</th>
							<th>Approve status</th>
							<th>Measurement</th>
							<th>Type</th>
							
						  </tr>
						</thead>
						<tbody>
						<?php
						
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
					

					/*$where = "WHERE
							DATE(o.created_at) = CURDATE()
							AND o.active_status = :active_status
							AND oi.seller_id = :seller_id*/
						$where = "WHERE
							o.active_status = :active_status
							AND oi.seller_id = :seller_id
							
						GROUP BY
							CASE
								WHEN pv.type = 'loose' THEN pv.product_id
								ELSE oi.product_variant_id
							END";


					$params = [
						':seller_id'=>$_SESSION['SELLER_ID'],
						':active_status'=>2
					];
							
							$sqlQuery = $general_cls_call->select_join_query($fields, $tables, $where, $params, 2);
								
							//echo "<pre>";print_r($sqlQuery);die;
							
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
								$approve_status = '';
								$loose_stock_quantity = '';
								$stocks  = '';
								
								$fields = "loose_stock_quantity, stock";
								$whereCheck = "WHERE seller_id=:seller_id AND status=:status AND  transaction_type=:transaction_type AND product_id=:product_id AND product_variant_id=:product_variant_id";
								$paramCheck = [
									':seller_id' => $_SESSION['SELLER_ID'],
									':status' => 0,
									':transaction_type' => 7,
									':product_id' => $arr->product_id,
									':product_variant_id' => $arr->product_variant_id
								];
								
								$count_record = $general_cls_call->select_query($fields, PRODUCT_STOCK_TRANSACTION, $whereCheck, $paramCheck, 1);
								
								
								//echo "<pre>";print_r($count_record);die;
								//$count_record = $general_cls_call->select_query_count(PRODUCT_STOCK_TRANSACTION, $whereCheck, $paramCheck);
								//echo $count_record;die;
								if(!empty($count_record))
								{
									$approve_status = 'Pending';
									$loose_stock_quantity = $count_record->loose_stock_quantity;
									$stocks = $count_record->stock;
									
									if($arr->type == 'loose') {
										$to_be_purchase_stock = $loose_stock_quantity;
									}else{
										$to_be_purchase_stock = $stocks;
									}
									
									$tot_count++;
								}
							?>
							<tr id="dataRow<?php echo($arr->id);?>">
								<td><?PHP echo $k+1; ?></td>
								 <td><?php echo $general_cls_call->cart_product_name($arr->product_name);  ?></td>
								<td class="text-center"><?PHP echo $used_stock; ?></td>
								<td class="text-center"><?php echo $result->pos_stock ; ?></td>
								<td class="text-center"><?php echo $result->available_stock ; ?></td>
								<td class="text-center"><?php echo $tot_product_stock ; ?></td>
								<td class="text-center"><input type="text" class="form-control form-control-sm" value="<?PHP echo $to_be_purchase_stock; ?>" name="stock[]" <?php echo $count_record == 1 ? 'readonly' : ''; ?>></td>
								<td><span class="badge bg-grd-voilet"><?php echo $approve_status; ?></span></td>
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
					
					<?php 
					if($tot_count != $i)
					{
					?>
						<button type="button" name="btnSubmit" value="SAVE" class="btn btn-grd btn-grd-success px-5 submit-purchase">Submit purchase</button>
					<?php 
					}
					?>
					
                  </div>
			</form>
			</div>
		</div>

    </div>
  </main>
  <!--end main wrapper-->
  <!-- Modal -->
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
function chooseStockType(val) {
	$('#stock_type').val(val);
}
</script>
</body>
</html>
