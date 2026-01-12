let ShoppingCart = document.getElementById("shopping-cart");
let ShoppingList = document.getElementById("shopping-list");
let totalAmountShow = document.getElementById("total_amount_show");
/**
 * ! Basket to hold all the selected items
 * ? the getItem part is retrieving data from the local storage
 * ? if local storage is blank, basket becomes an empty array
 */

let basket = JSON.parse(localStorage.getItem("data")) || [];

/**
 * ! used to add to cart
 */

let progress_bar = () => {
	/*let progress = 0;

            $('#progressBar')
                .removeClass('active')
                .addClass('progress-bar-success')
                .text('Completed');
	let interval = setInterval(function () {
        progress += 1;

        $('#progressBar')
            .css('width', progress + '%')
            .text(progress + '%');

        if (progress >= 100) {
            clearInterval(interval);
            $('#progressBar')
                .removeClass('active')
                .addClass('progress-bar-success')
                .text('Completed');
        }
    }, 2);*/ // speed (lower = faster)
};

let add_to_cart = () => {
	
	$("#loader").show();
	
	progress_bar();
    
	
	
	let product = $("#product").val();
	const myArray = product.split("@@@");
	let selectedItem = parseInt(myArray[0]);
	let productPrice = myArray[1];
	let productName = myArray[2];
	let productImage = myArray[3];
	let qty = 1;
	let search = basket.find((x) => x.id === selectedItem);

  if (search === undefined) {
    basket.push({
      id: selectedItem,
	  name: productName,
	  price: productPrice,
	  pimage: productImage,
      qty: parseInt(qty),
	  item: 1
    });
  } else {
    search.item += 1;
	search.qty += parseInt(qty);
  }

  console.log(basket);
  update(selectedItem);
  localStorage.setItem("data", JSON.stringify(basket));
  setTimeout(function () {
	generateCartItems();
	generateListItems();
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
      .map((x) => {
        let { id, item, qty, price, name, pimage } = x;

		$('#loader').hide();
		let progress = 0;
		$('#removeCart').show();
		/*let custom_label = '';
		if (typeof label !== 'undefined' && label != '') {
			custom_label = '<br/><small class="text-muted">Custom Label: '+label+'</small>';
		}*/

       // let search = shopItemsData.find((x) => x.id === id) || [];
        //let { qty, price, name, pimage } = search;
        return `<tr>
					<td>
					<div class="input-group quantity-group">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="decrement(${id})">−</button>
						</span>
						<input type="text" class="form-control text-center qty-input" value="${qty}" min="1" id="qty_${id}">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-qty" style="cursor:pointer" onclick="increment(${id})" >+</button>
						</span>
					</div>
				  </td>
				  <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${name}</td>
				  <td class="text-center">₹ ${price}</td>						  
				  <td class="text-center">₹ ${(qty * price).toFixed(2)}
					<i style="cursor:pointer; margin-left:5px" onclick="removeItem(${id})" class="fa fa-trash-o text-red" title="Remove Item"></i>
				  </td>
				</tr>`;
						
						
      })
      .join(""));
  } else {
   // ShoppingCart.innerHTML = "";
   totalAmountShow.innerHTML = "";
   
   $('#removeCart, #loader').hide();
   let progress = 0;
    ShoppingCart.innerHTML = `<tr>
						  <td colspan="4" class="text-center">Cart is Empty</td>
    </td></tr>`;
  }
  
};

let generateListItems = () => {
	
  if (basket.length !== 0) {
    return (ShoppingList.innerHTML = basket
      .map((x) => {
        let { id, item, qty, price, name, pimage } = x;

		$('#loader').hide();
		let progress = 0;
		$('#removeCart').show();
       // let search = shopItemsData.find((x) => x.id === id) || [];

        return `<div class="col-md-3">
					<div class="box box-primary" style="margin-top: 5px; border:1px solid #3c8dbc">
						<div class="box-body" style="padding: 2px;">
							<div class="row">
								<div class="col-md-12">
									<img src="${pimage}" width="100%">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 text-center" style="margin-top: 5px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
									${name}
								</div>
							</div>
							<div class="row">
								<div class="col-md-12" style="margin-top: 5px;">
									<button type="button" name="btnCart" value="SAVE" class="btn btn-primary btn-block" onclick="increment(${id})">+ Add to Cart</button>
								</div>
							</div>
						</div>
					</div>
				</div>`;
						
						
      })
      .join(""));
  } else {
   
   //totalAmountShow.innerHTML = "";
   $('#removeCart, #loader').hide();
   let progress = 0;
    ShoppingList.innerHTML = `Add your product`;
  }
  
};

generateListItems();
generateCartItems();

/**
 * ! used to increase the selected product item quantity by 1
 */

let increment = (id) => {
	$("#loader").show();
	progress_bar();
  let selectedItem = id;
  let search = basket.find((x) => x.id === selectedItem);

  if (search === undefined) {
    basket.push({
      id: selectedItem,
      qty: 1,
    });
  } else {
    search.qty += 1;
  }
//console.log(basket);
  update(selectedItem);
  localStorage.setItem("data", JSON.stringify(basket));
  setTimeout(function () {
	generateCartItems();
  }, 500);
};

/**
 * ! used to decrease the selected product item quantity by 1
 */

let decrement = (id) => {
	$("#loader").show();
	progress_bar();
  let selectedItem = id;
  let search = basket.find((x) => x.id === selectedItem);

  if (search === undefined) return;
  else if (search.qty === 0) return;
  else {
    search.qty -= 1;
  }

  update(selectedItem);
  basket = basket.filter((x) => x.qty !== 0);
  //generateCartItems();
  localStorage.setItem("data", JSON.stringify(basket));
  setTimeout(function () {
	generateCartItems();
	generateListItems();
  }, 500);
};

/**
 * ! To update the digits of picked items on each item card
 */

let update = (id) => {
  let search = basket.find((x) => x.id === id);
  
  //console.log(id, search.qty);
  
  //document.getElementById('qty_'+id).innerHTML = search.qty;
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
	progress_bar();
  let selectedItem = id;
  basket = basket.filter((x) => x.id !== selectedItem);
  calculation();
  setTimeout(function () {
	generateCartItems();
	generateListItems();
  }, 500);
  //generateCartItems();
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
        //let filterData = shopItemsData.find((x) => x.id === id);
        return price * qty;
      })
      .reduce((x, y) => x + y, 0);

    return (totalAmountShow.innerHTML = `<tr>
						  <td colspan="3">Sum</td>
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
	progress_bar();
  basket = [];
  setTimeout(function () {
	generateCartItems();
	generateListItems();
  }, 500);
  //generateCartItems();
  calculation();
  localStorage.setItem("data", JSON.stringify(basket));
  
};