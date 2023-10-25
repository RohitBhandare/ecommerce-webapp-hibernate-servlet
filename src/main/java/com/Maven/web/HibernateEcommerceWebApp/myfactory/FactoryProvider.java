package com.Maven.web.HibernateEcommerceWebApp.myfactory;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	private static SessionFactory factory;

	public static SessionFactory getFactory()
	{
		try {
			if(factory==null)
			{
				factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return factory;
	}



}
