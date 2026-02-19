<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();

	if($_SERVER['REQUEST_METHOD'] == "POST")
	{	
		extract($_POST);
		//echo "<pre>";print_r($_POST);die;
		if(!empty($product_variant_id))
		{
			foreach($product_variant_id as $k=>$val) {
				
				$product_variant_dtls = $general_cls_call->select_query("*", PRODUCT_VARIANTS, "WHERE id =:id ", array(':id'=> $val), 1);
				//echo "<pre>";print_r($product_variant_dtls);die;
				$product_id = $product_variant_dtls->product_id;
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
				
				
				$field = "seller_id, product_variant_id, product_id, loose_stock_quantity, stock, created_date, status, selling_price, purchase_price, transaction_type, received_selled_id, parent_id,approved_by, approved_date, order_id";
				$value = ":seller_id, :product_variant_id, :product_id, :loose_stock_quantity, :stock, :created_date, :status, :selling_price, :purchase_price, :transaction_type, :received_selled_id, :parent_id, :approved_by, :approved_date, :order_id";
				
				$addExecute=array(
					':seller_id'			=> $_SESSION['SELLER_ID'],
					':product_variant_id'	=> $general_cls_call->specialhtmlremover($val),
					':product_id'			=> $general_cls_call->specialhtmlremover($product_id),
					':loose_stock_quantity'			=> $general_cls_call->specialhtmlremover($loose_stock_quantity),
					':stock'				=> $stock_qty,
					':created_date'			=> date("Y-m-d H:i:s"),
					':status'				=> 0,
					':selling_price'		=> $general_cls_call->specialhtmlremover($purchase_price[$k]),
					':purchase_price'		=> $general_cls_call->specialhtmlremover($hid_price[$k]),
					':transaction_type'		=> 1,
					':received_selled_id'	=> 0,
					':parent_id'			=> 0,
					':approved_by'			=> 0,
					':approved_date'		=> '0000-00-00 00:00:00',
					':order_id'		       => 0,
				);
				
				$general_cls_call->insert_query(PRODUCT_STOCK_TRANSACTION, $field, $value, $addExecute);
				
				$sucMsg="Data has been submitted successfully";
				$_SESSION['call_js'] = true;
			}
			
		}
		else
		{
			$erMsg = "Please choose product.";
		}
		
	}


	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
	<!-- ######### MENU START ############### -->
		<?PHP include_once("includes/sellerMenu.php"); ?>
	<!-- ######### MENU END ############### -->

