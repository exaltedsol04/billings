let StockCart = document.getElementById("stock-cart");
let totalAmountShow = document.getElementById("total_amount_show");
/**
 * ! stockBasket to hold all the selected items
 * ? the getItem part is retrieving data from the local storage
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
	let productId = myArray[3];
	let productBarcode = myArray[4];
	let productMeasurement = myArray[5];
	let productType = myArray[6];
	let qty = 1;
	let search = stockBasket.find((x) => x.id === selectedItem);
	
	$('#product_id').val(productId);

  if (search === undefined) {
    stockBasket.push({
      id: selectedItem,
	  measurement: productMeasurement,
	  name: productBarcode+productName,
	  price: productPrice,
	  pid: productId,
      qty: parseInt(qty),
	 ptype: productType,
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
        let { id, item, qty, price, measurement, name, pid, ptype } = x;
		$('#loader').hide();
		$('#removeCart').show();
        return `<tr>
				 <td class="text-center">${index + 1}</td>
				  
				  <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
				  ${name}
				  <input type="hidden" value="${id}" name="product_variant_id[]">
				  <input type="hidden" value="${pid}" name="product_id[]">
				  </td>
				 
					<td>
					<div class="input-group quantity-group">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="decrement(${id})">−</button>
						</span>
						<input type="text" class="form-control text-center qty-input" value="${qty}" min="1" id="qty_${id}" name="qty[]">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="increment(${id})" >+</button>
						</span>
					</div>
				  </td>
					<td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${measurement}</td>
					<td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><span class="badge bg-grd-primary dash-lable">${ptype}</span></td>
				  <td class="text-center">₹ ${price}</td>	
				  <td class="text-center">₹ ${(qty * price).toFixed(2)}</td>
				  <td class="text-center">
					<i style="cursor:pointer;" onclick="removeItem(${id})" class="material-icons-outlined text-danger">close</i>
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

/**
 * ! used to increase the selected product item quantity by 1
 */

let increment = (id) => {
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
};

/**
 * ! used to decrease the selected product item quantity by 1
 */

let decrement = (id) => {
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

let removeItem = (id) => {
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
};


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
        let { id, qty, price } = x;
        //let filterData = shopItemsData.find((x) => x.id === id);
        return price * qty;
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