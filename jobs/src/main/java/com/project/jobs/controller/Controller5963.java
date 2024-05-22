package com.project.jobs.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jobs.dao.IInterest_dao92;
import com.project.jobs.dto.ComInfoDetail;
import com.project.jobs.dto.Com_detail;
import com.project.jobs.dto.Com_detail_file;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Mem_interest;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.RecruitByMemResume;
import com.project.jobs.dto.RecruitDetail;
import com.project.jobs.dto.Region;
import com.project.jobs.dto.SiteMemByresume;
import com.project.jobs.service.CompanyService5963;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company/mypage")
public class Controller5963 {

	@Autowired
	CompanyService5963 companyService;
	@Autowired
	IInterest_dao92 dao92;

	// 공고 등록 폼 이동
	@RequestMapping("/recruit_write_form")
	public String recruitWriteForm(HttpServletRequest request, Model model) {
		System.out.println("공고 등록 폼에 접근");
		List<Region> regionList = companyService.getRegion();
		model.addAttribute("regionList", regionList);
		HttpSession session = request.getSession();
		model.addAttribute("company", session.getAttribute("loggedInCompany"));
		return "company/mypage/recruit_write_form";
	}

	// 공고 등록하기
	@RequestMapping("/registRecruit")
	public String registRecruit(Recruit recruit, Model model) {
		System.out.println("공고 등록하기에 접근");

		System.out.println("getCom_no: " + recruit.getCom_no());
		System.out.println("getDeadline_date : " + recruit.getDeadline_date());
		companyService.registRecruit(recruit);
		model.addAttribute("com_no", recruit.getCom_no());

		return "redirect:/company/mypage/getComRecruitList";
	}

	// 공고 수정 페이지 접속하기
	@RequestMapping("/recruit_modify_form")
	public String recruitModifyForm(HttpServletRequest request, @RequestParam("recruit_no") Long recruit_no,
			Model model) {
		System.out.println("공고 수정하기 접근");
		List<Region> regionList = companyService.getRegion();
		model.addAttribute("regionList", regionList);
		Recruit recruit = companyService.getRecruit(recruit_no);
		model.addAttribute("recruit", recruit);
		HttpSession session = request.getSession();
		model.addAttribute("company", session.getAttribute("loggedInCompany"));

		return "/company/mypage/recruit_modify_form";
	}

	// 공고 수정하기
	@RequestMapping("/modifyRecruit")
	public String modifyRecruit(Recruit recruit, Model model) {
		System.out.println("공고 수정하기 접근");

		companyService.modifyRecruit(recruit);
		model.addAttribute("com_no", recruit.getCom_no());
		return "redirect:/company/mypage/getComRecruitList";
	}

	// 공고 삭제하기
	@RequestMapping("/deleteRecruit")
	public String deleteRecruit(@RequestParam("recruit_no") Long recruit_no, Model model) {
		System.out.println("공고 삭제하기에 접근");

		companyService.deleteRecruit(recruit_no);

		return "redirect:/company/mypage/getComRecruitList";
	}

	// 공고 마감하기
	@RequestMapping("/updateDeadlineDate")
	public String updateDeadlineDate(@RequestParam("recruit_no") Long recruit_no) {
		companyService.updateDeadlineDate(recruit_no);
		return "redirect:/company/mypage/getComRecruitList";
	};
	
	// com_no로 공고 리스트
	@RequestMapping("/getComRecruitList")
	public String getComRecruitList(HttpServletRequest request, Model model) {
		System.out.println("공고 번호로 리스트 출력 접근");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();

		List<Recruit> recruitList = companyService.getComRecruitList(com_no);
		System.out.println(recruitList);

		for(int i = 0; i < recruitList.size(); i++) {
			Recruit recruit = recruitList.get(i);
			List<Mem_recruit> result = companyService.getMemCount(recruit.getRecruit_no());
			int memCount = result.size();
			System.out.println("getMemCount" + memCount);

			recruit.setMem_count(memCount);
		}
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String today = now.format(formatter);

		model.addAttribute("recruitList", recruitList);
		model.addAttribute("company", company);
		model.addAttribute("today", today);
		return "/company/mypage/recruit_list";
	}

