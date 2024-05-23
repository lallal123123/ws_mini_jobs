package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Cs_question;
import com.project.jobs.dto.Notice;

@Mapper
public interface INotice_Dao99 {
	public List<Notice> getnoticeList_99();
	public Notice getnoticeDetail_99(@Param("notice_no") String notice_no);
	public void noticeWrite_99(@Param("mem_no") String mem_no, @Param("title") String title, @Param("content") String content, @Param("category") String category);
	public void noticeDeleteDao_99(@Param("notice_no") String notice_no);
	public void noticeModify_99(@Param("title") String title, @Param("content") String content, @Param("category") String category, @Param("notice_no") String notice_no);
	public List<Notice> getNoticeSerchData_99(@Param("searchData")String searchData);
	public List<Notice> noticeCategory_99(@Param("category") String category);
}
