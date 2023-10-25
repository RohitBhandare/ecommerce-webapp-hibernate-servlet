package com.ecommerce.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Maven.web.HibernateEcommerceWebApp.entities.Category;
import com.Maven.web.HibernateEcommerceWebApp.entities.Products;
import com.Maven.web.HibernateEcommerceWebApp.myfactory.FactoryProvider;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
public void saveProduct(Products product)
{
	Session session=FactoryProvider.getFactory().openSession();
	Transaction tx=session.beginTransaction();
	
	session.save(product);
	
	tx.commit();
	
	session.close();
	}

	public List<Products> getAllProducts()
	{
		
		Session session=this.factory.openSession();
		Query q=session.createQuery("from Products");
		List<Products>list=q.list();
		return list;
	}
	
	public List<Products> getProductsById(int cid)
	{
		
		Session session=this.factory.openSession();
		Query q=session.createQuery("from Products as p where p.category.categoryId=:id");
		
		q.setParameter("id", cid);
		List<Products>list=q.list();
		return list;
	}
}


