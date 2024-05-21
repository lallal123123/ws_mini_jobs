package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Mem_community;
import com.project.jobs.dto.Mem_community_category;
import com.project.jobs.dto.Mem_reply;

@Mapper
public interface IMem_community_dao92 {

	//전체 게시글
	public void write92(@Param("dto") Mem_community dto);//
	public void modify(@Param("dto") Mem_community dto);//
	public Mem_community detail92(@Param("no") String mem_community_no);//
	public List<Mem_community> list92(@Param("start") Long start,@Param("cnt") Long cnt);//
	public void delete(@Param("no") String no);//
	public long countAll();
	//기업번호 별 게시글
	public List<Mem_community> listByMemNo(@Param("no") long no);
	public List<Mem_community> listByMemNo3(@Param("start")Long start,@Param("cnt") Long cnt,@Param("no") long no);
	//검색
	public List<Mem_community> searchList(@Param("start") Long start,@Param("cnt") Long cnt,@Param("search") String search);//
	public long searchCount(@Param("search") String search);
	
	//댓글
	public void insert_reply(@Param("dto") Mem_reply dto);//
	public List<Mem_reply> replyByNo(@Param("no") String no);//
	public void delete_reply(@Param("no") String no);//
	//기업번호 별 댓글
	public List<Mem_reply> replyListByMemNo(@Param("no") long no);
	//카테고리
	public List<Mem_community_category> clist();//
	public String mem_id(@Param("no") Long no);//
	
	//뷰카운트
	public void viewsUp(@Param("no") String no);
	
	//인기글
	public List<Mem_community> hotList(@Param("start") Long start,@Param("cnt") Long cnt);//
	
	//카테고리별
	public List<Mem_community> chList(@Param("category") String category,@Param("start") Long start,@Param("cnt") Long cnt);
	public long chListCount(@Param("category") String category); }
