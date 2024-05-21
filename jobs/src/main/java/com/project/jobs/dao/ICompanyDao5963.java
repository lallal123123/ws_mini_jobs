package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.ComInfoDetail;
import com.project.jobs.dto.ComRecruitJoinCount;
import com.project.jobs.dto.Com_detail;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.RecruitByMemResume;
import com.project.jobs.dto.RecruitDetail;
import com.project.jobs.dto.Region;
import com.project.jobs.dto.SiteMemByresume;

@Mapper
public interface ICompanyDao5963 {

	// 지역 리스트 가져오기
	public List<Region> getRegion();
	
	// 공고 등록하기
	public void registRecruit(@Param("recruit") Recruit recruit);
	
	// 공고 수정하기
	public void modifyRecruit(@Param("recruit") Recruit recruit);
	
	// 공고 번호로 공고 정보 가져오기
	public Recruit getRecruit(Long recruit_no);
	
	// 공고 삭제하기
	public void deleteRecruit(Long recruit_no);
	
	// 기업 번호로 공고 리스트 가져오기
	public List<Recruit> getComRecruitList(Long com_no);
	
	// 기업 번호로 공고와 기업 정보 조인 리스트
	public List<ComRecruitJoinCount> comInfoJoinRecruitList(@Param("com_no") Long com_no);
	
	// 기업 소개 정보 등록
	public void comInfoWrite(@Param("com_detail") Com_detail com_detail);
	
	// 기업 소개 디테일 정보 가져오기
	public ComInfoDetail getComInfoDetail(@Param("com_no") Long com_no);
	
	// 기업 소개 정보 수정
	public void comInfoModify(@Param("com_detail") Com_detail com_detail);
	
	// 기업 소개 정보 가져오기
	public Com_detail getCom_detail(@Param("com_no") Long com_no);
	
	// 공고에 지원한 사람 수 가져오기
	public List<Mem_recruit> getMemCount(Long recruit_no);
	
	// 키워드로 공고 리스트 검색하기
	public List<Recruit> getComRecruitListKeyword(Long com_no, String keyword);
	
	// 공고별 지원자 리스트 가져오기
	public List<RecruitByMemResume> getRecruitMemList(@Param("recruit_no") Long recruit_no);
	
	// 공고번호로 공고 디테일 가져오기
	public RecruitDetail getRecruitDetail(@Param("recruit_no") Long recruit_no);
	
	// 이력서 번호로 이력서 정보 가져오기
	public SiteMemByresume getResumeDetail(@Param("s_resume_no") Long s_resume_no);
	
}