<main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
		<div class="row">
           <div class="col-12 col-xl-12">
            <div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
				<div class="card-body p-4">
					<div class="d-flex align-items-start justify-content-between mb-3">
					  <div class="">
						<h5 class="mb-0 fw-bold">Add Multiple Request</h5>
					  </div>
					  
					</div>
					<?PHP
						if(isset($erMsg) && $erMsg != '')
						{
					?>
						<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong><?PHP echo $Error_mesg; ?></strong> <?PHP echo $erMsg; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
						if(isset($sucMsg) && $sucMsg != '')
						{
					?>
						<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
							<div class="text-white"><strong>Success</strong> <?PHP echo $sucMsg; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
					?>
						
					<form class="row g-4" action="" method="post" id="save_stock">
						<div id="rows-wrapper">
							
							<div class="row item-row mt-2">

								<div class="col-md-5">
								<label for="input1" class="form-label">Products</label>
									<select name="product[]" class="form-select form-select-sm select2-dropdown"  tabindex="1" onchange="select_product(this)">
										<option value="">Select product</option>
										<?PHP
										$fields = "
											pv.id,
											pv.product_id,
											pv.type,
											pv.stock,
											pv.measurement,
											pv.discounted_price,
											pv.stock_unit_id,
											p.name,
											p.image,
											p.barcode,
											u.name as unit_name
										";

										$tables = PRODUCT_VARIANTS . " pv
										INNER JOIN " . PRODUCTS . " p 
											ON p.id = pv.product_id
										INNER JOIN " . UNITS . " u 
											ON u.id = pv.stock_unit_id

										/* pick only ONE loose variant per product */
										LEFT JOIN (
											SELECT product_id, MIN(id) AS keep_variant_id
											FROM " . PRODUCT_VARIANTS . "
											WHERE type = 'loose'
											GROUP BY product_id
										) loose_pick 
											ON loose_pick.keep_variant_id = pv.id
										";

										$where = "
										WHERE
										(
												pv.type != 'loose'
											 OR loose_pick.keep_variant_id IS NOT NULL
										)
										ORDER BY p.name
										";

										$params = [];

										$sqlQuery = $general_cls_call->select_join_query(
											$fields,
											$tables,
											$where,
											$params,
											2
										);
										//echo "<pre>"; print_r($sqlQuery);die;
										if($sqlQuery[0] != '')
										{
											foreach($sqlQuery as $arr)
											{	
												$barcode = $arr->barcode;
												$barcode = !empty($barcode) ?  '(' . $barcode .') ' : '';
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
												<option value="<?PHP echo $arr->product_id.'@@@'.$general_cls_call->cart_product_name($arr->name).'@@@'.$arr->id.'@@@'.$arr->type; ?>" <?php echo ($_POST['product'] == $arr->id.'@@@'.$general_cls_call->cart_product_name($arr->name)) ? 'selected' : '' ?>><?PHP echo $barcode.' '.$general_cls_call->cart_product_name($arr->name); ?> (<?PHP echo $arr->type == 'loose' ? $unitname : $arr->measurement.' '.$unitname; ?> - <?php echo $arr->type; ?>)</option>
									<?PHP
											}
										}
									?>
									</select>
									<span class="error_product text-danger"></span>
								</div>

								<div class="col-md-2">
									<label for="input5" class="form-label">Stock Quantity</label>
									<input type="text" class="form-control form-control-sm stock-input" name="stock[]" id="stock" placeholder="Stock quantity" oninput="">
									<span class="text-danger err_stock"></span>
								</div>

								<!--<div class="col-md-2">
									<label for="input5" class="form-label">Unit</label>
									<select name="product_variant_id[]" class="form-select form-select-sm select2-dropdown unit-select" tabindex="1" onchange="get_selling_price(this)">
										<option value="">Select...</option>
									</select>
									<span class="text-danger err_unit"></span>
								</div>-->
								
								<div class="col-md-2 purchase-div">
									<label for="input5" class="form-label">Purchase price</label>
									<input type="text" style="border:0" class="form-control form-control-sm purchase_price" name="purchase_price[]" placeholder="₹ 0.00" readonly>
									<input type="hidden" class="hid_purchase_price">
									<input type="hidden" class="hid_price" name="hid_price[]">
									<input type="hidden" class="product_variant_id" name="product_variant_id[]">
									<span id="selling_price_div" class="w-100 selling_price_div error_purchase text-danger"></span>
								</div>
								
								<div class="col-md-2">
									<label for="input5" class="form-label">Total price</label>
									<input type="text" style="border:0" name="total_price[]" placeholder="₹ 0.00" class="form-control form-control-sm total_price" readonly>
									<span class="text-danger" id="err_stock"></span>
								</div>

								<div class="col-md-1 text-right">
									<button type="button" class="btn btn-sm btn-danger removeRow mt-4">X</button>
								</div>

							</div>

						</div>
						<hr>
						<div class="row mb-0 mt-0">
						<div class="col-md-12">
							<div class="d-md-flex d-grid justify-content-md-between">
								<button type="button" id="addMore" class="btn btn-primary">+ Add More</button>
								<button type="button" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success save-purchase-stock">Request Stock</button>
							</div>
						</div>
						</div>
						
					</form>
						<!----END-------->
				</div>
            </div>
           </div> 
           
        </div><!--end row-->
    </div>
  </main>

	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->



  </body>
</html>
<script>

$(document).ready(function () {
	initSelect2($('.item-row'));
});

//function select_product(product)
function select_product(el)
{
	//$('#selling_price_div').html('');
	//$('.purchase-div').hide();
	$('.selling-div').hide();
	
	let row = $(el).closest('.item-row'); // current row
	let product = $(el).val();
	let stockInput = row.find('.stock-input');
	stockInput.val('');
	
	const myArray = product.split("@@@");
	let pid = parseInt(myArray[0]);
	let vid = parseInt(myArray[2]);
	let ptype = myArray[3];
	//data: {action:'getRequestSellingPrice', val:val},
	//var datapost = 'action=getMaxProductVariant&pid='+pid+'&vid='+vid;
	var datapost = 'action=getRequestSellingPrice&val='+vid;
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: datapost,
		dataType: "json",
		success: function(response){
			if(ptype == 'loose')
			{
				//alert(variants.ptype);
				stockInput.off('input').on('input', function () {
					this.value = this.value
						.replace(/[^0-9.]/g, '')   // allow dot
						.replace(/(\..*)\./g, '$1'); // only one dot
				});
			}
			else{
				stockInput.off('input').on('input', function(){
					this.value = this.value
						.replace(/[^0-9]/g, '')   // allow dot
						.replace(/(\..*)\./g, '$1'); // allow only one dot
				});
			}
		
			$('#selling_price').val(response.discount_price);
			$('.purchase-div').show();
			$('.selling-div').show();
			var html = '<div class="text-left;"><span class="fw-bold" style="color:#A300A3; font-size:20px;">Selling price:</span><span style="color:#A300A3; font-size:20px;"> ₹ ' + response.discount_price + '</span></div>';
			 
			 row.find('.product_variant_id').val(vid);
			 row.find('.purchase_price').val('₹ ' + response.discount_price);
			 row.find('.hid_purchase_price').val(response.discount_price);
			 row.find('.hid_price').val(response.price);
		}
		/*success: function(response){
			var result = JSON.parse(response);
			if (result.length > 0) {
				var html = '<option value="">Select...</option>';
				$.each(result, function (i, variants) {
					html += '<option value='+ variants.id +'>' + variants.unitname + ' (' + variants.ptype + ')</option>';
					
					if(variants.ptype == 'loose')
					{
						//alert(variants.ptype);
						stockInput.off('input').on('input', function () {
							this.value = this.value
								.replace(/[^0-9.]/g, '')   // allow dot
								.replace(/(\..*)\./g, '$1'); // only one dot
						});
					}
					else{
						stockInput.off('input').on('input', function(){
							this.value = this.value
								.replace(/[^0-9]/g, '')   // allow dot
								.replace(/(\..*)\./g, '$1'); // allow only one dot
						});
					}
					
				});
				//$('#product_variant_id').html(html);
				row.find('.unit-select').html(html);
			}
		}*/
	});
}
function get_selling_price(el)
{
	
	let row = $(el).closest('.item-row');
	let val = $(el).val();
	$.ajax({
		type: "POST",
		url: "<?PHP echo SITE_URL; ?>ajax",
		data: {action:'getRequestSellingPrice', val:val},
		dataType: "json",
		success: function(response){
			//alert(response.status);alert(response.discount_price);
			$('#selling_price').val(response.discount_price);
			$('.purchase-div').show();
			$('.selling-div').show();
			var html = '<div class="text-left;"><span class="fw-bold" style="color:#A300A3; font-size:20px;">Selling price:</span><span style="color:#A300A3; font-size:20px;"> ₹ ' + response.discount_price + '</span></div>';
			 
			 row.find('.purchase_price').val('₹ ' + response.discount_price);
			 row.find('.hid_purchase_price').val(response.discount_price);
			 row.find('.hid_price').val(response.price);
		}
	});
}

