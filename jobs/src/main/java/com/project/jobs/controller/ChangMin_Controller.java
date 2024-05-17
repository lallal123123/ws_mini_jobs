package com.project.jobs.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.project.jobs.dto.Member;
import com.project.jobs.service.MemberService;

@Controller
@RequestMapping("/members")
public class ChangMin_Controller {

    @Autowired
    private MemberService memberService;
    
    @GetMapping("/index3854")
    public String index() {
    	return "index3854";
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
    

    @GetMapping("/new")
    public String createMemberForm(Model model) {
        model.addAttribute("member", new Member());
        return "signup"; 
    }

    @PostMapping
    public String insertMember(@ModelAttribute Member member) {
        memberService.insertMember(member);
        return "redirect:/members";
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
