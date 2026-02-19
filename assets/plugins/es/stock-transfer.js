let StockCart = document.getElementById("stock-cart");
let totalAmountShow = document.getElementById("total_amount_show");
/**
 * ! stockBasket to hold all the selected items
 * ? the getItem part is retrieving stockData from the local storage
 * ? if local storage is blank, stockBasket becomes an empty array
 */

let stockBasket = JSON.parse(localStorage.getItem("stockData")) || [];

/**
 * ! used to add to cart
 */


let add_to_cart = (product) => {
	
	$("#loader").show();
	$('#err_product').text('');
	$('#product-modal').modal('hide');
	//let product = $("#product").val();
	const myArray = product.split("@@@");
	let selectedItem = parseInt(myArray[0]);
	let productPrice = myArray[1];
	let productName = myArray[2];
	let productImage = myArray[3];
	let productBarcode = myArray[4];
	let productMeasurement = myArray[5];
	let stock_unit_name = myArray[6];
	let productType = myArray[7];
	let productId = myArray[8];
	let rawmeasurement = myArray[9];
	let qty = 1;
	let search = stockBasket.find((x) => x.id === selectedItem);
	
	$('#product_id').val(productId);

  if (search === undefined) {
    stockBasket.push({
		id: selectedItem,
		measurement: productMeasurement,
		stock_unit_name: stock_unit_name,
		name: productBarcode+productName,
		price: productPrice,
		pimage: productImage,
		qty: parseInt(qty),
		ptype: productType,
		pid: productId,
		rawmeasurement: rawmeasurement,
		item: 1
    });
  } else {
    search.item += 1;
	search.qty += parseInt(qty);
  }

  //console.log(stockBasket);
  update(selectedItem);
  localStorage.setItem("stockData", JSON.stringify(stockBasket));
  setTimeout(function () {
	generateStockItems();
  }, 500);
};

/**
 * ! To calculate total amount of selected Items
 */

let calculation = () => {
  let cartIcon = document.getElementById("cartAmount");
  if(cartIcon){
	cartIcon.innerHTML = stockBasket.map((x) => x.item).reduce((x, y) => x + y, 0);
  }
};

calculation();


/**
 * ! Generates the Cart Page with product cards composed of
 * ! images, title, price, buttons, & Total price
 * ? When stockBasket is blank -> show's Cart is Empty
 */

let generateStockItems = () => {
	
  if (stockBasket.length !== 0) {
    return (StockCart.innerHTML = stockBasket
      .map((x, index) => {
        let { id, item, qty, price, measurement, stock_unit_name, name, pimage, ptype, pid, rawmeasurement} = x;
		$('#loader').hide();
		$('#removeCart').show();
		var tprice = (qty * price).toFixed(2);
		var hidMsr = measurement * qty;
		if(ptype == 'loose') {
			tprice = (qty * price).toFixed(2);
			hidMsr = (measurement * qty).toFixed(2);
		}
        return `<tr>
				 <td class="text-center">${index + 1}<input type="hidden" class="pid-${pid} allpid" value="${hidMsr}" id="vid_${id}" name="pid[${pid}][${id}]"></td>				  
				  <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
				  ${name}
				  <input type="hidden" value="${id}" name="product_variant_id[]">
				  <input type="hidden" value="${pid}" name="product_id[]">
				  </td>
				  <td class="text-center"><span class="badge bg-grd-primary dash-lable">${ptype}</span></td>
					<td>
					<div class="input-group quantity-group">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="decrement(${id}, ${measurement}, \'${ptype}\', ${pid})">−</button>
						</span>
						<input type="text" class="form-control text-center qty-input" value="${qty}" min="1" oninput="updateQty(${id}, this.value)" id="qty_${id}" name="qty[]">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="increment(${id}, ${measurement}, \'${ptype}\', ${pid})" >+</button>
						</span>
					</div>
				  </td>
					<td class="text-center">${rawmeasurement}</td>
				  <td class="text-center">₹ ${price}</td>	
				  <td class="text-center">₹ ${tprice}</td>
				  <td class="text-center">
					<i style="cursor:pointer;" onclick="removeItem(${id}, \'${ptype}\', ${pid})" class="material-icons-outlined text-danger">close</i>
				  </td>
				</tr>`;
						
						
      })
      .join(""));
  } else {
   totalAmountShow.innerHTML = "";   
   $('#removeCart, #loader').hide();
    StockCart.innerHTML = `<tr>
						  <td colspan="8" class="text-center">No Record Found.</td>
    </td></tr>`;
  }
};

generateStockItems();