$(document).on('input', '.stock-input', function () {
	let row = $(this).closest('.item-row');
    row.find('.selling_price_div').html('');

    let max = parseFloat(row.find('.hid_purchase_price').val()) || 0;
	let value = this.value;
	let tot_price = this.value*max;
	tot_price = '₹ ' + tot_price.toFixed(2)
	row.find('.total_price').val(tot_price);
});


$(document).on('input', '.purchase_price', function () {

    let row = $(this).closest('.item-row');
    row.find('.selling_price_div').html('');

    let max = parseFloat(row.find('.hid_purchase_price').val()) || 0;

    let value = this.value;

    // allow only numbers + decimal
    value = value.replace(/[^0-9.]/g, '');

    // prevent multiple decimals
    value = value.replace(/(\..*?)\..*/g, '$1');

    // limit 2 digits after decimal
    if (value.includes('.')) {
        let parts = value.split('.');
        parts[1] = parts[1].substring(0, 2);
        value = parts.join('.');
    }

    let num = parseFloat(value);

    // max check
    if (!isNaN(num) && num > max) {
        value = max.toFixed(2);
        row.find('.selling_price_div')
            .html('<div class="text-danger">Selling price not exceed: ₹' + max.toFixed(2) + '</div>');
    }

    this.value = value;
});
/*$(document).on('input', '.purchase_price', function () {
	let row = $(this).closest('.item-row');
	row.find('.selling_price_div').html('');
	let max = row.find('.hid_purchase_price').val();
    this.value = this.value.replace(/[^0-9.]/g, '');
	let val = parseFloat(this.value);
	if (val > max) {
        this.value = max;
		row.find('.selling_price_div').html('<div class="text-danger">Selling price not exceed: ₹' + max + '</div>');
    }
});*/


