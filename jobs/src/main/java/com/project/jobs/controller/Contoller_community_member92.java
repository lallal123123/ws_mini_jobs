package com.project.jobs.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jobs.dao.IMem_community_dao92;
import com.project.jobs.dto.Mem_community;
import com.project.jobs.dto.Mem_community_category;
import com.project.jobs.dto.Mem_reply;
import com.project.jobs.dto.Member;
import com.project.jobs.dto.Pagination;
import com.project.jobs.service.CommunityPagination92;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/community/member/")
public class Contoller_community_member92 {

	@Autowired
	IMem_community_dao92 dao;

	@Autowired
	CommunityPagination92 cp;

	@RequestMapping("/")
	public String root() {
		return "community/ex";
	}

	@RequestMapping("/main")
	public String main(Model model, @RequestParam(name = "category", required = false) String category,
			HttpSession session) {
		
		Long cnt = dao.countAll();
		List<Mem_community> hList = dao.hotList(0L, 5L);
		for (Mem_community dto : hList) {
			dto.setMem_id(dao.mem_id(dto.getMem_no()));
		};
		System.out.println(hList);
		model.addAttribute("hList", hList);
		model.addAttribute("cnt", cnt);

		List<Mem_community_category> clist = dao.clist();
		model.addAttribute("cList", clist);
		if (category != null) {
			List<Mem_community> chList = dao.chList(category, 0L, 5L);
			model.addAttribute("chList", chList);
			model.addAttribute("category", category);
		} else {
			List<Mem_community> chList = dao.chList("자유글", 0L, 5L);
			model.addAttribute("chList", chList);
			model.addAttribute("category", "자유글");
		}

		Member mem = (Member) session.getAttribute("loggedInMember");
		List<Mem_community> cwList = dao.listByMemNo(mem.getMem_no());
		System.out.println("cwListㅁㅁㅁㅁㅁㅁ" + cwList);
		int cntMemWrite = cwList.size();
		System.out.println("cntMemWrite" + cntMemWrite);
		model.addAttribute("cntMemWrite", cntMemWrite);

		List<Mem_reply> crList = dao.replyListByMemNo(mem.getMem_no());
		int cntMemReply = crList.size();
		model.addAttribute("cntMemReply", cntMemReply);

		return "community/mem/main";
	}

	@RequestMapping("/list")
	public String list(@RequestParam(name = "page", required = false) String page_,
			@RequestParam(name = "search", required = false) String search,
			@RequestParam(name = "category", required = false) String category,
			@RequestParam(name = "mem_no",required = false) String mem_no, Model model) {
		List<Mem_community_category> clist = dao.clist();
		model.addAttribute("clist", clist);
		Long page = 0L;
		if (page_ == null) {
			page = 1L;
		} else {
			page = Long.parseLong(page_);
		}
		// 필요한 메모 리스트
		List<Mem_community> list = null;
		if (search != null) {
			list = dao.searchList((page - 1) * 10, 10L, search);
		} else if (category != null) {
			list = dao.chList(category, (page - 1) * 10, 10L);
		}else if(mem_no != null) {
			list = dao.listByMemNo3((page - 1) * 10, 10L,Long.parseLong(mem_no));
		}else {
			list = dao.list92((page - 1) * 10, 10L);
		}

		for (Mem_community dto : list) {
			dto.setMem_id(dao.mem_id(dto.getMem_no()));
		}
		model.addAttribute("list", list);
		Long memoCnt;
		if (search != null) {
			memoCnt = dao.searchCount(search);
		} else if (category != null) {
			memoCnt = dao.chListCount(category);
		}else if (mem_no != null) {
			memoCnt = (long)dao.listByMemNo(Long.parseLong(mem_no)).size();
		} else {
			memoCnt = dao.countAll();
		}
		model.addAttribute("pagination", cp.list(page, memoCnt));
		//model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("category", category);
		model.addAttribute("mem_no", mem_no);
		return "community/mem/list";
	}

