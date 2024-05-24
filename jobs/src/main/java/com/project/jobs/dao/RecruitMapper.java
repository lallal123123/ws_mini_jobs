package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.project.jobs.dto.Recruit;

@Mapper
public interface RecruitMapper {

 
    List<Recruit> getAllRecruits();
}
