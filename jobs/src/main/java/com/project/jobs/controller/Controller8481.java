package com.project.jobs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Controller8481 {

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
	public String site_resume_wirte(@RequestParam("hope_job") String hope_job, @RequestParam("title") String title, @RequestParam("mem_name") String mem_name, @RequestParam("img_url") String img_url, @RequestParam("addr") String addr, @RequestParam("license_name") String license_name, @RequestParam("company") String company, @RequestParam("school") String school, @RequestParam("part") String part, @RequestParam("military") String military, @RequestParam("etc") String etc, @RequestParam("Motive") String Motive, @RequestParam("Personality") String Personality, @RequestParam("Aspiration") String Aspiration, @RequestParam("Growth") String Growth) {
		
		
		
		
		return"redirect:/member/member_mypage_resume_writeform";//이력서 작성후 어디로 보낼지
	}
	
}
