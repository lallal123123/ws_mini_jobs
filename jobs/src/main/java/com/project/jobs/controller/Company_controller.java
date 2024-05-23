package com.project.jobs.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.project.jobs.dto.Company;
import com.project.jobs.dto.Member;
import com.project.jobs.dto.Recruit;
import com.project.jobs.service.CompanyService3854;
import com.project.jobs.service.RecruitService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/companies")
public class Company_controller {

    @Autowired
    private CompanyService3854 companyService;
    

    @Autowired
    private RecruitService recruitService;

    @GetMapping("/recruitDetail")
    public String getRecruitDetail(@RequestParam("recruit_no") Long recruit_no, Model model) {
        Recruit recruit = recruitService.getRecruitById(recruit_no);
        model.addAttribute("recruit", recruit);
        return "company/mypage/recruit_detail"; // View 파일로 이동
    }

    @GetMapping("/jobPostings")
    @ResponseBody
    public List<Recruit> getJobPostingsForInterestedCompanies(@RequestParam("mem_no") Long mem_no) {
        return companyService.getJobPostingsForInterestedCompanies(mem_no);
    }
    

    @GetMapping("/notifications")
    public SseEmitter getNotifications(@RequestParam("mem_no") Long mem_no) {
        SseEmitter emitter = new SseEmitter(Long.MAX_VALUE);

        new Thread(() -> {
            try {
                while (true) {
                    List<Recruit> jobPostings = companyService.getJobPostingsForInterestedCompanies(mem_no);
                    emitter.send(jobPostings, MediaType.APPLICATION_JSON);
                    Thread.sleep(5000); // 5초마다 새 알림 확인
                }
            } catch (IOException | InterruptedException e) {
                emitter.completeWithError(e);
            }
        }).start();

        return emitter;
    }
    
    @GetMapping
    public String getAllCompanies(Model model, HttpSession session) {
        Member loggedInMember = (Member) session.getAttribute("loggedInMember");
        Long mem_no = loggedInMember != null ? loggedInMember.getMem_no() : null;
        List<Company> companies = companyService.getAllCompaniesWithoutNotInterested(mem_no);
        model.addAttribute("companies", companies);
        return "com_list";
    }
   
    @PostMapping("/toggleInterest")
    @ResponseBody
    public String toggleInterest(@RequestParam("com_no") Long com_no, @RequestParam("action") String action, HttpSession session) {
        Member loggedInMember = (Member) session.getAttribute("loggedInMember");
        if (loggedInMember != null) {
            Long mem_no = loggedInMember.getMem_no();
            if ("add".equals(action)) {
                if (!companyService.isInterestCompany(mem_no, com_no)) {
                    companyService.addInterestCompany(mem_no, com_no);
                    if (companyService.isNotInterestCompany(mem_no, com_no)) {
                        companyService.removeNotInterestCompany(mem_no, com_no);
                    }
                }
            } else if ("remove".equals(action)) {
                if (companyService.isInterestCompany(mem_no, com_no)) {
                    companyService.removeInterestCompany(mem_no, com_no);
                }
            }
            return "success";
        }
        return "error";
    }

    @PostMapping("/toggleNotInterest")
    @ResponseBody
    public String toggleNotInterest(@RequestParam("com_no") Long com_no, @RequestParam("action") String action, HttpSession session) {
        Member loggedInMember = (Member) session.getAttribute("loggedInMember");
        if (loggedInMember != null) {
            Long mem_no = loggedInMember.getMem_no();
            if ("add".equals(action)) {
                if (!companyService.isNotInterestCompany(mem_no, com_no)) {
                    companyService.addNotInterestCompany(mem_no, com_no);
                    if (companyService.isInterestCompany(mem_no, com_no)) {
                        companyService.removeInterestCompany(mem_no, com_no);
                    }
                }
            } else if ("remove".equals(action)) {
                if (companyService.isNotInterestCompany(mem_no, com_no)) {
                    companyService.removeNotInterestCompany(mem_no, com_no);
                }
            }
            return "success";
        }
        return "error";
    }

    @GetMapping("/interestCompanies")
    public String getInterestCompanies(Model model, HttpSession session) {
        Member loggedInMember = (Member) session.getAttribute("loggedInMember");
        if (loggedInMember != null) {
            Long mem_no = loggedInMember.getMem_no();
            
            List<Company> interestCompanies = companyService.getInterestCompanies(mem_no);
            List<Company> notInterestCompanies = companyService.getNotInterestCompanies(mem_no);
            
            model.addAttribute("interestCompanies", interestCompanies);
            model.addAttribute("notInterestCompanies", notInterestCompanies);
            
            return "member/com_interest_list";
        }
        return "error";
    }

    @GetMapping("/{com_no}")
    public String getCompanyById(@PathVariable("com_no") Long com_no, Model model, HttpSession session) {
        Member loggedInMember = (Member) session.getAttribute("loggedInMember");
        Long mem_no = loggedInMember != null ? loggedInMember.getMem_no() : null;
        Company company = companyService.getCompanyById(com_no);
        if (mem_no != null) {
            boolean isInterest = companyService.isInterestCompany(mem_no, com_no);
            boolean isNotInterest = companyService.isNotInterestCompany(mem_no, com_no);
            company.setInterest(isInterest);
            company.setNotInterest(isNotInterest);
        }
        model.addAttribute("company", company);
        return "com_interest_detail";
    }


    @PostMapping("/insertCompany")
    public String insertCompany(@ModelAttribute Company company) {
        companyService.insertCompany(company);
        return "redirect:/members/loginForm";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute Company company, Model model, HttpSession session) {
        Company loginCompany = companyService.login(company);
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

    @GetMapping("/delete/{com_no}")
    public String deleteCompany(@PathVariable("com_no") Long com_no) {
        companyService.deleteCompany(com_no);
        return "redirect:/companies";
    }

    @GetMapping("/checkComId")
    @ResponseBody
    public boolean checkComId(@RequestParam(value = "com_id", required = false) String com_id) {
        if (com_id == null || com_id.trim().isEmpty()) {
            return false;
        }
        return companyService.isComIdExists(com_id);
    }

    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        Company loggedInCompany = (Company) session.getAttribute("loggedInCompany");
        if (loggedInCompany != null) {
            model.addAttribute("company", loggedInCompany);
            model.addAttribute("userName", loggedInCompany.getCom_name());
            model.addAttribute("com_no", loggedInCompany.getCom_no());
            return "company/mypage/mypage3854";
        } else {
            return "redirect:/members/loginForm";
        }
    }



    @GetMapping("/editProfile")
    public String editLoggedInCompanyForm(HttpSession session, Model model) {
        Company loggedInCompany = getLoggedInCompany(session);
        if (loggedInCompany != null) {
            model.addAttribute("company", loggedInCompany);
            return "company/mypage/myProfile3854";
        } else {
            return "redirect:/members/loginForm";
        }
    }

    @PostMapping("/updateProfile")
    public String updateLoggedInCompany(@ModelAttribute Company company, HttpSession session) {
        Company loggedInCompany = getLoggedInCompany(session);
        if (loggedInCompany != null) {
            company.setCom_no(loggedInCompany.getCom_no());
            companyService.updateCompany(company);
            session.setAttribute("loggedInCompany", company); // 업데이트된 회사 정보를 세션에 다시 저장
            return "redirect:/companies/mypage";
        } else {
            return "redirect:/members/loginForm";
        }
    }

    private Company getLoggedInCompany(HttpSession session) {
        return (Company) session.getAttribute("loggedInCompany");
    }
}