$('#addMore').click(function () {
	let firstRow = $('.item-row:first');

    // destroy select2 before clone
    firstRow.find('select').select2('destroy');

    let newRow = firstRow.clone();

    newRow.find('input, textarea').val('');
    newRow.find('select').val(null);
    newRow.find('.selling_price_div').html('');
    newRow.find('.is-invalid').removeClass('is-invalid');

    $('#rows-wrapper').append(newRow);

    // init select2 again (only rows)
    initSelect2($('.item-row'));
});

$('#addMoreSSSS').click(function () {
	
    let newRow = $('.item-row:first').clone();

    newRow.find('input').val('');
    newRow.find('select').val('');
	
	newRow.find('.selling_price_div').html('');
	
	newRow.find('input, select, textarea').removeClass('is-invalid');
	
	$('#rows-wrapper').append(newRow);
	
	initSelect2($('.item-row'));
});

$(document).on('click', '.removeRow', function () {
    if ($('.item-row').length > 1) {
        $(this).closest('.item-row').remove();
    }
});  

$(document).on('click', '.save-purchase-stock', function (e) {
	e.preventDefault();
	let isValid = true;
    let firstError = null;
	let vendor_id =  $('#vendor_id').val();
	if(vendor_id == '')
	{
		$('html, body').animate({
             scrollTop: $('#vendor_id').offset().top - 100
        }, 400);

        $('#vendor_id').focus();
		$('.err_vendor').html('<span>Select vendor</span>');
		return false;
	}

    $('.item-row').each(function () {

        let row = $(this);
		row.find('.selling_price_div').html('');
        // fields to validate inside this row 
        let inputs = row.find('select[name="product[]"], input[name="stock[]"], select[name="product_variant_id[]"], input[name="purchase_price[]"]');

       inputs.each(function () {

			let field = $(this);
			let value = $.trim(field.val());

			if (value === '' || value == null) {

				if (field.is('select')) {

					// ⭐ correct select2 highlight
					field.data('select2').$container
						.find('.select2-selection')
						.addClass('is-invalid');

				} else {

					field.addClass('is-invalid');
				}

				if (!firstError) firstError = field;
				isValid = false;

			} else {

				if (field.is('select')) {

					field.data('select2').$container
						.find('.select2-selection')
						.removeClass('is-invalid');

				} else {

					field.removeClass('is-invalid');
				}
			}
		});

    });

   
    if (!isValid) {

        $('html, body').animate({
            scrollTop: firstError.offset().top - 120
        }, 400);

        firstError.focus();

        return;
    }

   $('#save_stock')[0].submit();
    
});
$(document).on('change', 'select', function () {
    let field = $(this);

    if (field.val()) {
        if (field.data('select2')) {
            field.data('select2').$container
                .find('.select2-selection')
                .removeClass('is-invalid');
        }
    }
});

function initSelect2(rows) {
    rows.find('select:not(.normal)').each(function () {
        $(this).select2({
            width: '100%',
			theme: 'bootstrap-5',
            minimumResultsForSearch: 0,
            dropdownParent: $(this).closest('.item-row') // ⭐ KEY FIX
        });
    });
}
</script>
