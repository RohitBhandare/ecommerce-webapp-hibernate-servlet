/**
 * 
 */
 
function add_to_cart(pid,pname,pprice)
{
	let cart=localStorage.getItem("cart");
	if(cart==null)
	{
		//no cart yet
		let products=[];
		let product={product:pid,productName:pname,productQuantity:1,productPrice:pprice};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
	}
	else
	{
		//cart already present
		let pcart=JSON.parse(cart);
		let oldProduct=pcart.find((item)=> item.productItem ==pid)
		
		if(oldProduct)
		{
			oldProduct.productQuantity=oldProduct.productQuantity+1;
			pcart.map((item)=>
			{
				if(item.productId==oldProduct.productId)
				{
					item.productQuantity=oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
		}
		else
		{
			let product={product:pid,productName:pname,productQuantity:1,productPrice:pprice};
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
		}
		
	}
	updateCart();
}

function updateCart()
{
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	
	if(cart==null || cart.length==0)
	{
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>cart does not have any items </h3>");
		$(".checkout-btn").addClass('disabled');
	}
	else
	{
		$(".cart-items").html(`(${cart.length})`);
		
		let table=`<table class='table'>
		<thead class='thead-light'>
		
		<tr>
			<th>Item Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total Price</th>
			<th>Action</th>
		</tr>
		
		</thead>
		
		`;
		cart.map((item)=>
		{
			table+=`<tr><td>${item.productName}</td>
			<td>${item.productPrice}</td>
			<td>${item.productQuantity}</td>
			<td>${item.productQuantity *item.productPrice}</td>
			<td><button class="btn btn-danger btn-sm" onclick="deleteItemFromCart(${item.productId})">remove</button>
			</tr>`
			
			
		})
		table=table+`</table>`
		$(".cart-body").html(table)
		
		
	}
	
}
function deleteItemFromCart(pid)
{
	let cart=JSON.parse(localStorage.getItem('cart'))
	
	let newcart=cart.filter((item)=>item.productId!=pid)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
}

$(document).ready(function()
{
	updateCart()
})