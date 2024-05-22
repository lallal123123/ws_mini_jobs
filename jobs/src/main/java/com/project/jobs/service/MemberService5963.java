package com.project.jobs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.IMemberDao5963;

@Service
public class MemberService5963 {
	
	@Autowired
	IMemberDao5963 memberDao;
	
	// 개인회원 공고 스크랩하기
	public void addRecruitScrap(Long mem_no, Long recruit_no) {
		memberDao.addRecruitScrap(mem_no, recruit_no);
	}

}
