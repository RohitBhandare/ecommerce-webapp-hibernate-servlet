package com.ecommerce.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Maven.web.HibernateEcommerceWebApp.entities.Category;
import com.Maven.web.HibernateEcommerceWebApp.entities.Products;
import com.Maven.web.HibernateEcommerceWebApp.entities.User;
import com.Maven.web.HibernateEcommerceWebApp.myfactory.FactoryProvider;
import com.ecommerce.dao.CategoryDao;
import com.ecommerce.dao.ProductDao;
import com.ecommerce.dao.UserDao;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("message", "Product is added Succesfully!!! ");
		response.sendRedirect("admin.jsp");
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String ops=request.getParameter("operation");
		
		if(ops.trim().equals("addcategory"))
		{
			String ptitle=request.getParameter("ctitle");
			String cdesc=request.getParameter("cdesc");
			
			Category cat=new Category();
			cat.setCategoryTitle(ptitle);
			cat.setCategoryDiscription(cdesc);
			
			CategoryDao catdao=new CategoryDao(FactoryProvider.getFactory());
			catdao.saveCategory(cat);
		}
		else if(ops.trim().equals("addproducts"))
		{
			String pname=request.getParameter("pname");
			String pdesc=request.getParameter("pdesc");
			int pprice= Integer.parseInt(request.getParameter("pprice"));
			int pdiscount= Integer.parseInt(request.getParameter("pdiscount"));
			int pquantity= Integer.parseInt(request.getParameter("pquantity"));
			String str=request.getParameter("catsid");
			int catid=Integer.parseInt(str.trim());
			
			System.out.println(catid);
			
			Part part=request.getPart("ppic");
			
			Products product=new Products();
			
			product.setProductName(pname);
			product.setProductDiscription(pdesc);
			product.setProductPrice(pprice);
			product.setProductDiscount(pdiscount);
			product.setProductQuantity(pquantity);
			product.setProductPic(part.getSubmittedFileName());
			
			CategoryDao catdao=new CategoryDao(FactoryProvider.getFactory());
			Category cat=catdao.getCategoryById(catid);
			
			product.setCategory(cat);
			
			ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
			String path=request.getRealPath("images")+File.separator +"products"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			FileOutputStream fos=new FileOutputStream(path);
			InputStream fin=part.getInputStream();
			byte[]data=new byte[fin.available()];
			
			fin.read(data);
			fos.write(data);
			fos.close();
			pdao.saveProduct(product);
		}
		doGet(request, response);
	}

}
