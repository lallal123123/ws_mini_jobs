package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Admin_totalRegistrations;
import com.project.jobs.dto.Cs_question;
import com.project.jobs.dto.Faq;

@Mapper
public interface IAdminDao99 {
	//차트
	public Admin_totalRegistrations getCurrentMemRegist();
	public Admin_totalRegistrations getPastMemRegist();
	public Admin_totalRegistrations getCurrentComRegist();
	public Admin_totalRegistrations getPastComRegist();
	//미답변 문의신고 
	public List<Cs_question> getCsList(@Param("start") Long start, @Param("cnt") Long cnt);
	//미답변 문의신고
	public List<Cs_question> getCsListAll_99();
	//현재날짜
	public String getCurrentDate();
	//faq 작성
	public void faqWrite(@Param("title") String title, @Param("content") String content, @Param("category") String category, @Param("mem_type") String mem_type);
	//faq 일반회원 조회
	public List<Faq> faqMemberList(); 
	//faq 기업회원 조회
	public List<Faq> faqCompanyList(); 
	//faq 전체조회
	public List<Faq> faqList();
	
}
