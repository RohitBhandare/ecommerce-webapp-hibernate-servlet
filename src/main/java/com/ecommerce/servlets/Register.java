package com.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Maven.web.HibernateEcommerceWebApp.entities.User;
import com.Maven.web.HibernateEcommerceWebApp.myfactory.FactoryProvider;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response, String user_name) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("message", "Registration is Succesful "+user_name);
		response.sendRedirect("register.jsp");

		return;
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_name=request.getParameter("username");
		String user_email=request.getParameter("email");
		String user_password=request.getParameter("password");
		String user_phone=request.getParameter("phone");
		String user_address=request.getParameter("address");
		
		User user=new User(user_name, user_email, user_password, user_phone, "default.jpg",user_address,"normal");
		
		
		Session session=FactoryProvider.getFactory().openSession();
		Transaction tx=session.beginTransaction();
		
		session.save(user);
		
		tx.commit();
		
		session.close();
		
		System.out.println("succesfull " +user_name);
		
		doGet(request, response,user_name);
	}

}
