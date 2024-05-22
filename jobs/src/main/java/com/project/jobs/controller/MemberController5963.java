package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.jobs.dto.Free_resume;
import com.project.jobs.dto.MemRecruitApply;
import com.project.jobs.dto.MemRecruitScrap;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Member;
import com.project.jobs.dto.Site_resume;
import com.project.jobs.service.MemberService5963;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/member")
public class MemberController5963 {

	@Autowired
	MemberService5963 memberService;
	
	// 개인회원 스크랩한 공고 리스트 
	@RequestMapping("/recruitScrapList")
	public String recruitScrapList(HttpServletRequest request, Model model) {
		System.out.println("스크랩 공고 리스트 페이지 가기");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loggedInMember");
		Long mem_no = member.getMem_no();
		List<MemRecruitScrap> memRecruitScrapList = memberService.getMemRecruitScrapList(mem_no);
		model.addAttribute("memRecruitScrapList", memRecruitScrapList);
		return "/member/recruit_scrap_list";
	}
	
	// 개인회원 공고 스크랩하기
	@RequestMapping("/addRecruitScrap")
	public String addRecruitScrap(HttpServletRequest request, @RequestParam("recruit_no")Long recruit_no) {
		System.out.println("스크랩 공고 하기");
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loggedInMember");
		Long mem_no = member.getMem_no();
		
		memberService.addRecruitScrap(mem_no, recruit_no);
		
		return "redirect:/member/recruitScrapList";
	}
	
	// 개인회원 스크랩 공고 삭제하기
	@RequestMapping("/deleteRecruitScrap")
	public String deleteRecruitScrap(@RequestParam("s_recruit_no")Long s_recruit_no) {
		System.out.println("스크랩 공고 삭제하기");
		memberService.deleteRecruitScrap(s_recruit_no);
		
		return "redirect:/member/recruitScrapList";
	}
	
	
	// 개인회원 이력서 리스트 가져오기
	@RequestMapping("/recruitApplyList")
	public @ResponseBody String recruitApplyList(@RequestParam("mem_no") Long mem_no) {
		System.out.println("개인회원 이력서 리스트 가져오기");
				
		List<Site_resume> siteResumeList = memberService.getSiteResumeList(mem_no);
		Gson gson = new Gson();
		System.out.println("gson___"+ gson.toJson(siteResumeList));
		String result = gson.toJson(siteResumeList);
	
		return result;
	}
	
	
	// 해당 이력서로 공고 지원하기
	@RequestMapping("/applyRecruit")
	public String applyRecruit(HttpServletRequest request, @RequestParam("mem_no") Long mem_no, @RequestParam("recruit_no")Long recruit_no, @RequestParam("s_recruit_no") Long s_recruit_no){
		System.out.println("이력서로 공고 지원하기");
		memberService.applyRecruit(mem_no, recruit_no, s_recruit_no);
		
		return "redirect:/member/getMemRecruitApplyList";
	}
	
	// 지원한 공고 리스트 가기
	@RequestMapping("/getMemRecruitApplyList")
	public String getMemRecruitApplyList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loggedInMember");
		Long mem_no = member.getMem_no();
		List<MemRecruitApply> memRecruitApplyList = memberService.getMemRecruitApplyList(mem_no);
		model.addAttribute("memRecruitApplyList", memRecruitApplyList);
		return "/member/recruit_apply_list";
	}
	
	// 지원한 공고 취소하기
	@RequestMapping("/deleteRecruitApply")
	public String deleteRecruitApply(@RequestParam("mem_recruit_no")Long mem_recruit_no) {
		System.out.println("공고 지원 취소");
		memberService.deleteRecruitApply(mem_recruit_no);
		return "redirect:/member/getMemRecruitApplyList";
	}
}