	// 키워드로 공고 리스트 검색하기
	@RequestMapping("/getComRecruitListKeyword")
	public String getComRecruitListKeyword(@RequestParam("keyword") String keyword, HttpServletRequest request,
			Model model) {
		System.out.println("키워드로 공고제목 검색");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();

		List<Recruit> recruitList = companyService.getComRecruitListKeyword(com_no, keyword);
		System.out.println(recruitList);

		for (int i = 0; i < recruitList.size(); i++) {
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
	public String infoWriteForm(HttpServletRequest request, Model model) {
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
		// System.out.println(com_detail.getEstablishment());
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
		// 파일저장
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
		// 파일저장
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
	public String getRecruitMemList(@RequestParam("recruit_no")Long recruit_no, Model model,HttpSession session) {
		System.out.println("공고별 지원자 리스트 가져오기");
		List<RecruitByMemResume> recruitByMemResumelist = companyService.getRecruitMemList(recruit_no);
		//관심 구독자 기능 관련
				Company com = (Company)session.getAttribute("loggedInCompany");
				List<Mem_interest> milist= dao92.mem_interestList(com.getCom_no());
				model.addAttribute("milist", milist);
				model.addAttribute("recruit_no", recruit_no);
		
		
		for(RecruitByMemResume r :recruitByMemResumelist) {
			r.setInterest(0);
			for(Mem_interest m : milist) {
				if(r.getMem_no() == m.getMem_no()) {
					r.setInterest(1);
					break;
				}
			}
		}
		System.out.println(recruitByMemResumelist);
		model.addAttribute("list", recruitByMemResumelist);
		
		
		return "/company/mypage/mem_recruit_list";
	}

	// 공고번호로 상세 페이지 접속하기
	@RequestMapping("/recruitDetail")
	public String getRecruitDetail(@RequestParam("recruit_no") Long recruit_no, Model model) {
		RecruitDetail recruitDetail = companyService.getRecruitDetail(recruit_no);
		Long com_no = recruitDetail.getCom_no();
		Com_detail com_detail = companyService.getCom_detail(com_no);
		model.addAttribute("recruitDetail", recruitDetail);
		model.addAttribute("com_detail", com_detail);
		return "/company/mypage/recruit_detail";
	}

	// 이력서 번호로 이력서 정보 가져오기
	@RequestMapping("/getResumeDetail")
	public String getResumeDetail(@RequestParam("mem_recruit_no")Long mem_recruit_no, @RequestParam("s_resume_no") Long s_resume_no, Model model) {
		SiteMemByresume siteMemByresume = companyService.getResumeDetail(s_resume_no);
		if(mem_recruit_no != null){
			Mem_recruit mem_recruit = companyService.getMemRecruit(mem_recruit_no);
			model.addAttribute("mem_recruit_no", mem_recruit_no);
			model.addAttribute("mem_recruit", mem_recruit);
		};
		
		model.addAttribute("siteMemByresume", siteMemByresume);
		
		return "/company/mypage/resume_detail";
	}

	// 이력서 true 주기
	@RequestMapping("/updatePassTrue")
	public String updatePassTrue(@RequestParam("mem_recruit_no")Long mem_recruit_no, @RequestParam("s_resume_no")Long s_resume_no, Model model) {
		companyService.updatePassTrue(mem_recruit_no);
		System.out.println(s_resume_no);
		model.addAttribute("mem_recruit_no", mem_recruit_no);
		model.addAttribute("s_resume_no", s_resume_no);
		return "redirect:/company/mypage/getResumeDetail?mem_recruit_no=" + mem_recruit_no + "&s_resume_no=" + s_resume_no;
	};
			
	// 이력서 flase 주기
	@RequestMapping("/updatePassFalse")
	public String updatePassFlase(@RequestParam("mem_recruit_no")Long mem_recruit_no, @RequestParam("s_resume_no")Long s_resume_no, Model model) {
		companyService.updatePassFalse(mem_recruit_no);
		System.out.println(s_resume_no);
		model.addAttribute("mem_recruit_no", mem_recruit_no);
		model.addAttribute("s_resume_no", s_resume_no);
		return "redirect:/company/mypage/getResumeDetail?mem_recruit_no=" + mem_recruit_no + "&s_resume_no=" + s_resume_no;
	};
	
	
}
