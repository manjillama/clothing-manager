package com.manager.app.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "customerOrderItems")
public class CustomerOrderItem implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@NotEmpty(message="Please enter product name")
	private String product;
	@NotEmpty(message="Please enter size")
	private String size;
	@NotNull(message="Please enter buying price")
	@Min(value=0, message = "The product discount must not be less than zero")
	private int buyingPrice;
	@Min(value=0, message = "Must not be less than zero")
	private int discount = 0;
	@NotNull(message="Please enter selling price")
	@Min(value=0, message = "The product selling price must not be less than zero")
	private int sellingPrice;
	@NotNull(message="Please enter total selling price")
	@Min(value=0, message = "The product selling price must not be less than zero")
	private int totalSellingPrice;
	@NotNull(message="Please enter quantity")
	@Min(value=0, message = "The product quantity must not be less than zero")
	private int quantity = 1;
	@NotEmpty(message="Please enter product gender")
	private String gender;
	@NotEmpty(message="Please enter product type")
	private String type;
	private String remarks;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable=false)
	private CustomerOrder customerOrder;
	
	public CustomerOrderItem() {}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getBuyingPrice() {
		return buyingPrice;
	}

	public void setBuyingPrice(int buyingPrice) {
		this.buyingPrice = buyingPrice;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public int getTotalSellingPrice() {
		return totalSellingPrice;
	}

	public void setTotalSellingPrice(int totalSellingPrice) {
		this.totalSellingPrice = totalSellingPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public CustomerOrder getCustomerOrder() {
		return customerOrder;
	}

	public void setCustomerOrder(CustomerOrder customerOrder) {
		this.customerOrder = customerOrder;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "CustomerOrderItem [id=" + id + ", product=" + product + ", size=" + size + ", buyingPrice="
				+ buyingPrice + ", discount=" + discount + ", sellingPrice=" + sellingPrice + ", gender=" + gender
				+ ", type=" + type + ", remarks=" + remarks + ", customerOrder=" + customerOrder + "]";
	}
	
}
