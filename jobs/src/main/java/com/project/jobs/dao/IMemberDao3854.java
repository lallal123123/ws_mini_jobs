package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.jobs.dto.Member;

@Mapper
public interface IMemberDao3854 {

	public void reg();
	
	
	public List<Member> getAllList();
	public Member getListById();
	public void insertMember();
	public void updateMember();
	public void deleteMember();
}
