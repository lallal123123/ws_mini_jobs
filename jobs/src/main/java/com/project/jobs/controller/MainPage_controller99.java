package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jobs.dao.IAdminDao99;
import com.project.jobs.dao.IInterest_dao92;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Mem_interest;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.RecruitByMemResume;
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
	// com_no로 공고 리스트
	@RequestMapping("/com_mainPage")
	public String getComRecruitList(HttpServletRequest request, Model model) {
		//진행공고
		System.out.println("공고 번호로 리스트 출력 접근");
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("loggedInCompany");
		Long com_no = company.getCom_no();
		
		List<Recruit> recruitList = adminDao.getRecruitList_99(0L, 3L);
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
		
		
		
		
		
		return "/company/mypage/mypage3854";
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
	
}
