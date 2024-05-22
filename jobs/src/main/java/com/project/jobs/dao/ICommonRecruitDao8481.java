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
	
}
