package com.project.jobs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.IMemberDao3854;
import com.project.jobs.dto.Member;

@Service
public class MemberService {

    @Autowired
    private IMemberDao3854 memberDao;

    public List<Member> getAllMembers() {
        return memberDao.getAllMembers();
    }

    public Member getMemberById(Long mem_no) {
        return memberDao.getMemberById(mem_no);
    }

    public void insertMember(Member member) {
        memberDao.insertMember(member);
    }

    public void updateMember(Member member) {
        memberDao.updateMember(member);
    }

    public void deleteMember(Long mem_no) {
        memberDao.deleteMember(mem_no);
    }

    public boolean isMemIdExists(String mem_id) {
        return memberDao.existsByMemId(mem_id);
    }

    public Member login(Member member) {
        Optional<Member> loginMember = memberDao.findByMemIdAndMemPw(member.getMem_id(), member.getMem_pw());
        return loginMember.orElse(null);
    }
}
