package com.project.jobs.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.ICompanyDao5963;
import com.project.jobs.dto.ComInfoDetail;
import com.project.jobs.dto.ComInfoJoinRecruit;
import com.project.jobs.dto.Com_detail;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.Region;


@Service
public class CompanyService5963 {


	@Autowired
	ICompanyDao5963 companyDao5963;
	
	//지역 리스트 가져오기
	public List<Region> getRegion(){
		List<Region> list = companyDao5963.getRegion();
		return list;
	}
	
	// 공고 등록하기
	public void registRecruit(Recruit recruit) {
		companyDao5963.registRecruit(recruit);
	}
	
	// 기업 번호로 공고 리스트 가져오기
	public List<Recruit> getComRecruitAllList(Long com_no){
		
		List<Recruit> list = companyDao5963.getComRecruitAllList(com_no);
		
		return list;
	}
	
	// 기업 번호로 공고와 기업 정보 조인 리스트
	public List<ComInfoJoinRecruit> comInfoJoinRecruitList(Long com_no){
		List<ComInfoJoinRecruit> list = companyDao5963.comInfoJoinRecruitList(com_no);
		return list;
	};
	
	// 기업 소개 정보 등록
	public void comInfoWrite(@Param("com_detail") Com_detail com_detail) {
		
		companyDao5963.comInfoWrite(com_detail);
	};
	
	// 기업 소개 디테일 정보 가져오기
	public ComInfoDetail getComInfoDetail(@Param("com_no") Long com_no) {
		ComInfoDetail comInfoDetail = companyDao5963.getComInfoDetail(com_no);
		return comInfoDetail;
	}
	
	// 기업 소개 정보 등록
	public void comInfoModify(@Param("com_detail") Com_detail com_detail) {
		companyDao5963.comInfoModify(com_detail);
	};
		
}
