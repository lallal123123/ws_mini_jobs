package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Com_community;
import com.project.jobs.dto.Com_community_category;
import com.project.jobs.dto.Com_reply;

@Mapper
public interface ICom_community_dao92 {

	//전체 게시글
	public void write92(@Param("dto") Com_community dto);//
	public void modify(@Param("dto") Com_community dto);//
	public Com_community detail92(@Param("no") String com_community_no);//
	public List<Com_community> list92(@Param("start") Long start,@Param("cnt") Long cnt);//
	public void delete(@Param("no") String no);//
	public long countAll();
	
	//검색
	public List<Com_community> searchList(@Param("start") Long start,@Param("cnt") Long cnt,@Param("search") String search);//
	public long searchCount(@Param("search") String search);
	
	//댓글
	public void insert_reply(@Param("dto") Com_reply dto);//
	public List<Com_reply> replyList(@Param("no") String no);//
	public void delete_reply(@Param("no") String no);//
	
	//카테고리
	public List<Com_community_category> clist();//
	public String com_id(@Param("no") Long no);//
	
	//뷰카운트
	public void viewsUp(@Param("no") String no);
	
	//인기글
	public List<Com_community> hotList(@Param("start") Long start,@Param("cnt") Long cnt);//
	
	//카테고리별
	public List<Com_community> chList(@Param("category") String category,@Param("start") Long start,@Param("cnt") Long cnt);

 }
