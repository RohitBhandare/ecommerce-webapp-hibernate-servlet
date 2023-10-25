
<%@page import="java.util.List"%>
<%@page import="com.Maven.web.HibernateEcommerceWebApp.myfactory.FactoryProvider"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.Maven.web.HibernateEcommerceWebApp.entities.Category"%>
<%@page import="com.Maven.web.HibernateEcommerceWebApp.entities.User"%>
<%
	User user= (User) session.getAttribute("user");
	
	if(user==null)
	{
		session.setAttribute("message", "Your are not logged in !! plz login first");
		response.sendRedirect("login.jsp");
		return;
	}
	else
	{
		if(user.getUser_type().equals("normal"))
		{
			session.setAttribute("message", "Your are not admin !! you can't access this page!!!!");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
 <%@include file="components/base-css.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	
	<%@include file="components/message.jsp" %>
	<div class="container1 admin-cards">
		<div class="card text-bg-primary mb-3">
		  <div class="card-header">Total User</div>
		  <div class="card-body">
		    <h5 class="card-title">50</h5>
		    <p class="card-text">active users</p>
		  </div>
		</div>
		<div class="card text-bg-secondary mb-3">
		  <div class="card-header">Total Products</div>
		  <div class="card-body">
		    <h5 class="card-title">3333</h5>
		    <p class="card-text">products</p>
		  </div>
		</div>
		<div class="card text-bg-success mb-3" style="max-width: 18rem;">
		  <div class="card-header">Categories</div>
		  <div class="card-body">
		    <h5 class="card-title">6060</h5>
		    <p class="card-text">categories</p>
		  </div>
		</div>		
	</div>
	
	<!-- Button trigger modal -->
<div class="addpcontainer"> 
<button type="button" style="padding: 20px; margin: 20px;" id="addbtn" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Add Category
</button>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background: #004d40; color:#fff;">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Category</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      <form action="ProductOperationServlet" method="post">
      <input type="hidden" name="operation" value="addcategory"/>
			 <div class="form-group">
			    Category Title:<input type="text" class="form-control" name="ctitle"  placeholder="Enter Category Title" required>
			  </div>

			  <div class="form-group">
			    Category Desc:<textarea  class="form-control" name="cdesc" placeholder="Enter Description" required ></textarea>
			  </div>
			  <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
		</form>
      </div>
     
    </div>
  </div>
</div>

</div>
<!-- Button trigger modal -->
<div class="addpcontainer"> 
<button type="button" style="padding: 20px; margin: 20px;" id="addbtn" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#productModal">
  Add Product
</button>
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background: #004d40; color:#fff;">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Products</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
      		<input type="hidden" name="operation" value="addproducts"/>
			 <div class="form-group">
			    Product Title:<input type="text" class="form-control" name="pname"  placeholder="Enter Product Title" required>
			  </div>

			  <div class="form-group">
			   Product Desc:<textarea  style="height: 100px;" class="form-control" name="pdesc" placeholder="Enter Product Description" required ></textarea>
			  </div>
			  <div class="form-group">
			    Product Price:<input type="number" class="form-control" name="pprice"  placeholder="Enter Product Price" required>
			  </div>
			  
			   <div class="form-group">
			    Product Discount:<input type="number" class="form-control" name="pdiscount"  placeholder="Enter Product Discount" required>
			  </div>
			  
			   <div class="form-group">
			    Product Quantity:<input type="number" class="form-control" name="pquantity"  placeholder="Enter Product Quantity" required>
			  </div>
			<% 
				CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
				List<Category>list=cdao.getCategories();
			%>
			<div class="form-group">
				
				<select type="number" name="catsid" class="form-control">
				<%
				 for(Category c: list){
					%>
					<option value=" <%= c.getCategoryId()%>"><%= c.getCategoryTitle() %></option>
					<%
					}
					%>
					
				
				</select>
				</div>
			 
			 <div class="from-group">
			 	Product Pic:<br><input type="file" name="ppic" requried/>
			 </div>
			 <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
		</form>
      </div>
      
    </div>
  </div>
</div>

</div>

	

</body>
</html>