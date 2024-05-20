package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.ComInfoDetail;
import com.project.jobs.dto.ComInfoJoinRecruit;
import com.project.jobs.dto.Com_detail;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.Region;

@Mapper
public interface ICompanyDao5963 {

	// 지역 리스트 가져오기
	public List<Region> getRegion();
	
	// 공고 등록하기
	public void registRecruit(@Param("recruit") Recruit recruit);
	
	
	// 기업 번호로 공고 리스트 가져오기
	public List<Recruit> getComRecruitAllList(Long com_no);
	
	// 기업 번호로 공고와 기업 정보 조인 리스트
	public List<ComInfoJoinRecruit> comInfoJoinRecruitList(@Param("com_no") Long com_no);
	
	// 기업 소개 정보 등록
	public void comInfoWrite(@Param("com_detail") Com_detail com_detail);
	
	// 기업 소개 디테일 정보 가져오기
	public ComInfoDetail getComInfoDetail(@Param("com_no") Long com_no);
	
	// 기업 소개 정보 수정
	public void comInfoModify(@Param("com_detail") Com_detail com_detail);
	
	// 기업 소개 정보 가져오기
	public Com_detail getCom_detail(@Param("com_no") Long com_no);
}
