package com.springmvnv0.SpringMvnPro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	// add request mapping for /leaders
	@RequestMapping("/leaders")
	public String showLeaders() {
		return "leaders";
	}	
}
