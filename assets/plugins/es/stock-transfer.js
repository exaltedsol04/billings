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


let add_to_cart = () => {
	
	$("#loader").show();
	$('#err_product').text('');
	
	let product = $("#product").val();
	const myArray = product.split("@@@");
	let selectedItem = parseInt(myArray[0]);
	let productPrice = myArray[1];
	let productName = myArray[2];
	let productId = myArray[3];
	let productBarcode = myArray[4];
	let productMeasurement = myArray[5];
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
	  item: 1
    });
  } else {
    search.item += 1;
	search.qty += parseInt(qty);
  }

  console.log(stockBasket);
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
						<input type="text" class="form-control text-center qty-input" value="${qty}" min="1" id="qty_${id}" name="qty[]">
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
   // StockCart.innerHTML = "";
   totalAmountShow.innerHTML = "";
   
   $('#removeCart, #loader').hide();
    StockCart.innerHTML = `<tr>
						  <td colspan="7" class="text-center">No Record Found.</td>
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
    search.qty += 1;
  }
//console.log(stockBasket);
  update(selectedItem);
  localStorage.setItem("stockData", JSON.stringify(stockBasket));
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
  }

  update(selectedItem);
  stockBasket = stockBasket.filter((x) => x.qty !== 0);
  //generateStockItems();
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
  //generateStockItems();
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
	$('.submit-stock-transfer').hide();
  stockBasket = [];
  setTimeout(function () {
	generateStockItems();
  }, 500);
  //generateStockItems();
  calculation();
  localStorage.setItem("stockData", JSON.stringify(stockBasket));
  
};