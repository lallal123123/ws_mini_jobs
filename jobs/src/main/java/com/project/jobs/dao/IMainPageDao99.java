package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.jobs.dto.RecruitByMemResume;

@Mapper
public interface IMainPageDao99 {
	public List<RecruitByMemResume> getMemRecruitList_99();
}
