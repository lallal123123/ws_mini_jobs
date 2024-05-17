package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.Region;
import com.project.jobs.service.CompanyService5963;



@Controller
@RequestMapping("/company/mypage")
public class Controller5963 {

	@Autowired
	CompanyService5963 companyService;
	
	//공고 등록 폼 이동
	@RequestMapping("/recruit_write_form")
	public String recruitWriteForm(Model model) {
	    System.out.println("공고 등록 폼에 접근");
	    List<Region> regionList = companyService.getRegion();
	    model.addAttribute("regionList", regionList);
	
	    return "company/mypage/recruit_write_form";
	}

	//공고 등록하기
	@RequestMapping("/registRecruit")
	public String registRecruit(Recruit recruit, Model model) {
		System.out.println("공고 등록하기에 접근");
		System.out.println("getCom_no: " + recruit.getCom_no());
		System.out.println("getDeadline_date : " + recruit.getDeadline_date());
		companyService.registRecruit(recruit);
		model.addAttribute("com_no", recruit.getCom_no());
		
		return "/company/mypage/getComRecruitAllList";
	}
	
	//com_no로 공고 리스트
	@RequestMapping("/getComRecruitAllList")
	public String getComRecruitAllList(int com_no, Model model) {
		System.out.println("공고 번호로 리스트 출력 접근");
		System.out.println("com_no: " + com_no);
		List<Recruit> comRecruitAllList = companyService.getComRecruitAllList(com_no);
		model.addAttribute("list", comRecruitAllList);
		
		return "/company/mypage/recruit_list";
	}
	
}

