package com.manager.app.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.manager.app.models.Customer;
import com.manager.app.repository.CustomerOrderRepository;
import com.manager.app.services.CustomerService;

@Controller
@RequestMapping("/customers")
public class CustomerController {
	@Autowired
	CustomerService customerService;
	@Autowired
	CustomerOrderRepository customerOrderRepo;
	
	@GetMapping
	public String getCustomers(Model model,
			@PageableDefault(size = 40) @SortDefault(sort = "id", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false) String contact_no) {
		Page<Customer> customerList;

		if (contact_no != null && !contact_no.isEmpty()) {
			customerList = customerService.getByContactNumber(pageable, contact_no);
		} else {
			customerList = customerService.getAll(pageable);
		}
		int totalPages = customerList.getTotalPages();
		long totalCustomers = customerService.countAll();
		int size = customerList.getNumberOfElements(); // Returns the total number of element in current slice
		int currentPage = customerList.getNumber() + 1; // Starts with index 0, hence +1
		
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalCustomers", totalCustomers);
		model.addAttribute("size", size);
		model.addAttribute("currentPage", currentPage);
		List<Customer> customers = customerList.getContent();
		model.addAttribute("customers", customers);
		
		return "customer/customers";
	}
	
	@GetMapping("/add")
	public String addCustomer(Model model) {
		model.addAttribute("customer",new Customer());
		return "customer/post";
	}
	
	@GetMapping("/edit/{id}")
	public String customerEdit(Model model, @PathVariable int id) {
		model.addAttribute("request", "edit");
		model.addAttribute("customer", customerService.findById(id));
		return "customer/post";
	}
	
	@PostMapping("/post")
	public String customerPost(@Valid @ModelAttribute("customer") Customer customer, 
			BindingResult result, HttpServletRequest request, Model model) {
		int id = customer.getId();
		
		if(result.hasErrors()) {
			model.addAttribute("errorMsg", "Action not successful");
			// If request is coming for customer update
			if(id > 0) {
				model.addAttribute("request", "edit");
				return "customer/post";
			}
			return "customer/post";
		}
		
		if(id > 0) {
			// Update Existing Customer
			customer.setCustomerOrders(customerOrderRepo.findByCustomerId(id));
			customerService.save(customer);
		}else {
			if(customerService.getByContactNumber(customer.getContactNumber()) == null) {
				int referrerId  = customer.getReferrerId();
				// Add New Customer if referrer id is 0 or belongs to a customer
				if( referrerId > 0 && customerService.findById(referrerId) != null) {
					customer.setReferralPending(true);
					customerService.save(customer);
				}else if( referrerId == 0) {
					customerService.save(customer);
				}else {
					model.addAttribute("errorMsg", "No referrer with that id found");
					return "customer/post";
				}
			}else {
				model.addAttribute("errorMsg", "Customer with that number already exist");
				return "customer/post";
			}
			
		}		
		return "redirect:/view/customer/"+customer.getId()+"?success";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteCustomer(@PathVariable int id) {
		customerService.deleteCustomer(id);
		return "redirect:/customers?success";
	}

}
