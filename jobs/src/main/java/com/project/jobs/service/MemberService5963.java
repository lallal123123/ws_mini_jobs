package com.project.jobs.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.IMemberDao5963;
import com.project.jobs.dto.MemRecruitScrap;

@Service
public class MemberService5963 {
	
	@Autowired
	IMemberDao5963 memberDao;
	
	// 개인회원 공고 스크랩하기
	public void addRecruitScrap(Long mem_no, Long recruit_no) {
		memberDao.addRecruitScrap(mem_no, recruit_no);
	}
	
	// 개인회원 스크랩 공고 리스트 가져오기
	public List<MemRecruitScrap> getMemRecruitScrapList(@Param("mem_no")Long mem_no){
		List<MemRecruitScrap> list = memberDao.getMemRecruitScrapList(mem_no);
		return list;
	};

	
	// 개인회원 스크랩 공고 삭제하기
	public void deleteRecruitScrap(Long s_recruit_no) {
		memberDao.deleteRecruitScrap(s_recruit_no);
	};
		
}
