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
	let stock_unit_name = myArray[6];
	let productType = myArray[7];
	let productId = myArray[8];
	let qty = 1;
	let search = basket.find((x) => x.id === selectedItem);

  if (search === undefined) {
    basket.push({
      id: selectedItem,
      measurement: productMeasurement,
      stock_unit_name: stock_unit_name,
	  name: productBarcode+productName,
	  price: productPrice,
	  pimage: productImage,
      qty: parseInt(qty),
	  ptype: productType,
	  pid: productId,
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
        let { id, item, qty, price, measurement, stock_unit_name, name, pimage, ptype, pid} = x;
		$('#loader').hide();
		let progress = 0;
		$('#removeCart').show();
		//let inputId = 'cart-stock-limit' + id;
		//let cart_stock_limit = $('#' + inputId).val();
		//qty = cart_stock_limit == '' ? qty : parseInt(cart_stock_limit) + 1;
			
        return `<tr id="dataRow${id}">
					<td class="text-center">${index + 1}
					<input type="hidden" class="pid-${pid} allpid" value="${measurement * qty}" id="vid_${id}" name="pid[${pid}][${id}]">
					</td>
					<td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${name}
					<input type="hidden" value="${id}" name="product_variant_id[]"></td>
					<td class="text-center"><span class="badge bg-grd-primary dash-lable">${ptype}</span></td>
					<td>
					<div class="input-group quantity-group">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="decrement(${id}, ${measurement}, \'${ptype}\', ${pid})">−</button>
						</span>
						<input type="number" class="form-control text-center qty-input${id}" value="${qty}" min="1" oninput="updateQty(${id}, this.value)" id="qty_${id}" name="qty[]">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty qty-increment" style="cursor:pointer" onclick="increment(${id}, ${measurement}, \'${ptype}\', ${pid})" >+</button>
						</span>
					</div>
				  </td>
				  <td class="text-center">${measurement} ${stock_unit_name}</td>
				  <td class="text-center">₹ ${price}</td>						  
				  <td class="text-center">₹ ${(qty * price).toFixed(2)}</td>
				  <td class="text-center"><i style="cursor:pointer;" onclick="removeItem(${id}, \'${ptype}\', ${pid})" class="material-icons-outlined text-danger">close</i>
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

function getTotalWeightByPid(pid) {
    return basket
        .filter(item => item.pid == pid)
        .reduce((sum, item) => sum + (item.qty * Number(item.measurement)), 0);
}


/**
 * ! used to increase the selected product item quantity by 1
 */

let increment = (id, msr, ptype, pid) => {

    $("#loader").show();

    let selectedItem = id;
    let search = basket.find(x => x.id === selectedItem);

    if (!search) {
        basket.push({
            id: selectedItem,
            qty: 1,
            pid: pid,
            measurement: Number(msr)
        });
        generateCartItems();
        $("#loader").hide();
        return;
    }
	
    let inputId = 'cart-stock-limit' + id;
	if (ptype === 'loose') {
		inputId = 'cart-stock-limitp' + pid;
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
        localStorage.setItem("data", JSON.stringify(basket));

        generateCartItems();
        $("#loader").hide();
    });
};





/**
 * ! used to decrease the selected product item quantity by 1
 */

let decrement = (id, msr, ptype, pid) => {

    $("#loader").show();

    let selectedItem = id;
    let search = basket.find(x => x.id === selectedItem);

    if (!search || search.qty === 0) {
        $("#loader").hide();
        return;
    }

    search.qty -= 1;

    $('#dataRow' + id).find('.qty-increment').prop('disabled', false);

    let inputId = 'cart-stock-limit' + id;
	if (ptype === 'loose') {
		inputId = 'cart-stock-limitp' + pid;
	}
    let pId = 'cart-pid-' + pid;

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

    basket = basket.filter(x => x.qty !== 0);
    localStorage.setItem("data", JSON.stringify(basket));

    $('#check-stock-pay-div').html('');

    setTimeout(function () {
        generateCartItems();
        $("#loader").hide();
    }, 300);
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
  //$('#vid_'+id).val(search.qty * );
  calculation();
  TotalAmount();
};

/**
 * ! Used to remove 1 selected product card from basket
 * ! using the X [cross] button
 */

let removeItem = (id, ptype, pid) => {
	$("#loader").show();
	let selectedItem = id;
	basket = basket.filter((x) => x.id !== selectedItem);
	calculation();
	setTimeout(function () {
		generateCartItems();
	}, 500);
	let inputId = 'cart-stock-limit' + id;
	if(ptype == 'loose') {
		inputId = 'cart-stock-limitp' + pid;
	}
	localStorage.setItem(inputId + '-value', '');
	//localStorage.setItem(inputId + '-pid', '');
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