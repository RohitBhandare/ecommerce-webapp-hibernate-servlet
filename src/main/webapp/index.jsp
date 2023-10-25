<%@page import="com.Maven.web.HibernateEcommerceWebApp.myfactory.ProductDescTrimmer"%>
<%@page import="com.Maven.web.HibernateEcommerceWebApp.entities.Category"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.Maven.web.HibernateEcommerceWebApp.entities.Products"%>
<%@page import="com.Maven.web.HibernateEcommerceWebApp.myfactory.FactoryProvider"%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

 <%@include file="components/base-css.jsp" %>
</head>
<body>

	<%@include file="components/navbar.jsp" %>
	<%@include file="components/common-modals.jsp" %>
	
	<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner" style=" height: 300px;">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="images/poject-banner1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="images/poject-banner1.jpg" class="d-block w-100" alt="...">
    </div>
   
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	<div class="container-fluid">
	<div class="row" style="margin: 20px">
	<%
		String str=request.getParameter("category");
		ProductDao product= new ProductDao(FactoryProvider.getFactory())	;
		List<Products> list=null;
		if(str==null || str.trim().equals("All"))
		{	
			list=product.getAllProducts();
			
		}
		else
		{
			int cid=Integer.parseInt(str.trim());
			list=product.getProductsById(cid);
		}
		
		CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
		List<Category>clist=cdao.getCategories();
		
	%>
	<div class="col-md-2">
	
	<div class="list-group">
	  <a href="index.jsp?category=All" class="list-group-item list-group-item-action active" aria-current="true">
	    All Products
	  </a>
	  <%
		for(Category c: clist){
			
	%>
	  <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
	  <%
	}
	%>
	</div>
	</div>
			
	
	
	<div class="col-md-10">
	
		<div class="row mt-4">
		
			<div class="col-md-12">
				<div class="card-columns">
				
				<%
					for( Products p:list) {
		 		%>
		 		
		 		<div class="card">
		 			<div class="container text-center">
		 				<img src="images/products/<%=p.getProductPic() %> "style=" max-height:200px; max-width: 100% ; width: auto; " class="card-img-top" alt=""> 
		 			</div>
		 			<div class="card-body"> 
		 			<h5><%= p.getProductName() %></h5>
		 			<p class="card-text"><%= ProductDescTrimmer.get10Words(p.getProductDiscription()) %><a href="#">read more</a></p>
		 			</div>
		 			
		 		<div class="card-footer">
		 			<button class="btn btn-success text-white" onclick="add_to_cart(<%=p.getProductId()%>,'<%= p.getProductName()%>',<%=p.getPriceDiscount()%>) ">Add to Cart</button>
		 			<button class="btn btn-outline-danger">&#8377; <%=p.getPriceDiscount() %>  <span class="text-secondary discount-label"><%=p.getProductPrice() %> <%=p.getProductDiscount() %>% off</span></button>
		 		</div>
		 		</div>
		 		<%
		 		}
		 		%>
				</div>
			</div>
		</div>
	
	</div>
	</div>
	</div>
	
</body>
</html>