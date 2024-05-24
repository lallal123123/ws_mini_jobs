package com.project.jobs.service;

import com.project.jobs.dto.Recruit;

import java.util.List;

public interface RecruitService {
    Recruit getRecruitById(Long recruit_no);
    List<Recruit> getJobPostingsForInterestedCompanies(Long mem_no);
    
    
}