package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jobs.dao.IInterest_dao92;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Mem_interest;
import com.project.jobs.dto.Member;
import com.project.jobs.dto.Site_resume;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/interest92")
public class Controller_interest92 {

	@Autowired
	IInterest_dao92 dao;
	
	@RequestMapping("/memInterestList")
	public String memInterestList(HttpSession session,Model model) {
		Company com = (Company)session.getAttribute("loggedInCompany");
		List<Mem_interest> milist =dao.mem_interestList(com.getCom_no());
		List<Member>  mlistAll = dao.memberListAll();
		List<Site_resume> srlistAll =dao.site_resumeListLast1();
		for(Mem_interest dto : milist){
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
				}
			}
			
		}
		model.addAttribute("list", milist);
		return "/mInterest/memberInterestList";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("no") String no) {
		dao.deleteMemInterest(no);
		return "redirect:memInterestList";
	}
	
	
}
