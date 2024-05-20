package com.project.jobs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dao.ICS_Dao99;
import com.project.jobs.dao.INotice_Dao99;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin99")
public class Admin_controller99 {
	
	@Autowired
	private ICS_Dao99 cs_Dao;
	
	@RequestMapping("/cs_Request_99")
	public String csRequest(HttpServletRequest request) {
		String cs_no = request.getParameter("cs_no");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		
		cs_Dao.writeRequestDao_99(cs_no, content, title);
		return "redirect:/cs_detail_99?cs_no="+cs_no;
	}
	
	@Autowired
	private INotice_Dao99 noticeDao;
	
	@RequestMapping("/notice_write_form_99")
	public String noticeWriteForm() {
		
		return "/admin/notice_write_form";
	}
	
	@RequestMapping("/notice_write_99")
	public String noticeWrite(Model model, HttpServletRequest request) {
		String mem_no = request.getParameter("mem_no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		noticeDao.noticeWrite_99(mem_no, title, content, category);
		
		return "redirect:/notice_list_99";
	}
	
	@RequestMapping("/noticeDelete_99")
	public String noticeDelete(HttpServletRequest request) {
		String notice_no = request.getParameter("notice_no");
		noticeDao.noticeDeleteDao_99(notice_no);
		return "redirect:/notice_list_99";
	}
	
	@RequestMapping("/notice_modify_form")
	public String noticeModifyForm(HttpServletRequest request, Model model) {
		String notice_no = request.getParameter("notice_no");
		model.addAttribute("dto", noticeDao.getnoticeDetail_99(notice_no));
		
		return "/common/notice_modify_form";
	}
	
	@RequestMapping("/notice_modify_99")
	public String noticeModify(HttpServletRequest request) {
		String notice_no = request.getParameter("notice_no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		
		noticeDao.noticeModify_99(title, content, category, notice_no);
		return "redirect:/noticeDetail_99?notice_no=" + notice_no;
	}
}
