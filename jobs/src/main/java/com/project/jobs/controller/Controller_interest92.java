package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dao.IInterest_dao92;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Mem_interest;

import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_interest92 {

	@Autowired
	IInterest_dao92 dao;
	
	@RequestMapping("/interest92/memInterestList")
	public String memInterestList(HttpSession session,Model model) {
		Company com = (Company)session.getAttribute("loggedInCompany");
		List<Mem_interest> list =dao.memList(com.getCom_no());
		for(Mem_interest dto : list){
			
		}
		
		model.addAttribute("list", list);
		return "/mInterest/memberInterestList";
	}
	
	
}
