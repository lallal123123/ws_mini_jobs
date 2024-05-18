package com.project.jobs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dao.ICS_Dao99;
import com.project.jobs.dto.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Common_Controller99 {
	
	@Autowired
	private ICS_Dao99 cs_Dao;
	
	//문의 신고 컨트롤러
	@RequestMapping("/common/index")
	public String root() {
		
		return "/common/write_form";
	}
	
	@RequestMapping("/write_Form_99")
	public String writeForm() {
		
		return "/common/write_form";
	}
	
	@RequestMapping("/write_99")
	public String write(HttpServletRequest request) {
		String mem_no = request.getParameter("mem_no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String ch_private = request.getParameter("ch_private");
		
		cs_Dao.writeDao_99(mem_no, title, content, category, ch_private);
		return "redirect:/cs_list_99";
	}
	
	@RequestMapping("/cs_list_99")
	public String list(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("loggedInMember");
		String mem_id = member.getMem_id();
		model.addAttribute("list", cs_Dao.getList_99());
		model.addAttribute("mem_no",mem_id);
		return "/common/cs_list";
	}
	
	@RequestMapping("/cs_detail_99")
	public String listDetail(HttpServletRequest request, Model model) {
		String cs_no = request.getParameter("cs_no");
		model.addAttribute("dto", cs_Dao.getlistDetail_99(cs_no));
		return "/common/cs_detail";
	}
	
	@RequestMapping("/modify_form_99")
	public String modifyForm(HttpServletRequest request, Model model) {
		
		String cs_no = request.getParameter("cs_no");
		model.addAttribute("dto", cs_Dao.getlistDetail_99(cs_no));
		
		return "/common/modify_form";
	}
	
	@RequestMapping("/modify_99")
	public String modify(HttpServletRequest request, Model model) {
		String cs_no = request.getParameter("cs_no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String ch_private = request.getParameter("ch_private");
		cs_Dao.modifyDao_99(title, content, category, ch_private, cs_no);
		
		return "redirect:/cs_detail_99?cs_no="+cs_no;
	}
	
	@RequestMapping("/delete_99")
	public String delete(HttpServletRequest request) {
		String cs_no = request.getParameter("cs_no");
		cs_Dao.deleteDao_99(cs_no);
		
		return "redirect:/cs_list_99";
	}
	
	
	
}
