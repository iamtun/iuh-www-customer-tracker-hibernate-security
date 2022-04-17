package com.se.spring.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.se.spring.entity.Customer;
import com.se.spring.service.CustomerSevice;

@Controller
public class CustomerController {
	@Autowired
	private CustomerSevice customerService;
	
	@GetMapping("/")
	public String listCustomers(Model model) {
		List<Customer> customers = customerService.getCustomers();
		
		model.addAttribute("customers", customers);
		
		return "list-customers";
	}
}
