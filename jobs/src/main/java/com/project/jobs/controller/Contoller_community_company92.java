package com.project.jobs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dao.ICom_community_dao92;

@Controller
@RequestMapping("/community")
public class Contoller_community_company92 {

	
	@Autowired
	ICom_community_dao92 dao;
	
	@RequestMapping("/")
	public String root() {
		return "community/ex";
	}
}
