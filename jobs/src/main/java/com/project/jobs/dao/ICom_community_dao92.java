package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Com_community;
import com.project.jobs.dto.Com_community_category;
import com.project.jobs.dto.Com_reply;

@Mapper
public interface ICom_community_dao92 {

	public void write92(@Param("dto") Com_community dto);//
	public void modify(@Param("dto") Com_community dto);//
	public Com_community detail92(@Param("no") String com_community_no);//
	public List<Com_community> list92();//
	public void delete(@Param("no") String no);//
	
	public void insert_reply(@Param("dto") Com_reply dto);//
	public List<Com_reply> replyList(@Param("no") String no);//
	public void delete_reply(@Param("no") String no);//
	
	public List<Com_community_category> clist();//
	public String com_id(@Param("no") Long no);//
	
	public void viewsUp(@Param("no") String no);
 }
