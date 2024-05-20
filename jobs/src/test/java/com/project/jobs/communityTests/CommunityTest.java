package com.project.jobs.communityTests;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.jobs.dao.ICom_community_dao92;
import com.project.jobs.dto.Com_community;

@SpringBootTest
public class CommunityTest {
	@Autowired
	ICom_community_dao92 dao;
	
	@Test
	public void test1(){
		for(int i =0 ; i < 200 ; i++) {
		Com_community cc = new Com_community();
		cc.setCom_id("1번아이디");
		cc.setCategory("자유글");
		cc.setCom_no(1L);
		cc.setContent(i+"내용");
		cc.setSecret(0);
		cc.setTitle(i+"제목");
		dao.write92(cc);
		}
	}
}
