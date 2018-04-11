package com.hexa.dao;

import java.util.List;

import org.hibernate.id.IdentifierGenerationException;

import com.hexa.entity.Category;
import com.hexa.entity.Product;
import com.hexa.entity.Specifications;


public interface IDao {

	public List<Category> getCategory();

	public List<Product> listProduct(int cid);

	public List<Specifications> getSpecification(int pid);

	public Product getProduct(int pid);
	
	public int updateStock(int temp,int pid)  throws OutOfStockException;
	
	int addProduct(Product pro);
	
	int addSpecification(Specifications spec);
}
