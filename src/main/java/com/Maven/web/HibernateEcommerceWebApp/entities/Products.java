package com.Maven.web.HibernateEcommerceWebApp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.servlet.annotation.MultipartConfig;

@Entity

public class Products {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(length=20)
	private int productId;
	private String productName;
	@Column(length=500)
	private String productDiscription;
	private String productPic;
	private int productPrice;
	private int  productDiscount;
	private int productQuantity;
	
	public Products() {
		super();
	}

	@ManyToOne
	private Category category;
	
	public Products(String productName, String productDiscription, String productPic, int productPrice ,Category category,
			int productDiscount, int productQuantity) {
		super();
		this.productName = productName;
		this.productDiscription = productDiscription;
		this.productPic = productPic;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.category=category;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDiscription() {
		return productDiscription;
	}

	public void setProductDiscription(String productDiscription) {
		this.productDiscription = productDiscription;
	}

	public String getProductPic() {
		return productPic;
	}

	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public int getPriceDiscount()
	{
		int discount=(int)((this.getProductDiscount()/100.0)*this.getProductPrice());
		
		return this.getProductPrice()-discount;
	}
	
	
}
