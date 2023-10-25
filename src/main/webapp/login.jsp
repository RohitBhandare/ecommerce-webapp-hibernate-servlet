<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 <%@include file="components/base-css.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fluid">
		<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
		<div class="card" style="background: #eee;">
		
		<%@include file="components/message.jsp" %>
		<div class="card-body">
		
			<h1 align="center" style="color: violet; text-shadow: 2px 2px 3px indigo">Login panel</h1>
		<form action="Login" method="post" >
			 <div class="form-group">
			    <label for="username">User Name</label>
			    <input type="text" class="form-control" name="username"  placeholder="Enter name" required>
			  </div>

			  
			  <div class="form-group">
			    <label for="password">User Password</label>
			    <input type="password" class="form-control" name="password" placeholder="Enter Password">
			  </div>
			  			  
			  <button type="submit" class="btn btn-success" >Login</button>
			  <button type="button" class="btn btn-danger">Reset</button>
		</form>
		</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>