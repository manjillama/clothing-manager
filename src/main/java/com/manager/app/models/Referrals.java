package com.manager.app.models;

public class Referrals {
	private Customer customer;
	private Customer referredBy;
	
	public Referrals() {}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Customer getReferredBy() {
		return referredBy;
	}

	public void setReferredBy(Customer referredBy) {
		this.referredBy = referredBy;
	}
}
