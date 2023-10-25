package com.Maven.web.HibernateEcommerceWebApp.myfactory;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class Demo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		 Configuration con=new Configuration().configure("hibernate.cfg.xml");
	        SessionFactory factory=con.buildSessionFactory();
	        
	        System.out.println(factory);
	

	}

}
