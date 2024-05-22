package com.project.jobs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.project.jobs.dto.Recruit;
import com.project.jobs.service.CompanyService3854;
import java.util.List;

@RestController
@RequestMapping("/api/jobPostings")
public class JobPostingController {

    @Autowired
    private CompanyService3854 companyService;

    @GetMapping
    public List<Recruit> getJobPostingsForInterestedCompanies(@RequestParam("mem_id") String mem_id) {
        return companyService.getJobPostingsForInterestedCompanies(mem_id);
    }
}