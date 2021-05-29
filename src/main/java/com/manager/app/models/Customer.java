package com.manager.app.models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name = "customers")
public class Customer implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@NotEmpty(message = "Name must not be empty")
	private String fullname;
	@NotEmpty(message = "Customer source must not be empty")
	private String source;
	@Column(unique = true)
	@NotEmpty(message = "Contact Number must not be empty")
	private String contactNumber;
	@NotEmpty(message = "Address must not be empty")
	private String address;
	@NotEmpty(message = "Gender must not be empty")
	private String gender;
	@NotNull(message = "Credits must not be null")
	private int credits = 0;
	@NotNull(message = "Referrer id must not be null")
	private int referrerId;
	@NotNull(message = "Referral pending must not be null")
	private boolean referralPending;
	
	@CreationTimestamp  
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false, updatable = false)
	private Date joinedDate;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer", cascade = CascadeType.ALL, orphanRemoval = true)
	@OrderBy("id DESC")
	private List<CustomerOrder> customerOrders;
	
	public Customer() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<CustomerOrder> getCustomerOrders() {
		return customerOrders;
	}

	public void setCustomerOrders(List<CustomerOrder> customerOrders) {
		this.customerOrders = customerOrders;
	}

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	public int getReferrerId() {
		return referrerId;
	}

	public void setReferrerId(int referrerId) {
		this.referrerId = referrerId;
	}

	public boolean getReferralPending() {
		return referralPending;
	}

	public void setReferralPending(boolean referralPending) {
		this.referralPending = referralPending;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getJoinedDate() {
		return joinedDate;
	}

	public void setJoinedDate(Date joinedDate) {
		this.joinedDate = joinedDate;
	}
}