function getTotalWeightByPid(pid) {
    return stockBasket
        .filter(item => item.pid == pid)
        .reduce((sum, item) => sum + (item.qty * Number(item.measurement)), 0);
}

/**
 * ! used to increase the selected product item quantity by 1
 */
let increment = (id, msr, ptype, pid) => {

    $("#loader").show();

    let selectedItem = id;
    let search = stockBasket.find(x => x.id === selectedItem);

    if (!search) {
        stockBasket.push({
            id: selectedItem,
            qty: 1,
            pid: pid,
            measurement: Number(msr)
        });
        generateStockItems();
        $("#loader").hide();
        return;
    }
	
    let inputId = 'transfer-stock-limit' + id;
	if (ptype === 'loose') {
		inputId = 'transfer-stock-limitp' + pid;
	}

    check_qty_stock(id, search.qty + 1, msr, pid, function () {

        let cart_stock_limit = $('#' + inputId).val();
        let limit = cart_stock_limit === '' ? null : Number(cart_stock_limit);

        /*
        =================================
        LOOSE PRODUCT → CHECK TOTAL WEIGHT
        =================================
        */
        if (ptype === 'loose' && limit !== null) {

            let currentWeight = getTotalWeightByPid(pid);
            let nextWeight = currentWeight + Number(msr);
			// ✅ FIX FLOATING PRECISION
			nextWeight = Number(nextWeight.toFixed(3));
			limit = Number(limit.toFixed(3));
            // ❌ block only if truly exceeding
			if (nextWeight > limit) {
                $('#dataRow' + id).find('.qty-increment').prop('disabled', true);
                $("#loader").hide();
                return;
            }
        }

        /*
        =================================
        NORMAL PRODUCT → CHECK QTY LIMIT
        =================================
        */
        if (ptype !== 'loose' && limit !== null) {

            if (search.qty >= limit) {
                $('#dataRow' + id).find('.qty-increment').prop('disabled', true);
                $("#loader").hide();
                return;
            }
        }

        /*
        =================================
        SAFE TO INCREMENT
        =================================
        */
        search.qty += 1;

        update(selectedItem);
        localStorage.setItem("stockData", JSON.stringify(stockBasket));

        generateStockItems();
        $("#loader").hide();
    });
};

/*let increment = (id) => {
	$("#loader").show();
	let selectedItem = id;
	let search = stockBasket.find((x) => x.id === selectedItem);

	if (search === undefined) {
		stockBasket.push({
		  id: selectedItem,
		  qty: 1,
		});
	} else {
		let inputId = 'transfer-stock-limit' + id;
		// 2. Call stock check
		check_qty_stock(id, search.qty + 1);
		// 3. Read value AFTER stock check
		let cart_stock_limit = $('#' + inputId).val();
		//alert(cart_stock_limit);
		// 4. Apply logic
		if (cart_stock_limit !== '') {
			$('.qty-input' + id).val(cart_stock_limit);
			$('#dataRow' + id).find('.qty-increment').prop('disabled', true);
		}
		else if (search.qty <= cart_stock_limit || cart_stock_limit==='') {
			// only increment if input was NOT just created
			if(cart_stock_limit==='') {
				search.qty += 1;
				update(selectedItem);
				localStorage.setItem("stockData", JSON.stringify(stockBasket));
			}
		}
	}
	setTimeout(function () {
		generateStockItems();
	}, 500);
};*/

/**
 * ! used to decrease the selected product item quantity by 1
 */
let decrement = (id, msr, ptype, pid) => {

    $("#loader").show();

    let selectedItem = id;
    let search = stockBasket.find(x => x.id === selectedItem);

    if (!search || search.qty === 0) {
        $("#loader").hide();
        return;
    }

    search.qty -= 1;

    $('#dataRow' + id).find('.qty-increment').prop('disabled', false);

    let inputId = 'transfer-stock-limit' + id;
	if (ptype === 'loose') {
		inputId = 'transfer-stock-limitp' + pid;
	}
    let pId = 'transfer-pid-' + pid;

    if (ptype === 'loose') {
		let totalWeight = getTotalWeightByPid(pid);
		localStorage.setItem(pId + '-value', totalWeight);
	} else {
		localStorage.setItem(inputId + '-value', '');
	}


    if (search.qty === 0) {
        $('#qty-total').find('#' + inputId).remove();
    }

    update(selectedItem);

    stockBasket = stockBasket.filter(x => x.qty !== 0);
    localStorage.setItem("stockData", JSON.stringify(stockBasket));

    $('#check-stock-pay-div').html('');

    setTimeout(function () {
        generateStockItems();
        $("#loader").hide();
    }, 300);
};
/*let decrement = (id) => {
	$("#loader").show();
	let selectedItem = id;
	let search = stockBasket.find((x) => x.id === selectedItem);

	if (search === undefined) return;
	else if (search.qty === 0) return;
	else {
		search.qty -= 1;
		$('#dataRow' + id).find('.qty-increment').prop('disabled', false);
		let inputId = 'transfer-stock-limit' + id;
		$('#' + inputId).val('')
		localStorage.setItem(inputId + '-value', '');
		if (search.qty == 0) {
			$('#qty-total').find('#' + inputId).remove();
		}
	}
	update(selectedItem);
	stockBasket = stockBasket.filter((x) => x.qty !== 0);
	localStorage.setItem("stockData", JSON.stringify(stockBasket));
	setTimeout(function () {
		generateStockItems();
	}, 500);
};*/

