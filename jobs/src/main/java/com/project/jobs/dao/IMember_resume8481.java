package com.project.jobs.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Career;
import com.project.jobs.dto.Education;
import com.project.jobs.dto.Free_resume;
import com.project.jobs.dto.Free_resume_file;
import com.project.jobs.dto.License;
import com.project.jobs.dto.Site_resume;

@Mapper
public interface IMember_resume8481 {

		//이력서 양식 
		public void site_resume_write(@Param("site_res_dto") Site_resume site_res_dto);
		//라이센스
		public void license_write(@Param("lic_dto") License lic_dto);
		 // site_resume 테이블에 레코드 삽입
		//@Insert("INSERT INTO site_resume (other_column1, other_column2) VALUES (#{otherColumn1}, #{otherColumn2})")
		//@Options(useGeneratedKeys = true, keyProperty = "s_resume_no")
		//void insertSiteResume(Site_resume siteResume);
		
		 // license 테이블에 레코드 삽입
	    @Insert("INSERT INTO license (s_resume_no, license_name, agency) VALUES (#{s_resume_no}, #{license_name}, #{agency})")
	    void insertLicense(@Param("s_resume_no") Long sResumeNo, @Param("license_name") String license_name, @Param("agency") String agency);
			
		//경력
		public void career_write(@Param("career_dto") Career career_dto);
		
		@Insert("INSERT INTO career (s_resume_no, company, car_join_date, quit_date, main_part) VALUES( #{s_resume_no}, #{company }, #{car_join_date }, #{quit_date }, #{main_part })")
		void insertCareer(@Param("s_resume_no") Long sResumeNo, @Param("company") String company, @Param("car_join_date") String car_join_date, @Param("quit_date") String quit_date, @Param("main_part") String main_part);
		
		//학력
		public void education_write(@Param("edu_dto") Education edu_dto);
		
		@Insert("INSERT INTO education (s_resume_no, school, edu_join_date, graduation_date, graduation , grades, major) VALUES (#{s_resume_no}, #{school}, #{edu_join_date}, #{graduation_date}, #{graduation}, #{grades}, #{major})")
		void insertEducation(@Param("s_resume_no") Long sResumeNo, @Param("school") String school, @Param("edu_join_date") String edu_join_date, @Param("graduation_date") String graduation_date, @Param("graduation") int graduation, @Param("grades") int grades, @Param("major") String major);
		
		//자유이력서Insert
		public void insert_free_resume(@Param("free_dto") Free_resume freedto);
		
		
		//사이트 이력서 List 
		public List<Site_resume> getSiteResumeList(@Param("mem_no") Long mem_no);
		//자유 이력서 List
		public List<Free_resume> getFreeResumeList(@Param("mem_no") Long mem_no);
		
}
