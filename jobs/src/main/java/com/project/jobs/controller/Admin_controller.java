package com.project.jobs.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.project.jobs.dto.Company;
import com.project.jobs.dto.Member;
import com.project.jobs.service.CompanyService3854;
import com.project.jobs.service.MemberService;

@Controller
@RequestMapping("/admin")
public class Admin_controller {

    @Autowired
    private MemberService memberService;

    @Autowired
    private CompanyService3854 companyService;

    @GetMapping("/dashboard")
    public String dashboard() {
        return "admin/dashboard";
    }

    @GetMapping("/members")
    public String getAllMembersForAdmin(Model model) {
        List<Member> members = memberService.getAllMembers();
        model.addAttribute("members", members);
        return "admin/mem_list";
    }
    
    @GetMapping("/members/{mem_no}")
    public String getMemberDetailForAdmin(@PathVariable("mem_no") Long mem_no, Model model) {
        Member member = memberService.getMemberById(mem_no);
        if (member != null) {
            member.setMem_pw("*"); // 비밀번호를 * 바꿔서 출력하기!!
        }
        model.addAttribute("member", member);
        return "admin/mem_detail";
    }

    @GetMapping("/companies")
    public String getAllCompaniesForAdmin(Model model) {
        List<Company> companies = companyService.getAllCompanies();
        model.addAttribute("companies", companies);
        return "admin/com_list";
    }
    
    @GetMapping("/companies/{com_no}")
    public String getCompanyDetailForAdmin(@PathVariable("com_no") Long com_no, Model model) {
        Company company = companyService.getCompanyById(com_no);
        if (company != null) {
            company.setCom_pw("*"); 
        }
        model.addAttribute("company", company);
        return "admin/com_detail";
    }
}
