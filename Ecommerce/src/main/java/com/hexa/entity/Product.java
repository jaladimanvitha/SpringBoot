package com.hexa.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "product")
public class Product {

	
	@Id
	@NotNull(message="Product ID is mandatory")
	@Column(name = "product_Id")
	private int productId;

	@NotEmpty(message="product Name is mandatory")
	@Column(name = "product_Name")
	private String productName;
	
	@NotNull(message="Product Price is Mandatory")
	@Column(name = "product_Price")
	private double productPrice;

	@NotNull(message="Product Stock is mandatory")
	@Column(name = "product_Stock")
	private int productStock;

	
	@Column(name = "product_Image")
	private String productImage;
	
	@ManyToOne
	@JoinColumn(name = "category_id", referencedColumnName = "Category_Id")
	private Category cat;

	@OneToMany(mappedBy = "prod") /* , fetch=FetchType.EAGER */
	private Set<Specifications> slist;
	
	

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

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public Category getCat() {
		return cat;
	}

	public void setCat(Category cat) {
		this.cat = cat;
	}

	@Override
	public String toString() {
		return productId + " " + productName + " " + productPrice + " " + productStock + " " + productImage;
	}

}
