package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.Region;

@Mapper
public interface ICompanyDao5963 {

	// 지역 리스트 가져오기
	public List<Region> getRegion();
	
	// 공고 등록하기
	public void registRecruit(@Param("recruit") Recruit recruit);
	
	
	// 기업 번호로 공고 리스트 가져오기
	public List<Recruit> getComRecruitAllList(int com_no);
}
