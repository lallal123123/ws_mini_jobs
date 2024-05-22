package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Mem_interest;
import com.project.jobs.dto.Member;
import com.project.jobs.dto.Site_resume;

@Mapper
public interface IInterest_dao92 {

	public List<Member> memberListAll();	
	public List<Mem_interest> mem_interestList(@Param("comNo") Long comNo);
	public List<Site_resume> site_resumeListLast1();
	public void deleteMemInterest(@Param("no") String no);
}