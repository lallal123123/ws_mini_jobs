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
import com.project.jobs.service.Site_resumeService8481;

@Controller
public class Controller8481 {
	@Autowired
	IMember_resume8481 dao;
	@Autowired
	Site_resumeService8481 srs;
	
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
		
		//mapper를 이용한 이력서 입력(fk값이 아직 들어가지않음 2024-05-20 시점)
		//dao.site_resume_write(site_res_dto);
		//dao.career_write(car_dto);
		//dao.license_write(lic_dto);
		//dao.education_write(edu_dto);
		
		//Service를 사용해 fk값을 넣는방법 시도(2024-05-20) - 디비에 값이4번 들어감
		//dao.site_resume_write(site_res_dto);
		//srs.insertFkforLicense(site_res_dto, lic_dto);
		//srs.insertFkforCareer(site_res_dto, car_dto);
		//srs.insertFkforEducation(site_res_dto, edu_dto);
		
		//4번들어간 문제를 수정한 작업
		srs.insertfk(site_res_dto, lic_dto, car_dto, edu_dto);
		
		return "redirect:/member/index";//이력서 작성후 어디로 보낼지
		
	}
	
	
	
	
}
