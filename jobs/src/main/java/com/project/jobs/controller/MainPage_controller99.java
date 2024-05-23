package com.project.jobs.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jobs.dao.IAdminDao99;
import com.project.jobs.dao.IInterest_dao92;
import com.project.jobs.dao.IMainPageDao99;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Mem_interest;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Member;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.RecruitByMemResume;
import com.project.jobs.dto.Site_resume;
import com.project.jobs.service.CompanyService5963;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mainPage")
public class MainPage_controller99 {
	
	@Autowired
	CompanyService5963 companyService;
	@Autowired
	IAdminDao99 adminDao;
	@Autowired
	IInterest_dao92 dao92;
	@Autowired
	IMainPageDao99 mainpageDao;
	@Autowired
	IInterest_dao92 dao;
	
	// com_no로 공고 리스트
	@RequestMapping("/com_mainPage")
	public String getComRecruitList(HttpServletRequest request, Model model) {
		//진행공고
		System.out.println("공고 번호로 리스트 출력 접근");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();
		
		List<Recruit> recruitList = mainpageDao.getRecruitStatusList99(com_no, 0L, 3L);
		System.out.println(recruitList);

		for (int i = 0; i < recruitList.size(); i++) {
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
		//공고별 지원자 리스트 가져오기
		 List<RecruitByMemResume> memRecruitList = mainpageDao.getMemRecruitSmallList_99(com_no, 0L, 3L);
		model.addAttribute("memRecruitList", memRecruitList);
		//관심있는 지원자 리스트 가져오기
		List<Mem_interest> memInterestSmallList = mainpageDao.getMemInterestSmallList99(com_no, 0L, 3L);
		List<Member>  mlistAll = dao.memberListAll();
		List<Site_resume> srlistAll =dao.site_resumeListLast1();
		for(Mem_interest dto : memInterestSmallList){
			for(Member m : mlistAll) {
				if(dto.getMem_no() == m.getMem_no()) {
					dto.setMem_name(m.getMem_name());
					dto.setMem_email(m.getMem_email());
					dto.setMem_birth(m.getMem_birth());
					dto.setMem_gender(m.getMem_gender());
				}
			}
			for(Site_resume s : srlistAll) {
				if(dto.getMem_no() == Long.parseLong(s.getMem_no())) {
					dto.setHope_job(s.getHope_job());
					dto.setPart(s.getPart());
					dto.setS_resume_no(s.getS_resume_no());
				}
			}
			
		}
		model.addAttribute("list", memInterestSmallList);
		return "/company/mypage/mypage3854";
	}
	
	
	@RequestMapping("/mem_recruit_list99")
	public String memRecruitList99(Model model, HttpSession session) {
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();
		List<RecruitByMemResume> memRecruitListAll = mainpageDao.getMemRecruitList_99(com_no);
		
		model.addAttribute("memRecruitListAll", memRecruitListAll);
		return "/company/mypage/mem_recruit_list99";
	}
	
	@RequestMapping("/delete")
	public String delete(Mem_interest mem_interest) {
		dao.deleteMemInterest(mem_interest);
		return "redirect:/mainPage/com_mainPage";
	}
	
	
}
