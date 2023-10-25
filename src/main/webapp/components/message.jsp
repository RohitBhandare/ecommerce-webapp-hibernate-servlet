<%
	String message=(String) session.getAttribute("message");

	if(message!=null)
	{
		
		
		
		%>
		
		<div class="alert alert-success" role="alert">
		 	<%= message %>
		</div>
		
<%
		session.removeAttribute("message");
		
	}
%>