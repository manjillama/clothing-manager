package com.manager.app.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.manager.app.models.Customer;
import com.manager.app.repository.CustomerRepository;

@Service
@Transactional
public class CustomerService {
	@Autowired
	CustomerRepository customerRepository;
	
	public void save(Customer customer) {
		customerRepository.save(customer);
	}

	public Page<Customer> getAll(Pageable pageable) {
		return customerRepository.findAll(pageable);
	}

	public Page<Customer> getByContactNumber(Pageable pageable, String contact_no) {
		return customerRepository.findByContactNumber(pageable, contact_no);
	}

	public Customer findById(int id) {
		return customerRepository.findOne(id);
	}

	public long countAll() {
		return customerRepository.count();
	}

	public void deleteCustomer(int id) {
		customerRepository.delete(id);
	}

	public Customer getByContactNumber(String contactNumber) {
		return customerRepository.findByContactNumber(contactNumber);
	}
	
//	public City findById(int id) {
//		return cityRepository.findOne(id);
//	}
//	
//	public List<City> getAll(){
//		return (List<City>) cityRepository.findAll();
//	}
//	
//	public void deleteCity(int id) {
//		cityRepository.delete(id);
//	}
}
