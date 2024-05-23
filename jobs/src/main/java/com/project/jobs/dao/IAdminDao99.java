package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Admin_totalRegistrations;
import com.project.jobs.dto.Cs_question;
import com.project.jobs.dto.Recruit;

@Mapper
public interface IAdminDao99 {
	//차트
	public Admin_totalRegistrations getCurrentMemRegist();
	public Admin_totalRegistrations getPastMemRegist();
	public Admin_totalRegistrations getCurrentComRegist();
	public Admin_totalRegistrations getPastComRegist();
	//미답변 문의신고 
	public List<Cs_question> getCsList(@Param("start") Long start, @Param("cnt") Long cnt);
	//미답변 문의신고
	public List<Cs_question> getCsListAll_99();
	//현재날짜
	public String getCurrentDate();
	
	public List<Recruit> getRecruitList_99(@Param("start") Long start, @Param("cnt") Long cnt);
}
