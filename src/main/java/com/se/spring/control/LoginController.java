package com.se.spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/showLoginPage")
	public String showLoginPage() {
		return "plain-login";
	}
	
	@GetMapping("/home-page") 
	public String showHomePage() {
		return "home-page";
	}
}
