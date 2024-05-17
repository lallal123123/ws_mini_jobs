package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Career;
import com.project.jobs.dto.Duty;
import com.project.jobs.dto.Education;
import com.project.jobs.dto.License;
import com.project.jobs.dto.Site_resume;

@Mapper
public interface IMember_resume8481 {
		//희망직무 선택박스 직무를 불러온다.
		public List<Duty> choosejoblist();
		//이력서 양식 
		public void site_resume_write(@Param("site_res_dto") Site_resume site_res_dto);
		//라이센스
		public void license_write(@Param("lic_dto") License lic_dto);
		//경력
		public void career_write(@Param("career_dto") Career career_dto);
		//학력
		public void education_write(@Param("edu_dto") Education edu_dto);
		
		
}
