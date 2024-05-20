package com.project.jobs.dto;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Com_detail_file {
	
	private Long com_detail_no;
	private Long com_no;
	private String introduction;
	private MultipartFile img_url;
	private String pension;
	private String compensation;
	private String facilities;
	private String policy;
	private String convenience;
	private String sectors;
	private int p_number; 
	private int establishment;
	private String history;
	private String ideal_talent;
	
	
	public String getFileName() {
		return img_url.getOriginalFilename();
	}
	
}
