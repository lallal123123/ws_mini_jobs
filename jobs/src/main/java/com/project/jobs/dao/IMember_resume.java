package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.jobs.dto.Duty;

@Mapper
public interface IMember_resume {
		//희망직무 선택박스 직무를 불러온다.
		public List<Duty> choosejoblist();
}
