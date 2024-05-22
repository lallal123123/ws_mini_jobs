package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.MemRecruitApply;
import com.project.jobs.dto.MemRecruitScrap;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Site_resume;

@Mapper
public interface IMemberDao5963 {
	
	// 개인회원 공고 스크랩하기
	public void addRecruitScrap(Long mem_no, Long recruit_no);
	
	// 개인회원 스크랩 공고 리스트 가져오기
	public List<MemRecruitScrap> getMemRecruitScrapList(@Param("mem_no")Long mem_no);
	
	// 개인회원 스크랩 공고 삭제하기
	public void deleteRecruitScrap(Long s_recruit_no);
	
	// 개인회원 공고 지원하기
	public void applyRecruit(Long mem_no, Long recruit_no, Long s_recruit_no);
	
	//사이트 이력서 List 
	public List<Site_resume> getSiteResumeList(@Param("mem_no") Long mem_no);
	
	//지원한 공고 리스트 가져오기
	public List<MemRecruitApply> getMemRecruitApplyList(@Param("mem_no") Long mem_no);
	
	//지원한 공고 취소하기
	public void deleteRecruitApply(Long mem_recruit_no);
}
