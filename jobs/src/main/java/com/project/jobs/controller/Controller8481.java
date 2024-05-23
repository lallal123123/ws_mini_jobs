package com.project.jobs.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.jobs.dao.IMember_resume8481;
import com.project.jobs.dto.Career;
import com.project.jobs.dto.Education;
import com.project.jobs.dto.Free_resume;
import com.project.jobs.dto.Free_resume_file;
import com.project.jobs.dto.License;
import com.project.jobs.dto.Member;
import com.project.jobs.dto.Site_resume;
import com.project.jobs.dto.Site_resume_file;
import com.project.jobs.service.Site_resumeService8481;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/resume")
public class Controller8481 {
	@Autowired
	IMember_resume8481 dao;
	@Autowired
	Site_resumeService8481 srs;
	
	@RequestMapping("/member/index")
	public String index() {
		
		return "/member/ex";
	}
	
	//이력서 작성폼
	@RequestMapping("/member_mypage_resume_writeform")
	public String site_resume_wirteform(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("member", session.getAttribute("loggedInMember"));
		
		return"/member/member_mypage_resume_writeform";
	}
	
	@RequestMapping("/member_mypage_resume_write")
	public String site_resume_wirte(Career car_dto, License lic_dto, Education edu_dto, Site_resume_file site_reusme_file) {
		System.out.println("공고 소개 작성 중");
		
	
		Site_resume site_resume = new Site_resume();
		site_resume.setS_resume_no(site_reusme_file.getS_resume_no());
		site_resume.setMem_no(site_reusme_file.getMem_no());
		site_resume.setHope_job(site_reusme_file.getHope_job());
		site_resume.setAddr(site_reusme_file.getAddr());
		site_resume.setPart(site_reusme_file.getPart());
		site_resume.setMilitary(site_reusme_file.getMilitary());
		site_resume.setMotive(site_reusme_file.getMotive());
		site_resume.setPersonality(site_reusme_file.getPersonality());
		site_resume.setAspiration(site_reusme_file.getAspiration());
		site_resume.setGrowth(site_reusme_file.getGrowth());
		site_resume.setTitle(site_reusme_file.getTitle());
		site_resume.setSite_res_name(site_reusme_file.getSite_res_name());
		String originName = site_reusme_file.getFileName();
		String originName1 = site_reusme_file.getFileName1();
		
		String newName = UUID.randomUUID().toString() + "_" + originName;
		String newName1 = UUID.randomUUID().toString() + "_" + originName1;
		
		site_resume.setImg_url(newName);
		site_resume.setEtc(newName1);
		
		
		File file = new File(site_resume.getImg_url());
		File file1 = new File(site_resume.getEtc());
		 
		try {
			site_reusme_file.getImg_url().transferTo(file);
			site_reusme_file.getEtc().transferTo(file1);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
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
			
		//4번들어간 문제를 수정한 작업x
		
		if(lic_dto.getLicense_name().equals("") && car_dto.getCompany().equals("") && edu_dto.getGrades().equals("")) {
		srs.insertfk(site_resume);
	}else if(lic_dto.getLicense_name().equals("") &&  car_dto.getCompany().equals("")) {
		srs.insertfk(site_resume,edu_dto);
	}else if(lic_dto.getLicense_name().equals("") && edu_dto.getGrades().equals("")) {
		srs.insertfk(site_resume,car_dto);
	}else if( car_dto.getCompany().equals("") && edu_dto.getGrades().equals("")) {
		srs.insertfk(site_resume,lic_dto);
	}else if( car_dto.getCompany().equals("")) {
		srs.insertfk(site_resume,lic_dto,edu_dto);
	}else if(edu_dto.getGrades().equals("")) {
		srs.insertfk(site_resume,lic_dto,car_dto);
	}else if(lic_dto.getLicense_name().equals("")) {
		srs.insertfk(site_resume,car_dto,edu_dto);
	}else {
		srs.insertfk(site_resume,  lic_dto,  car_dto,  edu_dto);
	}
		
		System.out.println(site_resume);
		
		return "redirect:/resume/member_mypage_resume_list";//이력서 작성후 어디로 보낼지 (고민해봐야)
		
	}
	//자유이력서폼
	@RequestMapping("/member_mypage_resume_freeform")
	public String sitefree_resume_write(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("member", session.getAttribute("loggedInMember"));
		
		return "/member/member_mypage_resume_freeform";
	}
	//자유이력서 등록
	@RequestMapping("/member_mypage_resume_free")
	public String free_resume_write(HttpServletRequest request, Free_resume_file free_resume_file) {
			
		Free_resume free_resume = new Free_resume();
		free_resume.setR_resume_no(free_resume_file.getR_resume_no());
		free_resume.setMem_no(free_resume_file.getMem_no());
		//System.out.println("memno" + free_resume.getMem_no());
		free_resume.setTitle(free_resume_file.getTitle());
		free_resume.setUrl(free_resume_file.getUrl());
		String originName= free_resume_file.getFileName();
		
		String newName = UUID.randomUUID().toString() + "_" + originName;
		free_resume.setFile(newName);
		//System.out.println(originName);
		//System.out.println(newName);
		
		//System.out.println(free_resume_file);
		//System.out.println(free_resume);
		
		File file = new File(free_resume.getFile());
		try {
			free_resume_file.getFile().transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		srs.freeResumeWrite(free_resume);
		
		return "redirect:/resume/member_mypage_resume_list";
	}

	//마이페이지 이력서 리스트 
	@RequestMapping("/member_mypage_resume_list")
	public String resumeList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loggedInMember");
		Long mem_no = member.getMem_no();
				
		model.addAttribute("member", session.getAttribute("loggedInMember"));
		
		
		List<Site_resume> siteResumeList = srs.getSiteResumeList(mem_no);
		List<Free_resume> freeResumeList = srs.getFreeResumeList(mem_no);
		System.out.println(siteResumeList);
		System.out.println(freeResumeList);
		
		model.addAttribute("siteList", siteResumeList);
		model.addAttribute("freeList", freeResumeList);
		return"/member/member_mypage_resume_list";
	}
	
	//마이페이지 이력서 삭제(사이트 이력서)
	@RequestMapping("/member_mypage_resume_sitelist")
	public String siteResumeDelete(@RequestParam("s_resume_no")Long s_resume_no) {
		srs.deleteSiteResume(s_resume_no);
		
		return "redirect:/resume/member_mypage_resume_list";
	}
	//마이페이지 이력서 삭제(자유 이력서)
	@RequestMapping("/member_mypage_resume_freedelete")
	public String freeResumeDelete(@RequestParam("r_resume_no")Long r_resume_no) {
		srs.deleteFreeResume(r_resume_no);
		
		
		return "redirect:/resume/member_mypage_resume_list";
	}
	
}
