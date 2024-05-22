package com.project.jobs.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.ICompanyDao5963;
import com.project.jobs.dto.ComInfoDetail;
import com.project.jobs.dto.ComRecruitJoinCount;
import com.project.jobs.dto.Com_detail;
import com.project.jobs.dto.Mem_recruit;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.RecruitByMemResume;
import com.project.jobs.dto.RecruitDetail;
import com.project.jobs.dto.Region;
import com.project.jobs.dto.SiteMemByresume;


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
	public List<Recruit> getComRecruitList(Long com_no){
		
		List<Recruit> list = companyDao5963.getComRecruitList(com_no);
		
		return list;
	}
	
	// 기업 번호로 공고 리스트
	public List<ComRecruitJoinCount> comInfoJoinRecruitList(Long com_no){
		List<ComRecruitJoinCount> list = companyDao5963.comInfoJoinRecruitList(com_no);
		return list;
	};
	
	// 기업 소개 정보 등록
	public void comInfoWrite(Com_detail com_detail) {
		
		companyDao5963.comInfoWrite(com_detail);
	};
	
	
    // 공고 번호로 공고 정보 가져오기
    public Recruit getRecruit(Long recruit_no) {
        Recruit recruit = companyDao5963.getRecruit(recruit_no);
        return recruit;
    }
    
    // 공고 수정하기
    public void modifyRecruit(Recruit recruit) {
        companyDao5963.modifyRecruit(recruit);
    };

    
	// 공고 삭제하기
	public void deleteRecruit(Long recruit_no) {
		companyDao5963.deleteRecruit(recruit_no);
	};
	
	// 기업 소개 디테일 정보 가져오기
	public ComInfoDetail getComInfoDetail(Long com_no) {
		ComInfoDetail comInfoDetail = companyDao5963.getComInfoDetail(com_no);
		return comInfoDetail;
	}
	
	// 기업 소개 정보 수정
	public void comInfoModify(Com_detail com_detail) {
		companyDao5963.comInfoModify(com_detail);
	};
	
	
	
	// 기업 소개 정보 가져오기
	public Com_detail getCom_detail(Long com_no) {
		Com_detail com_detail = companyDao5963.getCom_detail(com_no);
		return com_detail;
	};
	
	// 공고에 지원한 사람 수 가져오기
	public List<Mem_recruit> getMemCount(Long recruit_no) {
		System.out.println("recruit_no" + recruit_no);
		List<Mem_recruit> result = companyDao5963.getMemCount(recruit_no);
		System.out.println("result" + result);
		return result;
	}
	
	// 키워드로 공고 리스트 검색하기
	public List<Recruit> getComRecruitListKeyword(Long com_no, String keyword){
		List<Recruit> list = companyDao5963.getComRecruitListKeyword(com_no, keyword);
		return list;
	}
	
	// 공고별 지원자 리스트 가져오기
	public List<RecruitByMemResume> getRecruitMemList(Long recruit_no){
		List<RecruitByMemResume> list = companyDao5963.getRecruitMemList(recruit_no);
		return list;
	};
	
	// 공고번호로 공고 디테일 가져오기
	public RecruitDetail getRecruitDetail(@Param("recruit_no") Long recruit_no){
		RecruitDetail recruitDetail = companyDao5963.getRecruitDetail(recruit_no);
		return recruitDetail;
	};
	
	// 이력서 번호로 이력서 정보 가져오기
	public SiteMemByresume getResumeDetail(@Param("s_resume_no") Long s_resume_no) {
		SiteMemByresume siteMemByresume = companyDao5963.getResumeDetail(s_resume_no);
		return siteMemByresume;
	};
	
	// 공고 마감하기
	public void updateDeadlineDate(Long recruit_no) {
		companyDao5963.updateDeadlineDate(recruit_no);
	};
	
	// 이력서 true 주기
	public void updatePassTrue(Long mem_recruit_no) {
		companyDao5963.updatePassTrue(mem_recruit_no);
	};
		
	// 이력서 flase 주기
	public void updatePassFalse(Long mem_recruit_no) {
		companyDao5963.updatePassFalse(mem_recruit_no);
	};
	
	// 공고 지원 현황
	public Mem_recruit getMemRecruit(Long mem_recruit_no) {
		Mem_recruit memRecruit = companyDao5963.getMemRecruit(mem_recruit_no);
		return memRecruit;
	};
	
		
}
