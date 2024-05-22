package com.project.jobs.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.IMemberDao5963;
import com.project.jobs.dto.MemRecruitApply;
import com.project.jobs.dto.MemRecruitScrap;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Site_resume;

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
	
	// 개인회원 공고 지원하기
	public void applyRecruit(Long mem_no, Long recruit_no, Long s_recruit_no) {
		memberDao.applyRecruit(mem_no, recruit_no, s_recruit_no);
	};
	
	//사이트 이력서 조회
	public List<Site_resume> getSiteResumeList(Long mem_no){
		List<Site_resume> list = memberDao.getSiteResumeList(mem_no);
			
		return list;
	}
	
	//지원한 공고 리스트 가져오기
	public List<MemRecruitApply> getMemRecruitApplyList(@Param("mem_no") Long mem_no){
		List<MemRecruitApply> list = memberDao.getMemRecruitApplyList(mem_no);
		return list;
	};
	
	//지원한 공고 취소하기
	public void deleteRecruitApply(Long mem_recruit_no) {
		memberDao.deleteRecruitApply(mem_recruit_no);
	};
		
}
