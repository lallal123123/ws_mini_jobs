package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.jobs.dto.Com_community;

@Mapper
public interface ICom_community_dao92 {

	public void write92(Com_community dto);
	public void update92(Com_community dto);
	public Com_community detail92(String com_community_no);
	public List<Com_community> list92();	
}
