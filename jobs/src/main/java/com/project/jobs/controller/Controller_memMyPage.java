package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jobs.dto.Free_resume;
import com.project.jobs.dto.MemRecruitApply;
import com.project.jobs.dto.Member;
import com.project.jobs.dto.Site_resume;
import com.project.jobs.service.MemberService5963;
import com.project.jobs.service.Site_resumeService8481;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/members/mypage")
public class Controller_memMyPage {

	@Autowired
	MemberService5963 memberService;
	@Autowired
	Site_resumeService8481 srs;
	
	
	//구직자 마이페이지 마이홈
	@RequestMapping("/myhome")
	public String myPageHome(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loggedInMember");
		Long mem_no = member.getMem_no();
		model.addAttribute("member", session.getAttribute("loggedInMember"));
		List<MemRecruitApply> memRecruitApplyList = memberService.getMemRecruitApplyList(mem_no);
		model.addAttribute("memRecruitApplyList", memRecruitApplyList);
		

		//이력서 내역
		List<Site_resume> siteResumeList = srs.getSiteResumeList(mem_no);
		System.out.println("이거 나와여햐느ㅜ"+ siteResumeList);
		model.addAttribute("siteList", siteResumeList);
		
		
		return"/member/myPage_home";
	}
	
}
