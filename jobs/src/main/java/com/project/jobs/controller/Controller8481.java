package com.project.jobs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jobs.dao.IMember_resume8481;
import com.project.jobs.dto.Career;
import com.project.jobs.dto.Education;
import com.project.jobs.dto.License;
import com.project.jobs.dto.Site_resume;

@Controller
public class Controller8481 {
	@Autowired
	IMember_resume8481 dao;
	
	@RequestMapping("/member/index")
	public String index() {
		
		return "/member/ex";
	}
	//이력서 리스트
	@RequestMapping("/member_mypage_resume_list")
	public String site_resume() {
		
		return"member_mypage_resume_list";
	}
	//이력서 작성폼
	@RequestMapping("/member_mypage_resume_writeform")
	public String site_resume_wirteform() {
		
		
		return"/member/member_mypage_resume_writeform";
	}
	
	@RequestMapping("/member_mypage_resume_write")
	public String site_resume_wirte(Career car_dto, License lic_dto, Education edu_dto, Site_resume site_res_dto) {
		/*
		if(car_dto.getCar_join_date()==null && car_dto.getQuit_date()==null) {
			
		}else {
			dao.career_write(car_dto);
			dao.license_write(lic_dto);
			dao.education_write(edu_dto);
			dao.site_resume_write(site_res_dto);
			
			
		}
		*/
		dao.site_resume_write(site_res_dto);
		dao.career_write(car_dto);
		dao.license_write(lic_dto);
		dao.education_write(edu_dto);
		
	
		
		return "redirect:/member/index";//이력서 작성후 어디로 보낼지
		
	}
	
	
	
	
}
