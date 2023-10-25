package com.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Maven.web.HibernateEcommerceWebApp.entities.User;
import com.Maven.web.HibernateEcommerceWebApp.myfactory.FactoryProvider;
import com.ecommerce.dao.UserDao;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
		

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession httpSession=request.getSession();
		if(user==null)
		{
			httpSession.setAttribute("message", "Invalid details !!!");
			response.sendRedirect("login.jsp");
			return;
		}
		else
		{
			out.print("successfull..."+user.getUserName());
			
			//login
			httpSession.setAttribute("user", user);
			
			if(user.getUser_type().equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}
			else
			{
				response.sendRedirect("user.jsp");
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_name=request.getParameter("username");
		String password=request.getParameter("password");
		
		UserDao userdao=new UserDao(FactoryProvider.getFactory());
		User user=userdao.getUserByUserNameAndPassword(user_name, password);
		
		System.out.println(user);
		doGet(request, response,user);
	}

}
