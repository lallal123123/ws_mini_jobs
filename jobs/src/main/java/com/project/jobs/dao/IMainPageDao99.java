package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Mem_interest;
import com.project.jobs.dto.RecruitByMemResume;

@Mapper
public interface IMainPageDao99 {
	public List<RecruitByMemResume> getMemRecruitList_99(@Param("com_no") Long com_no);
	public List<RecruitByMemResume> getMemRecruitSmallList_99(@Param("com_no") Long com_no, @Param("start") Long start, @Param("cnt") Long cnt);
	public List<Mem_interest> getMemInterestSmallList99(@Param("com_no") Long com_no, @Param("start") Long start, @Param("cnt") Long cnt);
}
