package com.project.jobs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Mem_interest {
	
	private Long mem_interest_no;
	private Long mem_no;
	private Long com_no;
	//member테이블에서
	private String mem_name;
	private String mem_email;
	private String mem_birth;
	private String mem_gender;
	//최신이력서에서(site_resume 테이블)
	private String hope_job;//희망직무
	private String part;//지원분야
	private Long s_resume_no;

}
