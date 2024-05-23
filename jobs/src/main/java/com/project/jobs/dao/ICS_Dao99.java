package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Company;
import com.project.jobs.dto.Cs_question;
import com.project.jobs.dto.Cs_request;
import com.project.jobs.dto.Member;

@Mapper
public interface ICS_Dao99 {
	public List<Cs_question> getList_99();
	public List<Cs_question> getdashboardList_99();
	
	public Cs_question getlistDetail_99(@Param("cs_no") String cs_no);
	//문의글 등록
	public void write_99(@Param("mem_no") String mem_no, @Param("com_no") String com_no, @Param("title") String title, @Param("content") String content, @Param("category") String category, @Param("ch_private") String ch_private);
	
	public void deleteDao_99(@Param("cs_no") String cs_no);
	public void modifyDao_99(@Param("title") String title, @Param("content") String content, @Param("category") String category, @Param("ch_private") String ch_private, @Param("cs_no") String cs_no);
	public void writeRequestDao_99(@Param("cs_no") String cs_no, @Param("content") String content, @Param("title") String title);
	public Cs_request getRequestDao_99(@Param("cs_no") String cs_no);
	public void requestModify_99(@Param("title") String title, @Param("content") String content, @Param("cs_no") String cs_no);
	public Member getCsWriterId_99(@Param("cs_no") String cs_no);
	public List<Cs_question> csSerchData_99(@Param("searchData") String searchData);
	public List<Cs_question> csCategory_99(@Param("category") String category);
	//로그인 한 기업이 작성한 문의글 리스트
	public List<Cs_question> getQuestionList(@Param("com_no") Long com_no);
}