	@RequestMapping("/pageNext")
	public String pageNext(@RequestParam("pageBlock") String pageBlock_,
			@RequestParam(name = "search", required = false) String search,
			@RequestParam(name = "category", required = false) String category,
			@RequestParam(name = "mem_no",required = false) String mem_no,Model model) {
		List<Mem_community_category> clist = dao.clist();
		model.addAttribute("clist", clist);

		Long pageBlock = Long.parseLong(pageBlock_);
		Long memoCnt;
		if (search != null) {
			memoCnt = dao.searchCount(search);
		} else if (category != null) {
			memoCnt = dao.chListCount(category);
		}else if (mem_no != null) {
			memoCnt = (long)dao.listByMemNo(Long.parseLong(mem_no)).size();
		} else {
			memoCnt = dao.countAll();
		}
		Pagination pa = cp.pageNext(pageBlock, memoCnt);
		List<Mem_community> list;

		if (search != null) {
			list = dao.searchList((pa.getPage() - 1) * 10, 10L, search);
		} else if (category != null) {
			list = dao.chList(category, (pa.getPage() - 1) * 10, 10L);
		}else if(mem_no !=null) {
			list = dao.listByMemNo3((pa.getPage() - 1) * 10, 10L,Long.parseLong(mem_no));
		} else {
			list = dao.list92((pa.getPage() - 1) * 10, 10L);
		}
		for (Mem_community dto : list) {
			dto.setMem_id(dao.mem_id(dto.getMem_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", pa);
		model.addAttribute("search", search);
		model.addAttribute("category", category);
		model.addAttribute("mem_no", mem_no);
		return "community/mem/list";
	}

	@RequestMapping("/pagePre")
	public String pagePre(@RequestParam("pageBlock") String pageBlock_,
			@RequestParam(name = "search", required = false) String search,
			@RequestParam(name = "category", required = false) String category,
			@RequestParam(name = "mem_no",required = false) String mem_no,Model model) {
		List<Mem_community_category> clist = dao.clist();
		model.addAttribute("clist", clist);
		Long memoCnt;
		if (search != null) {
			memoCnt = dao.searchCount(search);
		} else if (category != null) {
			memoCnt = dao.chListCount(category);
		}else if (mem_no != null) {
			memoCnt = (long)dao.listByMemNo(Long.parseLong(mem_no)).size();
		} else {
			memoCnt = dao.countAll();
		}
		Long pageBlock = Long.parseLong(pageBlock_);
		Pagination pa = cp.pagePre(pageBlock, memoCnt);
		List<Mem_community> list;

		if (search != null) {
			list = dao.searchList((pa.getPage() - 1) * 10, 10L, search);
		} else if (category != null) {
			list = dao.chList(category, (pa.getPage() - 1) * 10, 10L);
		}else if(mem_no !=null) {
			list = dao.listByMemNo3((pa.getPage() - 1) * 10, 10L,Long.parseLong(mem_no));
		} else {
			list = dao.list92((pa.getPage() - 1) * 10, 10L);
		}

		for (Mem_community dto : list) {
			dto.setMem_id(dao.mem_id(dto.getMem_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", pa);
		model.addAttribute("search", search);
		model.addAttribute("category", category);
		model.addAttribute("mem_no", mem_no);

		return "community/mem/list";
	}

	@RequestMapping("/write_form")
	public String mem_write_form(Model model) {
		List<Mem_community_category> clist = dao.clist();
		model.addAttribute("clist", clist);

		return "community/mem/write_form";
	}

	@RequestMapping("/write")
	public String mem_write(Mem_community mem_community, HttpSession session) {
		Member mem = (Member) session.getAttribute("loggedInMember");
		String content = mem_community.getContent();
		content = content.replace("\n", "<br>");
		mem_community.setContent(content);
		mem_community.setMem_no(mem.getMem_no());
		dao.write92(mem_community);

		return "redirect:list";
	}

	@RequestMapping("/modify_form")
	public String mem_modify_form(@RequestParam("no") String no, Model model) {
		List<Mem_community_category> clist = dao.clist();
		model.addAttribute("clist", clist);
		Mem_community dto = dao.detail92(no);
		model.addAttribute("dto", dto);
		return "community/mem/modify_form";
	}

	@RequestMapping("/modify")
	public String mem_modify(Mem_community mem_community, HttpSession session) {
		Member mem = (Member) session.getAttribute("loggedInMember");
		mem_community.setMem_no(mem.getMem_no());
		dao.modify(mem_community);

		return "redirect:detail?no=" + mem_community.getMem_community_no();
	}

	@RequestMapping("/delete")
	public String mem_delete(@RequestParam("no") String no) {
		dao.delete(no);
		return "redirect:list";
	}

	@RequestMapping("/detail")
	public String mem_detail(@RequestParam("no") String no, Model model) {
		dao.viewsUp(no);
		Mem_community dto = dao.detail92(no);
		// 포맷 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// 포맷을 적용하여 날짜 문자열로 변환
		if(dto.getReg_date()!=null) {
		dto.setS_reg_date(sdf.format(dto.getReg_date()));
		}
		dto.setMem_id(dao.mem_id(dto.getMem_no()));
		model.addAttribute("dto", dto);

		List<Mem_reply> rList = dao.replyByNo(no);
		for (Mem_reply reply : rList) {
			reply.setMem_id(dao.mem_id(reply.getMem_no()));
			reply.setS_regdate(sdf.format(reply.getReg_date()));
		}
		model.addAttribute("rList", rList);

		return "community/mem/detail";
	}

	@RequestMapping("/reply")
	public String mem_reply(Mem_reply mem_reply) {
		dao.insert_reply(mem_reply);
		return "redirect:detail?no=" + mem_reply.getMem_community_no();
	}

	@RequestMapping("/delete_reply")
	public String mem_delete_reply(@RequestParam("no") String no, @RequestParam("community_no") String cno) {
		dao.delete_reply(no);
		return "redirect:detail?no=" + cno;
	}

	/*
	 * @RequestMapping("/company/search") public String
	 * search(@RequestParam("search") String search, Model model) {
	 * List<Com_community_category> clist = dao.clist(); model.addAttribute("clist",
	 * clist); // 페이지관련 Long memoCnt = dao.searchCount(search);
	 * 
	 * List<Com_community> list; list = dao.searchList(0L, 10L, search); for
	 * (Com_community dto : list) { dto.setCom_id(dao.com_id(dto.getCom_no())); }
	 * model.addAttribute("list", list); model.addAttribute("pagination",
	 * cp.list(1L, memoCnt)); model.addAttribute("search", search); return
	 * "community/com/list"; }
	 * 
	 * @RequestMapping("/company/list1S") public String list(@RequestParam("page")
	 * String page_, @RequestParam("search") String search, Model model) {
	 * List<Com_community_category> clist = dao.clist(); model.addAttribute("clist",
	 * clist); Long page = Long.parseLong(page_); // 필요한 메모 리스트 List<Com_community>
	 * list; list = dao.searchList((page - 1) * 10, 10L, search); for (Com_community
	 * dto : list) { dto.setCom_id(dao.com_id(dto.getCom_no())); }
	 * model.addAttribute("list", list); Long memoCnt = dao.searchCount(search);
	 * model.addAttribute("pagination", cp.list(page, memoCnt));
	 * model.addAttribute("search", search);
	 * 
	 * return "community/com/list"; }
	 */
	/*
	@RequestMapping("/company/pagePreS")
	public String pagePre(@RequestParam("pageBlock") String pageBlock_, @RequestParam("search") String search,
			Model model) {
		List<Com_community_category> clist = dao.clist();
		model.addAttribute("clist", clist);
		Long memoCnt = dao.searchCount(search);
		Long pageBlock = Long.parseLong(pageBlock_);
		Pagination pa = cp.pagePre(pageBlock, memoCnt);
		List<Com_community> list;
		list = dao.searchList((pa.getPage() - 1) * 10, 10L, search);
		for (Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", pa);
		model.addAttribute("search", search);

		return "community/com/list";
	}
	*/
	/*
	 * @RequestMapping("/company/pageNextS") public String
	 * pageNext(@RequestParam("pageBlock") String
	 * pageBlock_, @RequestParam("search") String search, Model model) {
	 * List<Com_community_category> clist = dao.clist(); model.addAttribute("clist",
	 * clist); Long memoCnt = dao.searchCount(search); Long pageBlock =
	 * Long.parseLong(pageBlock_); Pagination pa = cp.pageNext(pageBlock, memoCnt);
	 * List<Com_community> list; list = dao.searchList((pa.getPage() - 1) * 10, 10L,
	 * search); for (Com_community dto : list) {
	 * dto.setCom_id(dao.com_id(dto.getCom_no())); } model.addAttribute("list",
	 * list); model.addAttribute("pagination", pa); model.addAttribute("search",
	 * search); return "community/com/list"; }
	 */

	/*
	 * @RequestMapping("/company/listC") public String
	 * categoryList(@RequestParam("category") String category, Model model) {
	 * List<Com_community_category> clist = dao.clist(); model.addAttribute("clist",
	 * clist); // 페이지관련 Long memoCnt = dao.chListCount(category);
	 * 
	 * List<Com_community> list; list = dao.chList( category,0L, 10L); for
	 * (Com_community dto : list) { dto.setCom_id(dao.com_id(dto.getCom_no())); }
	 * model.addAttribute("list", list); model.addAttribute("pagination",
	 * cp.list(1L, memoCnt)); model.addAttribute("category", category); return
	 * "community/com/list"; }
	 * 
	 * @RequestMapping("/company/list1C") public String listC(@RequestParam("page")
	 * String page_,@RequestParam("category") String category, Model model) {
	 * List<Com_community_category> clist = dao.clist(); model.addAttribute("clist",
	 * clist); Long page = Long.parseLong(page_); // 필요한 메모 리스트 List<Com_community>
	 * list; list = dao.chList(category,(page - 1) * 10, 10L); for (Com_community
	 * dto : list) { dto.setCom_id(dao.com_id(dto.getCom_no())); }
	 * model.addAttribute("list", list); Long memoCnt = dao.chListCount(category);
	 * model.addAttribute("pagination", cp.list(page, memoCnt));
	 * model.addAttribute("category", category); System.out.println("ccc"+category);
	 * 
	 * return "community/com/list"; }
	 */
	/*
	@RequestMapping("/company/pagePreC")
	public String pagePreC(@RequestParam("pageBlock") String pageBlock_, @RequestParam("category") String category,
			Model model) {
		List<Com_community_category> clist = dao.clist();
		model.addAttribute("clist", clist);
		Long memoCnt = dao.chListCount(category);
		Long pageBlock = Long.parseLong(pageBlock_);
		Pagination pa = cp.pagePre(pageBlock, memoCnt);
		List<Com_community> list;
		list = dao.chList(category, (pa.getPage() - 1) * 10, 10L);
		for (Com_community dto : list) {
			dto.setCom_id(dao.com_id(dto.getCom_no()));
		}
		model.addAttribute("list", list);
		model.addAttribute("pagination", pa);
		model.addAttribute("category", category);

		return "community/com/list";
	}
	*/
	/*
	 * @RequestMapping("/company/pageNextC") public String
	 * pageNextC(@RequestParam("pageBlock") String
	 * pageBlock_,@RequestParam("category") String category, Model model) {
	 * List<Com_community_category> clist = dao.clist(); model.addAttribute("clist",
	 * clist); Long memoCnt = dao.chListCount(category); Long pageBlock =
	 * Long.parseLong(pageBlock_); Pagination pa = cp.pageNext(pageBlock, memoCnt);
	 * List<Com_community> list; list = dao.chList(category,(pa.getPage() - 1) * 10,
	 * 10L); for (Com_community dto : list) {
	 * dto.setCom_id(dao.com_id(dto.getCom_no())); } model.addAttribute("list",
	 * list); model.addAttribute("pagination", pa); model.addAttribute("category",
	 * category); return "community/com/list"; }
	 */
}
