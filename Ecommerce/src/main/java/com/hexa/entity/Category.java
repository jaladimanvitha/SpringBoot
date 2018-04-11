package com.hexa.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Category")
public class Category {

	@Id
	@Column(name="Category_Id")
	private int categoryId;

	@Column(name="Category_Name")
	private String categoryName;

	
	@OneToMany(mappedBy = "cat" /*, fetch=FetchType.EAGER*/)
	private Set<Product> plist;

	public Set<Product> getPlist() {
		return plist;
	}


	public void setPlist(Set<Product> plist) {
		this.plist = plist;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return categoryId+"  "+categoryName;
	}
	
	
	

}
