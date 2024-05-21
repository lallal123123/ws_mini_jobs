package com.project.jobs.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class SiteMemByresume {

	private Long mem_no; 
	private String mem_name; 
	private String mem_birth;
	private String mem_tel;
	private String mem_email;
	private String mem_gender;
	private Long s_resume_no; 
	private String img_url; 
	private String hope_job; 
	private String addr;
	private String part; 
	private String military; 
	private String etc; 
	private String motive; 
	private String personality; 
	private String aspiration; 
	private String growth; 
	private String title;
	private String site_res_name;
	
}
