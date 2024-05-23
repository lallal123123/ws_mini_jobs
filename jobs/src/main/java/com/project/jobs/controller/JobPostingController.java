package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.jobs.dao.ICompanyDao3854;
import com.project.jobs.dto.Recruit;

@RestController
@RequestMapping("/api/jobPostings")
public class JobPostingController {

    @Autowired
    private ICompanyDao3854 companyService;

    @GetMapping
    public List<Recruit> getJobPostingsForInterestedCompanies(@RequestParam(name = "mem_no") Long mem_no) {
        return companyService.getJobPostingsForInterestedCompanies(mem_no);
    }
}