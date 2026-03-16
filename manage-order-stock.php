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
		<div class="card">
			<div class="card-body">
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
								
							</tr>
						  <tr>
							<th style="width:100px">Sr. no</th>
							<th>product name</th>
							<th class="text-center">Order stock</th>
							<th class="text-center">Pos stock</th>
							<th class="text-center">Online available stock</th>
							<th>Total available stock</th>
							<th>To be purchase</th>
							<th>Measurement</th>
							<th>Type</th>
							
						  </tr>
						</thead>
						<tbody>
						<?php
						
						$fields = "o.id, oi.product_variant_id,
							p.id AS product_id,
							p.name AS product_name,
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
							DATE(o.created_at) = CURDATE()
							AND o.active_status = :active_status
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
								$i = 1;
								
								foreach($sqlQuery as $k=>$arr)
								{
																			
									 //$product_variant_details = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id=:id", array(':id'=>$arr->product_variant_id), 1);
									 
									 
									$fields = "pv.id as product_variant_id, pv.product_id, pv.type, pv.stock, pv.measurement, pv.discounted_price , u.name as unit_name";
									$tables = PRODUCT_VARIANTS . " pv
									INNER JOIN " . UNITS . " u ON u.id = pv.stock_unit_id";
									$where = "WHERE  pv.id=:id";
									$params = [
										'id' => $arr->product_variant_id
									];
									$product_variant_details = $general_cls_call->select_join_query($fields, $tables, $where, $params, 1);
									
									 
									 /*$variant_type = $product_variant_details->type;
									 $product_id  = $product_variant_details->product_id;
									 $product_variant_id = $arr->product_variant_id;*/
									//echo "<pre>";print_r($product_variant_details);die;
									 
									$data = [
										'product_id' => $product_variant_details->product_id,
										'product_variant_id' => $arr->product_variant_id,
										'product_type' => $product_variant_details->type
									];
									
									//echo "<pre>";print_r($data);die;
									 
									$result = $ruf->available_stock_report($data);
									 
									 
									 $order_qty = $general_cls_call->select_query("sum(quantity) as tot_qty", ORDERS_ITEMS, "WHERE id=:id", array(':id'=>$arr->product_variant_id), 1);
									
									$tot_product_stock = $result->pos_stock + $result->available_stock;
									
									$used_stock = $arr->total_used_stock;
									
									$to_be_purchase_stock = $tot_product_stock > $used_stock ? 0 : abs($tot_product_stock - $used_stock);
									//$to_be_purchase_stock = abs($used_stock - $tot_product_stock);
									
									//$used_stock = $result->used_stock;
									
									
							?>
							<tr id="dataRow<?php echo($arr->id);?>">
								<td><?PHP echo $k+1; ?></td>
								 <td><?php echo $general_cls_call->cart_product_name($arr->product_name).'  ('.$arr->product_variant_id.')';  ?></td>
								<td class="text-center"><?PHP echo $used_stock; ?></td>
								<td class="text-center"><?php echo $result->pos_stock ; ?></td>
								<td class="text-center"><?php echo $result->available_stock ; ?></td>
								<td class="text-center"><?php echo $tot_product_stock ; ?></td>
								<td class="text-center"><?PHP echo $to_be_purchase_stock; ?></td>
								<td class="text-center"><?PHP echo $product_variant_details->unit_name; ?></td>
								<td class="text-center"><span class="badge bg-grd-primary dash-lable"><?PHP echo $product_variant_details->type; ?></span></td>
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
  <!--end main wrapper-->
  <!-- Modal -->
	<div class="modal fade" id="assignModal">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2 bg-grd-info">
			<h5 class="modal-title btn-grd">Assign Packaging Operator</h5>
			<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
			  <i class="material-icons-outlined">close</i>
			</a>
		  </div>
		  <div class="modal-body">
			<div class="form-body">
			  <form name="frm" action="" method="post" class="row g-3">
				<div class="col-md-12">
				  <label for="operator_id" class="form-label">Choose operator</label>
				  <select id="operator_id" class="form-select select2-dropdown mx-auto">
				  </select>
				</div>
				<div class="col-md-12" id="no_operator"></div>
				<div class="col-md-12">
				  <div class="d-md-flex d-grid justify-content-md-between">
					<input type="hidden" id="order_id" name="order_id">
					
					<button type="reset" class="btn btn-grd btn-grd-info px-4">Reset</button>
					<button type="button" id="assignOperatorSave" class="btn btn-grd btn-grd-danger px-4">Assign Operator</button>
				  </div>
				</div>
			  </form>
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

/*$(document).ready(function () {
    setTimeout(function () {
		$(".table-responsive").load(location.href + " .table-responsive>*");
    }, 5000);
});*/
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
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}
	
	/*$('#example2').DataTable({
		order: [[4, 'asc']],
		columnDefs: [
        {
            targets: 0,      
            orderable: true,  
            orderSequence: ['asc', 'desc'] 
        }
    ]
	});*/
	
	/*function loadTable() {
        $(".table-responsive").load(location.href + " .table-responsive>*", function () {

            $('#example2').DataTable({
                destroy: true,
				pageLength: 50,
                order: [[4, 'asc']],
                columnDefs: [{
                    targets: 0,
                    orderable: true,
                    orderSequence: ['asc', 'desc']
                }]
            });

        });
    }*/

    //loadTable(); 

    setInterval(loadTable, 1000);
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




</script>
</body>
</html>
