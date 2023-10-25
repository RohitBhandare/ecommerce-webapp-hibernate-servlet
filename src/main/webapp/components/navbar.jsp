<%@page import="com.Maven.web.HibernateEcommerceWebApp.entities.User"%>
<%
	User user1= (User) session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  <a class="navbar-brand" href="index.jsp">Ecommerce Web</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#cart">cart <i class="fa fa-cart-plus"></i><span class="ml-0 cart-items"> ( 0 )</span></a>
      </li>
    </ul>
     
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <%
    if(user1==null)
    	{ %>
    	
    	<a href="login.jsp"><button type="button" style="margin-left: 10px" class="btn btn-secondary">Login</button> </a>
    	<a href="register.jsp"><button type="button" style="margin-left: 10px" class="btn btn-success">Register</button></a>
    	
		<% 
		}
       	else
    	{
       		
       	%>
       	
    	<h1 style="color: white; margin: 5px 5px"> <%= user1.getUserName()%></h1>
    
		<a href="Logout"><button type="button" style="margin-left: 10px" class="btn btn-danger">Logout</button></a>
		
    	<%	
    		}
    	%>
    
  </div>
</nav>