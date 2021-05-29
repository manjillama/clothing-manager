package com.manager.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manager.app.models.Customer;
import com.manager.app.repository.CustomerRepository;

@Controller
@RequestMapping("/view/customer")
public class ViewCustomerController {
	@Autowired
	CustomerRepository customerRepository;
	
	@GetMapping("/{id}")
	public String viewCustomer(Model model, @PathVariable int id) {
		Customer customer = customerRepository.findOne(id);
		try {
			model.addAttribute("itemsCount", customer.getCustomerOrders().stream().mapToInt(i -> i.getCustomerOrderItems().stream().mapToInt(item -> item.getQuantity()).sum()).sum());
			model.addAttribute("totalSpending", customer.getCustomerOrders().stream().mapToInt(i -> i.getGrandTotal()).sum());
			model.addAttribute("countReferrals", customerRepository.countByReferrerId(id));
			model.addAttribute("customer", customer);
		}catch(NullPointerException ex) {
			return "redirect:/error";
		}
		return "customer/view";
	}
	
	@GetMapping("/referral/{customerId}")
	public String viewReferrals(Model model, @PathVariable("customerId") int id) {
		List<Customer> referrals = customerRepository.findByReferrerId(id);
		model.addAttribute("customer", customerRepository.findOne(id));
		model.addAttribute("referralsCount", referrals.size());
		model.addAttribute("referrals", referrals);
		return "customer/referrals";
	}
}
