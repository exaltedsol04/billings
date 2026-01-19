let PurchaseCart = document.getElementById("purchase-cart");
let totalAmountShow = document.getElementById("total_amount_show");
/**
 * ! purchaseBasket to hold all the selected items
 * ? the getItem part is retrieving data from the local storage
 * ? if local storage is blank, purchaseBasket becomes an empty array
 */

let purchaseBasket = JSON.parse(localStorage.getItem("purchaseData")) || [];

/**
 * ! used to add to cart
 */
$(document).on("keydown", ".qty-input", function (e) {
  if (e.key === "-" || e.key === "e") {
    e.preventDefault();
  }
});


let add_to_cart = () => {
	
	$("#loader").show();
	let product = $("#product").val();
	const myArray = product.split("@@@");
	let selectedItem = parseInt(myArray[0]);
	let productPrice = myArray[1];
	let productName = myArray[2];
	let productId = myArray[3];
	let productBarcode = myArray[4];
	let productMeasurement = myArray[5];
	let qty = 1;
	let search = purchaseBasket.find((x) => x.id === selectedItem);
	//alert('ok');

  if (search === undefined) {
    purchaseBasket.push({
      id: selectedItem,
	  name: productBarcode+productName,
	  measurement: productMeasurement,
	  price: productPrice,
	  pid: productId,
      qty: parseInt(qty),
	  item: 1
    });
  } else {
    search.item += 1;
	search.qty += parseInt(qty);
  }

  console.log(purchaseBasket);
  update(selectedItem);
  localStorage.setItem("purchaseData", JSON.stringify(purchaseBasket));
  setTimeout(function () {
	generatePurchaseItems();
  }, 500);
};

/**
 * ! To calculate total amount of selected Items
 */

let calculation = () => {
  let cartIcon = document.getElementById("cartAmount");
  if(cartIcon){
	cartIcon.innerHTML = purchaseBasket.map((x) => x.item).reduce((x, y) => x + y, 0);
  }
};

calculation();


/**
 * ! Generates the Cart Page with product cards composed of
 * ! images, title, price, buttons, & Total price
 * ? When purchaseBasket is blank -> show's Cart is Empty
 */

let generatePurchaseItems = () => {
	
  if (purchaseBasket.length !== 0) {
    return (PurchaseCart.innerHTML = purchaseBasket
      .map((x, index) => {
        let { id, item, qty, price, measurement, name, pid } = x;

		$('#loader').hide();
		$('#removeCart').show();
		/*let custom_label = '';
		if (typeof label !== 'undefined' && label != '') {
			custom_label = '<br/><small class="text-muted">Custom Label: '+label+'</small>';
		}*/

       // let search = shopItemsData.find((x) => x.id === id) || [];
        //let { qty, price, name, pid } = search;
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
						<input type="number" class="form-control text-center qty-input" value="${qty}" min="1" oninput="updateQty(${id}, this.value)" id="qty_${id}" name="qty[]">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="increment(${id})" >+</button>
						</span>
					</div>
				  </td>
				  <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${measurement}</td>
				   <td class="text-center">₹ ${price}</td>						  
				  <td class="text-center">₹ ${(qty * price).toFixed(2)}</td>
				  <td class="text-center">
					<i style="cursor:pointer;" onclick="removeItem(${id})" class="material-icons-outlined text-danger">close</i>
				  </td>
				</tr>`;
						
						
      })
      .join(""));
  } else {
   // PurchaseCart.innerHTML = "";
   totalAmountShow.innerHTML = "";
   
   $('#removeCart, #loader').hide();
    PurchaseCart.innerHTML = `<tr>
						  <td colspan="7" class="text-center">No Record Found.</td>
    </td></tr>`;
  }
  
};

generatePurchaseItems();

/**
 * ! used to increase the selected product item quantity by 1
 */

let increment = (id) => {
	$("#loader").show();
  let selectedItem = id;
  let search = purchaseBasket.find((x) => x.id === selectedItem);

  if (search === undefined) {
    purchaseBasket.push({
      id: selectedItem,
      qty: 1,
    });
  } else {
    search.qty += 1;
  }
//console.log(purchaseBasket);
  update(selectedItem);
  localStorage.setItem("purchaseData", JSON.stringify(purchaseBasket));
  setTimeout(function () {
	generatePurchaseItems();
  }, 500);
};

/**
 * ! used to decrease the selected product item quantity by 1
 */

let decrement = (id) => {
	$("#loader").show();
  let selectedItem = id;
  let search = purchaseBasket.find((x) => x.id === selectedItem);

  if (search === undefined) return;
  else if (search.qty === 0) return;
  else {
    search.qty -= 1;
  }

  update(selectedItem);
  purchaseBasket = purchaseBasket.filter((x) => x.qty !== 0);
  //generatePurchaseItems();
  localStorage.setItem("purchaseData", JSON.stringify(purchaseBasket));
  setTimeout(function () {
	generatePurchaseItems();
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

  let search = purchaseBasket.find((x) => x.id === id);
  if (!search) return;

  search.qty = qty;
  search.item = qty; // keep item count in sync

  localStorage.setItem("purchaseData", JSON.stringify(purchaseBasket));

  calculation();
  TotalAmount();
  
  setTimeout(function () {
	generatePurchaseItems();
  }, 500);
};

/**
 * ! To update the digits of picked items on each item card
 */

let update = (id) => {
  let search = purchaseBasket.find((x) => x.id === id);
  
  //console.log(id, search.qty);
  
  //document.getElementById('qty_'+id).innerHTML = search.qty;
  $('#qty_'+id).val(search.qty);
  calculation();
  TotalAmount();
};

/**
 * ! Used to remove 1 selected product card from purchaseBasket
 * ! using the X [cross] button
 */

let removeItem = (id) => {
	$("#loader").show();
  let selectedItem = id;
  purchaseBasket = purchaseBasket.filter((x) => x.id !== selectedItem);
  calculation();
  setTimeout(function () {
	generatePurchaseItems();
  }, 500);
  //generatePurchaseItems();
  TotalAmount();
  localStorage.setItem("purchaseData", JSON.stringify(purchaseBasket));
};


/**
 * ! Used to calculate total amount of the selected Products
 * ! with specific quantity
 * ? When purchaseBasket is blank, it will show nothing
 */

let TotalAmount = () => {
  if (purchaseBasket.length !== 0) {
    let amount = purchaseBasket
      .map((x) => {
        let { id, qty, price } = x;
        //let filterData = shopItemsData.find((x) => x.id === id);
        return price * qty;
      })
      .reduce((x, y) => x + y, 0);

    return (totalAmountShow.innerHTML = `<tr>
						  <td colspan="5">Sum</td>
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
  purchaseBasket = [];
  setTimeout(function () {
	generatePurchaseItems();
  }, 500);
  //generatePurchaseItems();
  calculation();
  localStorage.setItem("purchaseData", JSON.stringify(purchaseBasket));
  
};