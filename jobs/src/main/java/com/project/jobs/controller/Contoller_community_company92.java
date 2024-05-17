package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dao.ICom_community_dao92;
import com.project.jobs.dto.Com_community;

@Controller
@RequestMapping("/community")
public class Contoller_community_company92 {

	
	@Autowired
	ICom_community_dao92 dao;
	
	@RequestMapping("/")
	public String root() {
		return "community/ex";
	}
	
	@RequestMapping("/company/list")
	public String com_list(Model model) {
		List<Com_community> list =dao.list92();
		model.addAttribute("list", list);
		return "community/com/list";
	}
	
	@RequestMapping("/company/write_form")
	public String com_write_form() {
		return "community/com/write_form";
	}
	
}
