package com.project.jobs.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.project.jobs.dto.Member;

@Mapper
public interface IMemberDao3854 {

	List<Member> getAllMembers();

	Member getMemberById(Long mem_no);

	void insertMember(Member member);

	void updateMember(Member member);

	void deleteMember(Long mem_no);

	int countByMemId(@Param("mem_id") String mem_id);

	boolean existsByMemId(String mem_id);

	@Select("SELECT * FROM member WHERE mem_id = #{mem_id} AND mem_pw = #{mem_pw}")
	Optional<Member> findByMemIdAndMemPw(@Param("mem_id") String mem_id, @Param("mem_pw") String mem_pw);
}
