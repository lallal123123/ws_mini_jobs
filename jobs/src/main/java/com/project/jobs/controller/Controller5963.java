package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dto.ComInfoDetail;
import com.project.jobs.dto.ComInfoJoinRecruit;
import com.project.jobs.dto.Com_detail;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.Region;
import com.project.jobs.service.CompanyService5963;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



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
	@RequestMapping("/getComInfoJoinRecruitAllListt")
	public String getComInfoJoinRecruitAllList(Long com_no, Model model) {
		System.out.println("공고 번호로 리스트 출력 접근");
		System.out.println("com_no: " + com_no);
	
		//List<Recruit> comRecruitAllList = companyService.getComRecruitAllList(com_no);
		//model.addAttribute("list", comRecruitAllList);
		List<ComInfoJoinRecruit> comInfoJoinRecruitAllList = companyService.comInfoJoinRecruitList(com_no);
		model.addAttribute("comInfoJoinRecruitAllList", comInfoJoinRecruitAllList);
		
		return "/company/mypage/recruit_list";
	}
	
	
	// 기업 마이페이지 기업소개 디테일 페이지 접속
	@RequestMapping("/info_detail")
	public String infoDetail(HttpServletRequest request, Model model) {
		System.out.println("공고 디테일페이지 접속");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();
		ComInfoDetail comInfoDetail = companyService.getComInfoDetail(com_no);
		model.addAttribute("comInfoDetail", comInfoDetail);
		return "/company/mypage/info_detail";
	}
	
	// 기업 마이페이지 기업소개 작성 페이지 접속
	@RequestMapping("/info_write_form")
	public String infoWriteForm(HttpServletRequest request,Model model) {
		System.out.println("공고 소개 작성페이지 접속");
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("loggedInCompany"));
		model.addAttribute("company",session.getAttribute("loggedInCompany"));
		
		return "/company/mypage/info_write_form";
	}
	
	// 기업 마이페이지 기업소개 작성
	@RequestMapping("/infoWrite")
	public String infoWrite(Com_detail com_detail) {
		System.out.println("공고 소개 작성 중");
		companyService.comInfoWrite(com_detail);
		
		return "redirect:/company/mypage/info_detail";
	}
	
}

