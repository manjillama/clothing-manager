package com.manager.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manager.app.models.projection.GenericGenderCount;
import com.manager.app.models.projection.GenericProductCount;
import com.manager.app.models.projection.MonthlyGenderSales;
import com.manager.app.models.projection.MonthlySales;
import com.manager.app.repository.CustomerOrderItemRepository;
import com.manager.app.repository.CustomerOrderRepository;
import com.manager.app.repository.CustomerRepository;

@Controller
@RequestMapping("/analytics")
public class AnalyticController {
	@Autowired
	CustomerOrderRepository customerOrderRepo;
	@Autowired
	CustomerRepository customerRepo;
	@Autowired
	CustomerOrderItemRepository customerOrderItemRepo;
	
	@GetMapping("/sales")
	public String analytics() {
		return "analytics/sales";
	}
	
	@GetMapping("/demographics")
	public String demographics() {
		return "analytics/demographics";
	}
	
	@GetMapping("/api/sales/{year}")
	@ResponseBody
	public List<MonthlySales> getSales(@PathVariable int year){
		return customerOrderRepo.yearSales(year);
	}
	
	@GetMapping("/api/profit/{year}")
	@ResponseBody
	public List<MonthlySales> getProfit(@PathVariable int year){
		return customerOrderRepo.yearProfit(year);
	}
	
	@GetMapping("/api/sales-gender")
	@ResponseBody
	public List<MonthlyGenderSales> getGenderSales(){
		return customerOrderRepo.currentYearGenderSales();
	}
	
	@GetMapping("/api/gender-count")
	@ResponseBody
	public List<GenericGenderCount> getGenderCount(){
		return customerRepo.getGenderCount();
	}
	
	@GetMapping("/api/item/gender-count")
	@ResponseBody
	public List<GenericGenderCount> getItemGenderCount(){
		return customerOrderItemRepo.getGenderCount();
	}
	
	@GetMapping("/men")
	public String getMen(){
		return "analytics/men";
	}
	
	@GetMapping("/women")
	public String getWomen(){
		return "analytics/women";
	}
	
	@GetMapping("/api/men/sold-item")
	@ResponseBody
	public List<GenericProductCount> getItemProductCountMen(){
		return customerOrderItemRepo.getProductCount("Men");
	}
	
	@GetMapping("/api/women/sold-item")
	@ResponseBody
	public List<GenericProductCount> getItemProductCountWomen(){
		return customerOrderItemRepo.getProductCount("Women");
	}
	
	
}
