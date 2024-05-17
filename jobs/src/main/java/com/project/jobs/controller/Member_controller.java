package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dto.Company;
import com.project.jobs.dto.Member;
import com.project.jobs.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/members")
public class Member_controller {

	@Autowired
	private MemberService memberService;

	@GetMapping("/index")
	public String index3854(Model model, HttpSession session) {
		Member loggedInMember = (Member) session.getAttribute("loggedInMember");
		if (loggedInMember != null) {
			model.addAttribute("welcomeMessage", "환영합니다, " + loggedInMember.getMem_id() + "!");
		}
		return "index3854"; // index3854 페이지로 이동
	}

	  @RequestMapping("/signup")
	    public String showSignupForm(Model model) {
	        model.addAttribute("member", new Member());
	        model.addAttribute("company", new Company());  // 기업 회원가입 폼을 위한 모델 추가
	        return "member/signup"; 
	    }

	 @RequestMapping("/loginForm")
	    public String loginForm(Model model) {
	        model.addAttribute("member", new Member());
	        model.addAttribute("company", new Company()); 
	        return "member/loginForm";
	    }

	@GetMapping
	public String getAllMembers(Model model) {
		List<Member> members = memberService.getAllMembers();
		model.addAttribute("members", members);
		return "memberList";
	}

	@GetMapping("/{mem_no}")
	public String getMemberById(@PathVariable Long mem_no, Model model) {
		Member member = memberService.getMemberById(mem_no);
		model.addAttribute("member", member);
		return "memberDetail";
	}

	@PostMapping("/insertMember")
	public String insertMember(@ModelAttribute Member member) {
		memberService.insertMember(member);
		return "member/loginForm";
	}

    @PostMapping("/login")
    public String login(@ModelAttribute Member member, Model model, HttpSession session) {
        Member loginMember = memberService.login(member.getMem_id(), member.getMem_pw());
        if (loginMember != null) {
            session.setAttribute("loggedInMember", loginMember);
            return "redirect:/members/index";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다");
            return "member/loginForm";
        }
    }

	
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/members/loginForm";
    }


	@GetMapping("/edit/{mem_no}")
	public String editMemberForm(@PathVariable Long mem_no, Model model) {
		Member member = memberService.getMemberById(mem_no);
		model.addAttribute("member", member);
		return "editMember";
	}

	@PostMapping("/update/{mem_no}")
	public String updateMember(@PathVariable Long mem_no, @ModelAttribute Member member) {
		member.setMem_no(mem_no);
		memberService.updateMember(member);
		return "redirect:/members";
	}

	@GetMapping("/delete/{mem_no}")
	public String deleteMember(@PathVariable Long mem_no) {
		memberService.deleteMember(mem_no);
		return "redirect:/members";
	}
}
