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
import com.project.jobs.service.CompanyService3854;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/companies")
public class Company_controller {

	@Autowired
	private CompanyService3854 companyService;

	@GetMapping
	public String getAllCompanies(Model model) {
		List<Company> companies = companyService.getAllCompanies();
		model.addAttribute("companies", companies);
		return "companyList";
	}

	@GetMapping("/{com_no}")
	public String getCompanyById(@PathVariable Long com_no, Model model) {
		Company company = companyService.getCompanyById(com_no);
		model.addAttribute("company", company);
		return "companyDetail";
	}

	@PostMapping("/insertCompany")
	public String insertCompany(@ModelAttribute Company company) {
		companyService.insertCompany(company);
		return "redirect:/members/loginForm";
	}

	@PostMapping("/login")
    public String login(@ModelAttribute Company company, Model model, HttpSession session) {
        Company loginCompany = companyService.findByComIdAndComPw(company.getCom_id(), company.getCom_pw());
        if (loginCompany != null) {
            session.setAttribute("loggedInCompany", loginCompany);
            return "redirect:/members/index";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다");
            return "redirect:/members/loginForm";
        }
    }

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/members/loginForm";
	}

	@GetMapping("/edit/{com_no}")
	public String editCompanyForm(@PathVariable Long com_no, Model model) {
		Company company = companyService.getCompanyById(com_no);
		model.addAttribute("company", company);
		return "editCompany";
	}

	@PostMapping("/update/{com_no}")
	public String updateCompany(@PathVariable Long com_no, @ModelAttribute Company company) {
		company.setCom_no(com_no);
		companyService.updateCompany(company);
		return "redirect:/companies";
	}

	@GetMapping("/delete/{com_no}")
	public String deleteCompany(@PathVariable Long com_no) {
		companyService.deleteCompany(com_no);
		return "redirect:/companies";
	}
}