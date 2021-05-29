package com.manager.app.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manager.app.repository.CustomerOrderRepository;

@Service
@Transactional
public class CustomerOrderService {
	@Autowired
	CustomerOrderRepository customerOrderRepository;
	
//	public void save(CustomerOrder customerOrder) {
//		customerOrderRepository.save(customerOrder);
//	}
//
//	public Page<CustomerOrder> getAll(Pageable pageable) {
//		return customerOrderRepository.findAll(pageable);
//	}
//
//	public CustomerOrder findById(int id) {
//		return customerOrderRepository.findOne(id);
//	}
	
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
