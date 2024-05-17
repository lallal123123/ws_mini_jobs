package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Member;

@Mapper
public interface IMemberDao3854 {

    void reg();

    List<Member> getAllList();

    Member getListById(@Param("mem_no") Long mem_no);

    void insertMember(@Param("member") Member member);

    void updateMember(@Param("member") Member member);

    void deleteMember(@Param("mem_no") Long mem_no);
}