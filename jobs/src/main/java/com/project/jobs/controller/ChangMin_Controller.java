package com.project.jobs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dto.Member;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ChangMin_Controller {
	
	@RequestMapping("/signUp.do")
	public String sinup(HttpServletRequest request,Member member) {
		
		return "login";
	}
}
