package com.hexa.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "Product_Spec")
public class Specifications {

	
	@NotNull(message="Specification Id is mandatory")
	@Id
	@Column(name = "spec_Id")
	private int specId;

	@NotEmpty(message="Specification Name is mandatory")
	@Column(name = "spec_Name")
	private String specName;

	@Column(name = "spec_value")
	private int specValue;

	@ManyToOne
	@JoinColumn(name = "product_id", referencedColumnName = "product_Id")
	private Product prod;

	public int getSpecId() {
		return specId;
	}

	public void setSpecId(int specId) {
		this.specId = specId;
	}

	public String getSpecName() {
		return specName;
	}

	public void setSpecName(String specName) {
		this.specName = specName;
	}

	public int getSpecValue() {
		return specValue;
	}

	public void setSpecValue(int specValue) {
		this.specValue = specValue;
	}
	
	

	public Product getProd() {
		return prod;
	}

	public void setProd(Product prod) {
		this.prod = prod;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return specName + " " + specValue;
	}

}
