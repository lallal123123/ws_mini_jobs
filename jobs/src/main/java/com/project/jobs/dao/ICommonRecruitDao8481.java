package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.ComRecruitList;

@Mapper
public interface ICommonRecruitDao8481 {

	//공고 리스트 
	public List<ComRecruitList> getRecruitList();
	//검색기능
	public List<ComRecruitList> getSearchList(@Param("search") String search);
	
	//셀렉트별 검색(등록일순)
	public List<ComRecruitList> getSelectRegDate();
	//셀렉트별 검색(마감일)
	public List<ComRecruitList> getSelectDeadLine();
	
}
