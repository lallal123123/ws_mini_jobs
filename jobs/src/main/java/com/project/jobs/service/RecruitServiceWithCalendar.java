package com.project.jobs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.jobs.dao.RecruitMapper;
import com.project.jobs.dto.Recruit;

@Service
public class RecruitServiceWithCalendar {

    private final RecruitMapper recruitMapper;

    public RecruitServiceWithCalendar(RecruitMapper recruitMapper) {
        this.recruitMapper = recruitMapper;
    }

    public List<Recruit> getAllRecruits() {
        return recruitMapper.getAllRecruits();
    }
}
