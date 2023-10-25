package com.ecommerce.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.Maven.web.HibernateEcommerceWebApp.entities.Category;
import com.Maven.web.HibernateEcommerceWebApp.myfactory.FactoryProvider;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
public void saveCategory(Category cat)
{
	Session session=FactoryProvider.getFactory().openSession();
	Transaction tx=session.beginTransaction();
	
	session.save(cat);
	
	tx.commit();
	
	session.close();
	}

public List<Category> getCategories()
{
	Session session=FactoryProvider.getFactory().openSession();
	Query q=session.createQuery("from Category");
	List<Category>list=q.list();
	return list;
	}

	public Category getCategoryById(int cid)
	{
		Category cat=null;
		try
		{
			Session session=this.factory.openSession();
			cat=session.get(Category.class, cid);
			session.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cat;
	}
}

