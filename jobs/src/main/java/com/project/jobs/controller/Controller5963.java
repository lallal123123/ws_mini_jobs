package com.project.jobs.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.jobs.dao.ICompanyDao3854;
import com.project.jobs.dto.ComInfoDetail;
import com.project.jobs.dto.ComRecruitJoinCount;
import com.project.jobs.dto.Com_detail;
import com.project.jobs.dto.Com_detail_file;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.RecruitByMemResume;
import com.project.jobs.dto.RecruitDetail;
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
	public String recruitWriteForm(HttpServletRequest request, Model model) {
	    System.out.println("공고 등록 폼에 접근");
	    List<Region> regionList = companyService.getRegion();
	    model.addAttribute("regionList", regionList);
	    HttpSession session = request.getSession();
		model.addAttribute("company", session.getAttribute("loggedInCompany"));
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
		
		return "redirect:/company/mypage/getComRecruitList";
	}
	
	//공고 삭제하기
	@RequestMapping("/deleteRecruit")
	public String deleteRecruit(@RequestParam("recruit_no")Long recruit_no, Model model) {
		System.out.println("공고 삭제하기에 접근");
		
		companyService.deleteRecruit(recruit_no);
		
		return "redirect:/company/mypage/getComRecruitList";
	}
	
	
	//com_no로 공고 리스트
	@RequestMapping("/getComRecruitList")
	public String getComRecruitList(HttpServletRequest request, Model model) {
		System.out.println("공고 번호로 리스트 출력 접근");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();
		
		List<Recruit> recruitList = companyService.getComRecruitList(com_no);
		System.out.println(recruitList);
	
		
		for(int i=0; i<recruitList.size(); i++) {
			Recruit recruit = recruitList.get(i); 
	        List<Mem_recruit> result = companyService.getMemCount(recruit.getRecruit_no());
	        int memCount = result.size();
	        System.out.println("getMemCount" + memCount);
	        
	        recruit.setMem_count(memCount);
		}
		model.addAttribute("recruitList", recruitList);
		model.addAttribute("company", company);
		return "/company/mypage/recruit_list";
	}
	
	// 키워드로 공고 리스트 검색하기
	@RequestMapping("/getComRecruitListKeyword")
	public String getComRecruitListKeyword(@RequestParam("keyword")String keyword, HttpServletRequest request, Model model) {
		System.out.println("키워드로 공고제목 검색");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();
		
		List<Recruit> recruitList = companyService.getComRecruitListKeyword(com_no, keyword);
		System.out.println(recruitList);
	
		
		for(int i=0; i<recruitList.size(); i++) {
			Recruit recruit = recruitList.get(i); 
	        List<Mem_recruit> result = companyService.getMemCount(recruit.getRecruit_no());
	        int memCount = result.size();
	        System.out.println("getMemCount" + memCount);
	        
	        recruit.setMem_count(memCount);
		}
		model.addAttribute("recruitList", recruitList);
		model.addAttribute("company", company);
	return "/company/mypage/recruit_list";
	}
		
	// 기업 마이페이지 기업소개 디테일 페이지 접속
	@RequestMapping("/info_detail")
	public String infoDetail(HttpServletRequest request, Model model) {
		System.out.println("공고 디테일페이지 접속");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();
		System.out.println("com_no : " + com_no);
		
		ComInfoDetail comInfoDetail = companyService.getComInfoDetail(com_no);
		System.out.println("comInfoDetail : " + comInfoDetail);
		model.addAttribute("comInfoDetail", comInfoDetail);
		model.addAttribute("com_detail", companyService.getCom_detail(com_no));
		System.out.println("com_detail : " + companyService.getCom_detail(com_no));
		
		return "/company/mypage/info_detail";
	}
	
	// 기업 마이페이지 기업소개 작성 페이지 접속
	@RequestMapping("/info_write_form")
	public String infoWriteForm(HttpServletRequest request,Model model) {
		System.out.println("공고 소개 작성페이지 접속");
		HttpSession session = request.getSession();
		model.addAttribute("company", session.getAttribute("loggedInCompany"));

		return "/company/mypage/info_write_form";
	}
	
	@Value("${spring.servlet.multipart.location}")
	private String uploadPath;
	
	// 기업 마이페이지 기업소개 작성
	@RequestMapping("/infoWrite")
	public String infoWrite(Com_detail_file com_detail_file) {
		System.out.println("공고 소개 작성 중");
		//System.out.println(com_detail.getEstablishment());
		System.out.println(com_detail_file);
		Com_detail com_detail = new Com_detail();
		com_detail.setCom_no(com_detail_file.getCom_no());
		com_detail.setCom_detail_no(com_detail_file.getCom_detail_no());
		com_detail.setIntroduction(com_detail_file.getIntroduction());
		com_detail.setPension(com_detail_file.getPension());
		com_detail.setCompensation(com_detail_file.getCompensation());
		com_detail.setFacilities(com_detail_file.getFacilities());
		com_detail.setPolicy(com_detail_file.getPolicy());
		com_detail.setConvenience(com_detail_file.getConvenience());
		com_detail.setSectors(com_detail_file.getSectors());
		com_detail.setP_number(com_detail_file.getP_number());
		com_detail.setEstablishment(com_detail_file.getEstablishment());
		com_detail.setHistory(com_detail_file.getHistory());
		com_detail.setIdeal_talent(com_detail_file.getIdeal_talent());
		String originName = com_detail_file.getFileName();
		
		String newName = UUID.randomUUID().toString() + "_" + originName;
		com_detail.setImg_url(newName);
		System.out.println(originName);
		System.out.println(newName);
		
		System.out.println(com_detail_file);
		System.out.println(com_detail);
		//파일저장
		File file = new File(com_detail.getImg_url());
		
		try {
			com_detail_file.getImg_url().transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		companyService.comInfoWrite(com_detail);
		
		return "redirect:/company/mypage/info_detail";
	}
	
	// 기업 마이페이지 기업소개 수정 페이지 접속
	@RequestMapping("/info_modify_form")
	public String infoModifyForm(HttpServletRequest request, Model model) {
		System.out.println("공고 소개 수정페이지 접속");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();
		ComInfoDetail comInfoDetail = companyService.getComInfoDetail(com_no);
		model.addAttribute("comInfoDetail", comInfoDetail);
			
		return "/company/mypage/info_modify_form";
	}
	
	// 기업 마이페이지 기업소개 수정
	@RequestMapping("/infoModify")
	public String infoModify(Com_detail_file com_detail_file) {
		System.out.println("공고 소개 수정 중");
		System.out.println(com_detail_file);
		Com_detail com_detail = new Com_detail();
		com_detail.setCom_no(com_detail_file.getCom_no());
		com_detail.setCom_detail_no(com_detail_file.getCom_detail_no());
		com_detail.setIntroduction(com_detail_file.getIntroduction());
		com_detail.setPension(com_detail_file.getPension());
		com_detail.setCompensation(com_detail_file.getCompensation());
		com_detail.setFacilities(com_detail_file.getFacilities());
		com_detail.setPolicy(com_detail_file.getPolicy());
		com_detail.setConvenience(com_detail_file.getConvenience());
		com_detail.setSectors(com_detail_file.getSectors());
		com_detail.setP_number(com_detail_file.getP_number());
		com_detail.setEstablishment(com_detail_file.getEstablishment());
		com_detail.setHistory(com_detail_file.getHistory());
		com_detail.setIdeal_talent(com_detail_file.getIdeal_talent());
		String originName = com_detail_file.getFileName();
		
		String newName = UUID.randomUUID().toString() + "_" + originName;
		com_detail.setImg_url(newName);
		System.out.println(originName);
		System.out.println(newName);
		
		System.out.println(com_detail_file);
		System.out.println(com_detail);
		//파일저장
		File file = new File(com_detail.getImg_url());
		
		try {
			com_detail_file.getImg_url().transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		companyService.comInfoModify(com_detail);
			
		return "redirect:/company/mypage/info_detail";
	}
	

	// 공고별 지원자 리스트 가져오기
	@RequestMapping("/mem_recruit_list")
	public String getRecruitMemList(@RequestParam("recruit_no")Long recruit_no, Model model) {
		System.out.println("공고별 지원자 리스트 가져오기");
		List<RecruitByMemResume> recruitByMemResumelist = companyService.getRecruitMemList(recruit_no);
		System.out.println(recruitByMemResumelist);
		model.addAttribute("list", recruitByMemResumelist);
		return "/company/mypage/mem_recruit_list";
	}
	
	// 공고번호로 상세 페이지 접속하기
	@RequestMapping("/recruitDetail")
	public String getRecruitDetail(@RequestParam("recruit_no")Long recruit_no, Model model) {
		RecruitDetail recruitDetail = companyService.getRecruitDetail(recruit_no);
		Long com_no = recruitDetail.getCom_no();
		Com_detail com_detail = companyService.getCom_detail(com_no);
		model.addAttribute("recruitDetail", recruitDetail);
		model.addAttribute("com_detail", com_detail);
		return "/company/mypage/recruit_detail";
	}
	
	
	// 이력서 번호로 이력서 정보 가져오기
	@RequestMapping("/getResumeDetail")
	public String getResumeDetail(@RequestParam("s_resume_no")Long s_resume_no, Model model) {
		RecruitDetail recruitDetail = companyService.getRecruitDetail(s_resume_no);
		model.addAttribute("recruitDetail", recruitDetail);
		return "/company/mypage/recruit_detail";
	}
}

