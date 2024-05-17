package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.jobs.dto.Member;


@Mapper
public interface IMemberDao3854 {
    List<Member> getAllMembers();
    Member getMemberById(Long mem_no);
    void insertMember(Member member);
    void updateMember(Member member);
    void deleteMember(Long mem_no);
}