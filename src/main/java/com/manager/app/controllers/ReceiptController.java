package com.manager.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manager.app.repository.CustomerOrderRepository;

@Controller
@RequestMapping("/receipt")
public class ReceiptController {
	@Autowired
	CustomerOrderRepository orderRepository;
	
	@GetMapping("/{orderId}")
	public String home(Model model, @PathVariable int orderId) {
		model.addAttribute("order", orderRepository.findOne(orderId));
		return "receipt";
	}
}
