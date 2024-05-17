package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Cs_question;

@Mapper
public interface ICS_Dao_won {
	public List<Cs_question> getList_99();
	public Cs_question getlistDetail_99(@Param("cs_no") String cs_no);
	public void writeDao_99(@Param("mem_no") String mem_no, @Param("title") String title, @Param("content") String content, @Param("category") String category, @Param("ch_private") String ch_private);
	public void deleteDao_99(@Param("cs_no") String cs_no);
	public void modifyDao_99(@Param("title") String title, @Param("content") String content, @Param("category") String category, @Param("ch_private") String ch_private, @Param("cs_no") String cs_no);
}
