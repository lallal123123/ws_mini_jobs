package com.project.jobs.communityTests;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.jobs.dao.IMem_community_dao92;
import com.project.jobs.dto.Mem_community;

@SpringBootTest
public class CommunityTest {
	@Autowired
	IMem_community_dao92 dao;
	
	@Test
	public void test1(){
		for(int i =0 ; i < 200 ; i++) {
		Mem_community mc = new Mem_community();
		mc.setMem_id("jun");
		mc.setCategory("자유글");
		mc.setMem_no(1L);
		mc.setContent(i+"게시글 내용입니다.");
		mc.setSecret(0);
		mc.setTitle(i+"제목 입니다.");
		dao.write92(mc);
		}
	}
}
