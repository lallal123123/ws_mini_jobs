package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dao.ICompanyDao3854;
import com.project.jobs.dto.Com_interest;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Mem_push;
import com.project.jobs.dto.Recruit;
import com.project.jobs.service.CompanyService5963;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company92")
public class Controller92_company {

	@Autowired
	CompanyService5963 companyService;
	
	@Autowired
	ICompanyDao3854 dao;
	
	//@RequestMapping("/mypage/registRecruit")
	/*
	 * public String registRecruit(Recruit recruit, Model model,HttpSession session)
	 * { System.out.println("공고 등록하기에 접근"); Company com
	 * =(Company)session.getAttribute("loggedInCompany");
	 * System.out.println("getCom_no: " + recruit.getCom_no());
	 * System.out.println("getDeadline_date : " + recruit.getDeadline_date());
	 * companyService.registRecruit(recruit); model.addAttribute("com_no",
	 * recruit.getCom_no()); List<Com_interest> ciList
	 * =dao.comInterestByCom_no(recruit.getCom_no());
	 * System.out.println("컴인터레스트"+ciList); for(Com_interest ci :ciList) { Mem_push
	 * mp = new Mem_push(); mp.setTarget_no(ci.getMem_no());
	 * mp.setContent("새로운 채용 공고입니다.");
	 * mp.setRecruit_no(dao.getRecruitNo(com.getCom_no())); dao.memPushInsert(mp); }
	 * 
	 * return "redirect:/company/mypage/getComRecruitList"; }
	 */

}