/**
 * ! used to update the selected product item quantity by value
 */

let updateQty = (id, value) => {
  let qty = parseInt(value);

  // Prevent empty, zero, or negative values
  if (isNaN(qty) || qty < 1) {
    qty = 1;
    document.getElementById(`qty_${id}`).value = 1;
  }

  let search = stockBasket.find((x) => x.id === id);
  if (!search) return;

  search.qty = qty;
  search.item = qty; // keep item count in sync
	
  localStorage.setItem("stockData", JSON.stringify(stockBasket));

  calculation();
  TotalAmount();
  
  setTimeout(function () {
	generateStockItems();
  }, 500);
};

/**
 * ! To update the digits of picked items on each item card
 */

let update = (id) => {
  let search = stockBasket.find((x) => x.id === id);
  
  //console.log(id, search.qty);
  
  //document.getElementById('qty_'+id).innerHTML = search.qty;
  $('#qty_'+id).val(search.qty);
  calculation();
  TotalAmount();
};

/**
 * ! Used to remove 1 selected product card from stockBasket
 * ! using the X [cross] button
 */

let removeItem = (id, ptype, pid) => {
	$("#loader").show();
	let selectedItem = id;
	stockBasket = stockBasket.filter((x) => x.id !== selectedItem);
	calculation();
	setTimeout(function () {
		generateStockItems();
	}, 500);
	let inputId = 'transfer-stock-limit' + id;
	if(ptype == 'loose') {
		inputId = 'transfer-stock-limitp' + pid;
	}
	localStorage.setItem(inputId + '-value', '');
	//localStorage.setItem(inputId + '-pid', '');
	$('#qty-total').find('#' + inputId).remove();
	TotalAmount();
	localStorage.setItem("stockData", JSON.stringify(stockBasket));
};

/*let removeItem = (id) => {
	$("#loader").show();
	let selectedItem = id;
	stockBasket = stockBasket.filter((x) => x.id !== selectedItem);
	calculation();
	setTimeout(function () {
		generateStockItems();
	}, 500);
	let inputId = 'transfer-stock-limit' + id;
	localStorage.setItem(inputId + '-value', '');
	$('#qty-total').find('#' + inputId).remove();
	TotalAmount();
	localStorage.setItem("stockData", JSON.stringify(stockBasket));
};*/


/**
 * ! Used to calculate total amount of the selected Products
 * ! with specific quantity
 * ? When stockBasket is blank, it will show nothing
 */

let TotalAmount = () => {
  
  $('.submit-stock-transfer').hide();
  
  if (stockBasket.length !== 0) {
	  $('.submit-stock-transfer').show();
	 
    let amount = stockBasket
      .map((x) => {
        let { id, qty, measurement, ptype, price } = x;
        //let filterData = shopItemsData.find((x) => x.id === id);
		var tprice = price * qty;
		if(ptype == 'loose') {
			tprice = price * qty;
		}
        return tprice;
      })
      .reduce((x, y) => x + y, 0);

    return (totalAmountShow.innerHTML = `<tr>
						  <td colspan="6">Sum</td>
						  <td id="cartAmount" class="cartAmount text-center">₹ ${amount.toFixed(2)}</td>
						</tr>`);
  } else return;
};

TotalAmount();

/**
 * ! Used to clear cart, and remove everything from local storage
 */

let clearCart = () => {
	$("#loader").show();
	$('.submit-stock-transfer').hide();
	$('#show-stock-div').hide();
	stockBasket = [];
	setTimeout(function () {
		generateStockItems();
	}, 500);
	$('#qty-total').html('');
	// reset related localStorage
	Object.keys(localStorage).forEach(key => {
	  if (key.startsWith('transfer-stock-limit')) {
		localStorage.removeItem(key);
	  }
	});
	calculation();
	localStorage.setItem("stockData", JSON.stringify(stockBasket));
  
};