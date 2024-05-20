package com.project.jobs.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Site_resume_file {

	private Long s_resume_no; 
	private String mem_no; 
	private MultipartFile img_url; 
	private String hope_job; 
	private String addr;
	private String part; 
	private String military; 
	private MultipartFile etc; 
	private String motive; 
	private String personality; 
	private String aspiration; 
	private String growth; 
	private String title;
	private String site_res_name;
	
	public String getFileName() {
		return img_url.getOriginalFilename();
	}
	
	
}
