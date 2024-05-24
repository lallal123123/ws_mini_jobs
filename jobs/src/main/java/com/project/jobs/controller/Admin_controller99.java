package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dao.IAdminDao99;
import com.project.jobs.dao.ICS_Dao99;
import com.project.jobs.dao.ICom_community_dao92;
import com.project.jobs.dao.IMem_community_dao92;
import com.project.jobs.dao.INotice_Dao99;
import com.project.jobs.dto.Cs_question;
import com.project.jobs.dto.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin99")
public class Admin_controller99 {
	
	@Autowired
	private IAdminDao99 adminDao;
	
	@Autowired
	private ICS_Dao99 cs_Dao;
	
	@Autowired
	ICom_community_dao92 comDao;
	@Autowired
	IMem_community_dao92 memDao;
	//대시보드 관련
	@RequestMapping("/getTotalRegistrations")
	public String TotalRegistrations(Model model) {
		//기업, 일반회원 가입현황
		model.addAttribute("currentMemRegist", adminDao.getCurrentMemRegist());
		model.addAttribute("pastMemRegist", adminDao.getPastMemRegist());
		model.addAttribute("currentComRegist", adminDao.getCurrentComRegist());
		model.addAttribute("pastComRegist", adminDao.getPastComRegist());
		//
		List<Cs_question> dashboardCsList = adminDao.getCsList(0L, 3L);
		for(Cs_question dto : dashboardCsList) {
			dto.setCom_id(comDao.com_id(dto.getCom_no()));
			dto.setMem_id(memDao.mem_id(dto.getMem_no()));
		}
		System.out.println(dashboardCsList);
		model.addAttribute("list", dashboardCsList);
		return "/admin/dashboard";
	}
	
	
	
	//문의사항
	@RequestMapping("/cs_request_99")
	public String csRequest(HttpServletRequest request) {
		String cs_no = request.getParameter("cs_no");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		
		cs_Dao.writeRequestDao_99(cs_no, content, title);
		return "redirect:/admin99/cs_request_detail_99?cs_no=" + cs_no;
	}
	
	@RequestMapping("/cs_request_modifyForm_99")
	public String csRequestModifyForm(Model model, HttpServletRequest request) {
		String cs_no = request.getParameter("cs_no");
		model.addAttribute("writerId", cs_Dao.getCsWriterId_99(cs_no));
		model.addAttribute("dto",cs_Dao.getlistDetail_99(cs_no));
		model.addAttribute("requestDto", cs_Dao.getRequestDao_99(cs_no));
		return "/admin/cs_request_modifyForm";
	}
	
	@RequestMapping("/cs_request_modify_99")
	public String csRequestModify(HttpServletRequest request) {
		String cs_no = request.getParameter("cs_no");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		
		cs_Dao.requestModify_99(title, content, cs_no);
		return "redirect:/admin99/cs_request_detail_99?cs_no=" + cs_no;
	}
	
	@RequestMapping("/cs_list_99")
	public String list(Model model, HttpServletRequest request) {
		
		model.addAttribute("list", cs_Dao.getList_99());
		
		return "/admin/cs_list";
	}
	
	@RequestMapping("/cs_request_detail_99")
	public String requestDetail(Model model, HttpServletRequest request) {
		String cs_no = request.getParameter("cs_no");
		model.addAttribute("dto", cs_Dao.getlistDetail_99(cs_no));
		model.addAttribute("requestDto", cs_Dao.getRequestDao_99(cs_no));
		model.addAttribute("writerId", cs_Dao.getCsWriterId_99(cs_no));
		return "/admin/cs_request_detail";
	}
	
	@RequestMapping("/cs_detail_99")
	public String csDetail(Model model, HttpServletRequest request) {
		String cs_no = request.getParameter("cs_no");
		model.addAttribute("writerId", cs_Dao.getCsWriterId_99(cs_no));
		model.addAttribute("dto",cs_Dao.getlistDetail_99(cs_no));
		return "/admin/cs_detail";
	}
	
	@RequestMapping("/delete_99")
	public String delete(HttpServletRequest request) {
		String cs_no = request.getParameter("cs_no");
		cs_Dao.deleteDao_99(cs_no);
		
		return "redirect:/admin99/cs_list_99";
	}
	
	
	@Autowired
	private INotice_Dao99 noticeDao;
	//공지사항
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
		
		return "redirect:/admin99/notice_list_99";
	}
	
	@RequestMapping("/noticeDelete_99")
	public String noticeDelete(HttpServletRequest request) {
		String notice_no = request.getParameter("notice_no");
		noticeDao.noticeDeleteDao_99(notice_no);
		return "redirect:/admin99/notice_list_99";
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
	
	@RequestMapping("/notice_list_99")
	public String noticeList(Model model, HttpSession session) {
		
		model.addAttribute("list", noticeDao.getnoticeList_99());
		return "/admin/notice_list";
	}
	
	@RequestMapping("/notice_detail_99")
	public String noticeDetailList(Model model, HttpServletRequest request, HttpSession session) {
		String notice_no = request.getParameter("notice_no");
		model.addAttribute("dto",noticeDao.getnoticeDetail_99(notice_no));
		Member member = (Member)session.getAttribute("loggedInMember");
		model.addAttribute("mem_no", member.getMem_no());
		return "/admin/notice_detail";
	}
	
	@RequestMapping("/noticeCategory_99")
	public String csCategoryList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		
		model.addAttribute("list", noticeDao.noticeCategory_99(category));
		return "/common/cs_list";
	}
	
	
	//FAQ 작성, 수정, 삭제
	@RequestMapping("/faqWriteForm")
	public String faqWriteForm() {
		
		return "/faq/faq_write_form";
	}
	
	@RequestMapping("/faqWrite")
	public String faqWrite(HttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String mem_type = request.getParameter("mem_type");
		adminDao.faqWrite(title, content, category, mem_type);
		
		return "redirect:/admin99/faqList";
	}
	
	@RequestMapping("/faqList")
	public String faqList(Model model) {
		model.addAttribute("list", adminDao.faqList());
		return "/faq/faq_admin_list";
	}
	@RequestMapping("/faqMemberList")
	public String faqMemberList(Model model) {
		
		model.addAttribute("list", adminDao.faqMemberList());
		return "/faq/faq_member_list";
	}
	
	@RequestMapping("/faqCompanyList")
	public String faqCompanyList(Model model) {
		
		model.addAttribute("list", adminDao.faqCompanyList());
		return "/faq/faq_company_list";
	}
	
	@RequestMapping("/faqCategory_99")
	public String faqCategoryList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		
		model.addAttribute("list", adminDao.faqCategory_99(category));
		return "/faq/faq_admin_list";
	}
	
	@RequestMapping("/faqDetail_99")
	public String faqDetail(Model model, HttpServletRequest request) {
		String faq_noStr = request.getParameter("faq_no");
		Long faq_no = Long.parseLong(faq_noStr);
		model.addAttribute("dto", adminDao.faqDetail(faq_no));
		return "/faq/faq_admin_detail";
	}
	
	
	
}
