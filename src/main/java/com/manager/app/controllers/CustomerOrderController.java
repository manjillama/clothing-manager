package com.manager.app.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.manager.app.models.CustomerOrder;
import com.manager.app.models.CustomerOrderItem;
import com.manager.app.repository.CustomerOrderItemRepository;
import com.manager.app.repository.CustomerOrderRepository;
import com.manager.app.repository.CustomerRepository;

@Controller
@RequestMapping("/order")
public class CustomerOrderController {
	@Autowired
	CustomerRepository customerRepo;
	@Autowired 
	CustomerOrderRepository customerOrderRepo;
	@Autowired
	CustomerOrderItemRepository customerOrderItemRepo;
		
	@GetMapping("/{customerId}/create")
	public String createOrder(@PathVariable int customerId, @RequestParam int deliveryPrice) {
		Customer customer = customerRepo.findOne(customerId);
		CustomerOrder order = new CustomerOrder();
		
		order.setCustomer(customer);
		order.setDeliveryPrice(deliveryPrice);
		customerOrderRepo.save(order);
		
		return "redirect:/order/view/"+order.getId();
	}
	
	@GetMapping("/delete/{customerId}/{id}")
	public String deleteOrder(@PathVariable int id, @PathVariable int customerId) {
		customerOrderRepo.delete(id);
		return "redirect:/view/customer/"+customerId+"?success"; 
	}
	
	
	@GetMapping("/view/{id}")
	public String order(Model model, @PathVariable int id) {
		CustomerOrder order = customerOrderRepo.findOne(id);
		try {
			if(order == null) {
				throw new NullPointerException("Customer not found");
			}
			model.addAttribute("order", order);		
		}catch(NullPointerException ex) {
			return "redirect:/error";
		}
		return "customer/order/order";
	}
	
	@GetMapping("/item/add")
	public String addOrderItem(Model model) {
		model.addAttribute("order", new CustomerOrderItem());
		return "customer/order/post";
	}
	
	
	@PostMapping("/post")
	public String postOrder(@Valid @ModelAttribute("order") CustomerOrderItem orderItem, 
			Model model,
			BindingResult result,
			@RequestParam int order_id) {
		int id = orderItem.getId();

		if(result.hasErrors()) {
			model.addAttribute("errorMsg", "Action not successful");
			// If request is coming for customer update
			if(id > 0) {
				model.addAttribute("request", "edit");
				return "customer/order/post";
			}
			return "customer/order/post";
		}
		
		
		CustomerOrder order = customerOrderRepo.findOne(order_id);
		
		orderItem.setCustomerOrder(order);
		orderItem.setBuyingPrice(orderItem.getBuyingPrice()*orderItem.getQuantity());
		orderItem.setTotalSellingPrice(orderItem.getSellingPrice()*orderItem.getQuantity());
		
		customerOrderItemRepo.save(orderItem);
			
		order.setGrandTotal(order.getCustomerOrderItems().stream().mapToInt(i-> i.getTotalSellingPrice()-i.getDiscount()).sum() + order.getDeliveryPrice());	
		customerOrderRepo.save(order);
		
		return "redirect:/order/view/"+order_id+"?success";
	}
	
	@GetMapping("/item/delete/{orderId}/{itemId}")
	public String orderItem(@PathVariable int orderId, @PathVariable int itemId) {
		customerOrderItemRepo.delete(itemId);
		
		CustomerOrder order = customerOrderRepo.findOne(orderId);
		order.setGrandTotal(order.getCustomerOrderItems().stream().mapToInt(i-> i.getTotalSellingPrice()-i.getDiscount()).sum() + order.getDeliveryPrice());	
		customerOrderRepo.save(order);
		
		return "redirect:/order/view/"+orderId+"?success";
	}
}
