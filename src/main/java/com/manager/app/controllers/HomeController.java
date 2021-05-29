package com.manager.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.manager.app.models.CustomerOrder;
import com.manager.app.models.CustomerOrderItem;
import com.manager.app.repository.CustomerOrderItemRepository;
import com.manager.app.repository.CustomerOrderRepository;
import com.manager.app.repository.CustomerRepository;

@Controller
public class HomeController implements ErrorController{
	private static final String PATH = "/error";
	
	@Autowired
	CustomerRepository customerRepository;
	@Autowired
	CustomerOrderRepository customerOrderRepo;
	@Autowired
	CustomerOrderItemRepository customerOrderItemRepo;
	
	@GetMapping("/")
	public String home(Model model,
			@PageableDefault(size = 40) @SortDefault(sort = "id", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false) Integer order_id
			) {
		model.addAttribute("customerCount", customerRepository.count());
		model.addAttribute("pendingReferralCount", customerRepository.countByReferralPendingTrue());

		Page<CustomerOrder> orderList;

		if (order_id != null) {
			orderList = customerOrderRepo.findById(pageable, order_id);
		} else {
			orderList = customerOrderRepo.findAll(pageable);
		}
		int totalPages = orderList.getTotalPages();
		
		List<CustomerOrderItem> items = (List<CustomerOrderItem>) customerOrderItemRepo.findAll();
		
		int size = orderList.getNumberOfElements(); // Returns the total number of element in current slice
		int currentPage = orderList.getNumber() + 1; // Starts with index 0, hence +1
		
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("soldItemCount", items.stream().mapToInt(i -> i.getQuantity()).sum());
		model.addAttribute("size", size);
		model.addAttribute("currentPage", currentPage);
		List<CustomerOrder> orders = orderList.getContent();
		model.addAttribute("currentMonthOrderCount", customerOrderRepo.countOrdersOfCurrentMonth());
		model.addAttribute("orders", orders);
		
		return "home";
	}

	@RequestMapping(value = PATH)
	public String error() {
		return "404";
	}
	
	@Override
	public String getErrorPath() {
		return PATH;
	}	
}
