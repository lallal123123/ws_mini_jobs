package com.project.jobs.service;

import com.project.jobs.dao.RecruitDao3854;
import com.project.jobs.dto.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecruitServiceImpl implements RecruitService {

    @Autowired
    private RecruitDao3854 recruitMapper;

    @Override
    public Recruit getRecruitById(Long recruit_no) {
        return recruitMapper.getRecruitById(recruit_no);
    }

   
    @Override
    public List<Recruit> getJobPostingsForInterestedCompanies(Long mem_no) {
        return recruitMapper.getJobPostingsForInterestedCompanies(mem_no);
    }
}