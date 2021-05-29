package com.manager.app.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.manager.app.models.Customer;
import com.manager.app.models.Referrals;
import com.manager.app.repository.CustomerRepository;

@Controller
@RequestMapping("/referrals")
public class ReferralController {
	@Autowired
	CustomerRepository customerReposity;
	
	@GetMapping()
	public String home(Model model) {
		List<Customer> customers = customerReposity.findByReferralPendingTrueOrderByJoinedDateDesc();
		List<Referrals> referrals = new ArrayList<>();
		for(Customer c: customers){
			Referrals r = new Referrals();
			r.setCustomer(c);
			r.setReferredBy(customerReposity.findOne(c.getReferrerId()));
			referrals.add(r);
		}
		model.addAttribute("referralCount", referrals.size());
		model.addAttribute("referrals", referrals);
		return "referrals";
	}
	
	
	@GetMapping("/resolve")
	public String resolveView(Model model, @RequestParam int referredBy_id){
		model.addAttribute("customer", customerReposity.findOne(referredBy_id));
		return "resolveReferral";
	}
	
	@PostMapping("/resolve")
	public String resolveView(
			@RequestParam int referredTo_id,
			@ModelAttribute("customer") Customer customer){
		Customer c = customerReposity.findOne(customer.getId());
		c.setCredits(customer.getCredits());
		customerReposity.save(c);
		
		Customer c2 = customerReposity.findOne(referredTo_id);
		c2.setReferralPending(false);
		customerReposity.save(c2);
		
		return "redirect:/view/customer/"+customer.getId()+"?success";
	}
	
	
	

}

