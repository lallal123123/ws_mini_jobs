package com.project.jobs.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jobs.dao.ICom_community_dao92;
import com.project.jobs.dto.Com_community;
import com.project.jobs.dto.Com_community_category;
import com.project.jobs.dto.Com_reply;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Pagination;
import com.project.jobs.service.CommunityPagination92;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/community")
public class Contoller_community_company92 {

	
	
	@Autowired
	ICom_community_dao92 dao;
	
	@Autowired
	CommunityPagination92 cp;
	
	@RequestMapping("/")
	public String root() {
		return "community/ex";
	}
	
	@RequestMapping("/company/main")
	public String main(Model model) {
		Long cnt = dao.countAll();
		List<Com_community> hList =dao.hotList(0L, 5L);
		model.addAttribute("hList", hList);
		model.addAttribute("cnt",cnt);
		return "community/com/main";
	}
	
	
	
	@RequestMapping("/company/list")
	public String com_list(Model model) {
		//페이지관련
		Long memoCnt = dao.countAll();
		
		List<Com_community> list;
		list = dao.list92(0L,10L);
		for(Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", cp.list(1L,memoCnt));
		return "community/com/list";
	}
	
	@RequestMapping("/company/write_form")
	public String com_write_form(Model model) {
		List<Com_community_category> clist =dao.clist();
		model.addAttribute("clist", clist);
		
		return "community/com/write_form";
	}
	
	@RequestMapping("/company/write")
	public String com_write(Com_community com_community , HttpSession session) {
		Company com = (Company)session.getAttribute("loggedInCompany");
		com_community.setCom_no(com.getCom_no());
		dao.write92(com_community);
		
		return "redirect:list";
	}
	
	@RequestMapping("/company/modify_form")
	public String com_modify_form(@RequestParam("no") String no, Model model) {
		List<Com_community_category> clist =dao.clist();
		model.addAttribute("clist", clist);
		Com_community dto = dao.detail92(no);
		model.addAttribute("dto", dto);
		return "community/com/modify_form";
	}
	
	@RequestMapping("/company/modify")
	public String com_modify(Com_community com_community , HttpSession session) {
		Company com = (Company)session.getAttribute("loggedInCompany");
		com_community.setCom_no(com.getCom_no());
		dao.modify(com_community);
		
		return "redirect:detail?no="+com_community.getCom_community_no();
	}
	
	@RequestMapping("/company/delete")
	public String com_delete(@RequestParam("no") String no ) {
		dao.delete(no);
		return "redirect:list";
	}
	
	@RequestMapping("/company/detail")
	public String com_detail(@RequestParam("no") String no,Model model) {
		dao.viewsUp(no);
		Com_community dto = dao.detail92(no);
		 // 포맷 지정
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	     // 포맷을 적용하여 날짜 문자열로 변환
	     dto.setS_reg_date(sdf.format(dto.getReg_date()));
		dto.setCom_id(dao.com_id(dto.getCom_no()));
		model.addAttribute("dto", dto);
		
		List<Com_reply> rList = dao.replyList(no);
		for(Com_reply reply : rList) {
			reply.setCom_id(dao.com_id(reply.getCom_no()));
			reply.setS_regdate(sdf.format(reply.getRegdate()));
		}
		model.addAttribute("rList", rList);
		
		return "community/com/detail";
	}
	
	@RequestMapping("/company/reply")
	public String com_reply(Com_reply com_reply) {
		dao.insert_reply(com_reply);
		return "redirect:detail?no="+com_reply.getCom_community_no();
	}
	
	@RequestMapping("/company/delete_reply")
	public String com_delete_reply(@RequestParam("no") String no, @RequestParam("community_no") String cno) {
		dao.delete_reply(no);
		return "redirect:detail?no="+cno;
	}
	
	
	
	@RequestMapping("/company/list1")
	public String list(@RequestParam("page") String page_, Model model) {
		Long page = Long.parseLong(page_);
		//필요한 메모 리스트
		List<Com_community> list;
		list = dao.list92((page-1)*10,10L);
		for(Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		Long memoCnt = dao.countAll();
		model.addAttribute("pagination", cp.list(page,memoCnt));

		return "community/com/list";
	}

	@RequestMapping("/company/pageNext")
	public String pageNext(@RequestParam("pageBlock") String pageBlock_, Model model) {
		Long memoCnt = dao.countAll();
		Long pageBlock = Long.parseLong(pageBlock_);
		Pagination pa= cp.pageNext(pageBlock,memoCnt);
		List<Com_community> list;
		list = dao.list92((pa.getPage()-1)*10,10L);
		for(Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", pa);
		return "community/com/list";
	}

	@RequestMapping("/company/pagePre")
	public String pagePre(@RequestParam("pageBlock") String pageBlock_, Model model) {
		Long memoCnt = dao.countAll();
		Long pageBlock = Long.parseLong(pageBlock_);
		Pagination pa= cp.pagePre(pageBlock,memoCnt);
		List<Com_community> list;
		list = dao.list92((pa.getPage()-1)*10,10L);
		for(Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", pa);


		return "community/com/list";
	}
	
	@RequestMapping("/company/search")
	public String search(@RequestParam("search") String search, Model model) {
		//페이지관련
				Long memoCnt = dao.searchCount(search);
				
				List<Com_community> list;
				list = dao.searchList(0L,10L,search);
				for(Com_community dto : list) {
					dto.setCom_id(dao.com_id(dto.getCom_no()));
				}
				model.addAttribute("list", list);
				model.addAttribute("pagination", cp.list(1L,memoCnt));
				model.addAttribute("search", search);
				return "community/com/list";
	}
	@RequestMapping("/company/list1S")
	public String list(@RequestParam("page") String page_,@RequestParam("search") String search, Model model) {
		Long page = Long.parseLong(page_);
		//필요한 메모 리스트
		List<Com_community> list;
		list = dao.searchList((page-1)*10,10L,search);
		for(Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		Long memoCnt = dao.searchCount(search);
		model.addAttribute("pagination", cp.list(page,memoCnt));
		model.addAttribute("search",search);

		return "community/com/list";
	}
	
	@RequestMapping("/company/pagePreS")
	public String pagePre(@RequestParam("pageBlock") String pageBlock_,@RequestParam("search") String search, Model model) {
		Long memoCnt = dao.searchCount(search);
		Long pageBlock = Long.parseLong(pageBlock_);
		Pagination pa= cp.pagePre(pageBlock,memoCnt);
		List<Com_community> list;
		list = dao.searchList((pa.getPage()-1)*10,10L,search);
		for(Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", pa);
		model.addAttribute("search", search);


		return "community/com/list";
	}
	@RequestMapping("/company/pageNextS")
	public String pageNext(@RequestParam("pageBlock") String pageBlock_,@RequestParam("search") String search, Model model) {
		Long memoCnt = dao.searchCount(search);
		Long pageBlock = Long.parseLong(pageBlock_);
		Pagination pa= cp.pageNext(pageBlock,memoCnt);
		List<Com_community> list;
		list = dao.searchList((pa.getPage()-1)*10,10L,search);
		for(Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", pa);
		model.addAttribute("search", search);
		return "community/com/list";
	}
}
