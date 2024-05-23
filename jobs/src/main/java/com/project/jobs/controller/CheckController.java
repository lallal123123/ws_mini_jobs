package com.project.jobs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CheckController {

	
	@RequestMapping("/sidebar")
	public String sidebar() {
		
		return"/mypagesidebar";
	} 
	
}
