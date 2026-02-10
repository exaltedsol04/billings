let ShoppingCart = document.getElementById("shopping-cart");
let totalAmountShow = document.getElementById("total_amount_show");
/**
 * ! Basket to hold all the selected items
 * ? the getItem part is retrieving data from the local storage
 * ? if local storage is blank, basket becomes an empty array
 */

let basket = JSON.parse(localStorage.getItem("data")) || [];

$(document).on("keydown", ".qty-input", function (e) {
  if (e.key === "-" || e.key === "e") {
    e.preventDefault();
  }
});

/**
 * ! used to add to cart
 */

//let add_to_cart = () => {
function add_to_cart(product) {	
	$("#loader").show();
	$('#err_empty_cart').text('');
	$('#product-modal').modal('hide');
	const myArray = product.split("@@@");
	let selectedItem = parseInt(myArray[0]);
	let productPrice = myArray[1];
	let productName = myArray[2];
	let productImage = myArray[3];
	let productBarcode = myArray[4];
	let productMeasurement = myArray[5];
	let productType = myArray[6];
	let qty = 1;
	let search = basket.find((x) => x.id === selectedItem);

  if (search === undefined) {
    basket.push({
      id: selectedItem,
      measurement: productMeasurement,
	  name: productBarcode+productName,
	  price: productPrice,
	  pimage: productImage,
      qty: parseInt(qty),
	  ptype: productType,
	  item: 1
    });
  } else {
    search.item += 1;
	search.qty += parseInt(qty);
  }

  //console.log(basket);
  update(selectedItem);
  localStorage.setItem("data", JSON.stringify(basket));
  setTimeout(function () {
	generateCartItems();
  }, 500);
};

/**
 * ! To calculate total amount of selected Items
 */

let calculation = () => {
  let cartIcon = document.getElementById("cartAmount");
  if(cartIcon){
	cartIcon.innerHTML = basket.map((x) => x.item).reduce((x, y) => x + y, 0);
  }
};

calculation();


/**
 * ! Generates the Cart Page with product cards composed of
 * ! images, title, price, buttons, & Total price
 * ? When basket is blank -> show's Cart is Empty
 */

let generateCartItems = () => {
  if (basket.length !== 0) {
    return (ShoppingCart.innerHTML = basket
      .map((x, index) => {
        let { id, item, qty, price, measurement, name, pimage, ptype} = x;
		$('#loader').hide();
		let progress = 0;
		$('#removeCart').show();
        return `<tr id="dataRow${id}">
					<td class="text-center">${index + 1}</td>
					<td>
					<div class="input-group quantity-group">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="decrement(${id})">−</button>
						</span>
						<input type="number" class="form-control text-center qty-input${id}" value="${qty}" min="1" oninput="updateQty(${id}, this.value)" id="qty_${id}" name="qty[]">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty qty-increment" style="cursor:pointer" onclick="increment(${id})" >+</button>
						</span>
					</div>
				  </td>
				  <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${measurement}</td>
				  <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><span class="badge bg-grd-primary dash-lable">${ptype}</span></td>
				  <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${name}</td>
				  <input type="hidden" value="${id}" name="product_variant_id[]">
				  <td class="text-center">₹ ${price}</td>						  
				  <td class="text-center">₹ ${(qty * price).toFixed(2)}</td>
				  <td class="text-center"><i style="cursor:pointer;" onclick="removeItem(${id})" class="material-icons-outlined text-danger">close</i>
				  </td>
				</tr>`;
					
      })
      .join(""));
  } else {
   totalAmountShow.innerHTML = "";
   $('#removeCart, #loader').hide();
   let progress = 0;
    ShoppingCart.innerHTML = `<tr>
						  <td colspan="8" class="text-center">Cart is Empty</td>
    </td></tr>`;
  }
  
};

generateCartItems();

/**
 * ! used to increase the selected product item quantity by 1
 */

let increment = (id) => {
	$("#loader").show();
	let selectedItem = id;
	let search = basket.find((x) => x.id === selectedItem);
	if (search === undefined) {
		basket.push({
		  id: selectedItem,
		  qty: 1,
		});
	} else {
		let inputId = 'cart-stock-limit' + id;
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
				localStorage.setItem("data", JSON.stringify(basket));
		  }
		}
	}
	setTimeout(function () {
		generateCartItems();
	}, 500);
};

/**
 * ! used to decrease the selected product item quantity by 1
 */

let decrement = (id) => {
	$("#loader").show();	
	let selectedItem = id;
	let search = basket.find((x) => x.id === selectedItem);

	if (search === undefined) return;
	else if (search.qty === 0) return;
	else {
		search.qty -= 1;
		$('#dataRow' + id).find('.qty-increment').prop('disabled', false);
		let inputId = 'cart-stock-limit' + id;
		$('#' + inputId).val('')
		localStorage.setItem(inputId + '-value', '');
		if (search.qty == 0) {
			$('#qty-total').find('#' + inputId).remove();
		}
	}
	update(selectedItem);
	basket = basket.filter((x) => x.qty !== 0);
	localStorage.setItem("data", JSON.stringify(basket));
	$('#check-stock-pay-div').html(' ');
	setTimeout(function () {
		generateCartItems();
	}, 500);
};

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

  let search = basket.find((x) => x.id === id);
  if (!search) return;

  search.qty = qty;
  search.item = qty; // keep item count in sync
	
  localStorage.setItem("data", JSON.stringify(basket));

  calculation();
  TotalAmount();
  
  setTimeout(function () {
	generateCartItems();
  }, 500);
};

/**
 * ! To update the digits of picked items on each item card
 */

let update = (id) => {
  let search = basket.find((x) => x.id === id);
  //console.log(id, search.qty);
  $('#qty_'+id).val(search.qty);
  calculation();
  TotalAmount();
};

/**
 * ! Used to remove 1 selected product card from basket
 * ! using the X [cross] button
 */

let removeItem = (id) => {
	$("#loader").show();
	let selectedItem = id;
	basket = basket.filter((x) => x.id !== selectedItem);
	calculation();
	setTimeout(function () {
		generateCartItems();
	}, 500);
	let inputId = 'cart-stock-limit' + id;
	localStorage.setItem(inputId + '-value', '');
	$('#qty-total').find('#' + inputId).remove();
	TotalAmount();
	localStorage.setItem("data", JSON.stringify(basket));
};


/**
 * ! Used to calculate total amount of the selected Products
 * ! with specific quantity
 * ? When basket is blank, it will show nothing
 */

let TotalAmount = () => {
  if (basket.length !== 0) {
    let amount = basket
      .map((x) => {
        let { id, qty, price } = x;
        return price * qty;
      })
      .reduce((x, y) => x + y, 0);

    return (totalAmountShow.innerHTML = `<tr>
						  <td colspan="6">Sum</td>
						  <td id="cartAmount" class="cartAmount text-center">₹ ${amount.toFixed(2)}</td>
						  <input type="hidden" name="cart_total_amt" value="${amount.toFixed(2)}">
						</tr>`);
  } else return;
};

TotalAmount();

/**
 * ! Used to clear cart, and remove everything from local storage
 */

let clearCart = () => {
	$("#loader").show();
	basket = [];
	setTimeout(function () {
		generateCartItems();
	}, 500);
	$('#qty-total').html('');
	// reset related localStorage
	Object.keys(localStorage).forEach(key => {
	  if (key.startsWith('cart-stock-limit')) {
		localStorage.removeItem(key);
	  }
	});
	$('#check-stock-div').html('');
	calculation();
	localStorage.setItem("data", JSON.stringify(basket));
  
};