package com.project.jobs.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao5963 {
	
	// 개인회원 공고 스크랩하기
	public void addRecruitScrap(Long mem_no, Long recruit_no);
	
}
