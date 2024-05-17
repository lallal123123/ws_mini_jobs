package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Member;

@Mapper
public interface IMemberDao3854 {

	Member findByMemIdAndMemPw(@Param("mem_id") String mem_id, @Param("mem_pw") String mem_pw);

	List<Member> getAllMembers();

	Member getMemberById(Long mem_no);

	void insertMember(Member member);

	void updateMember(Member member);

	void deleteMember(Long mem_no);
}