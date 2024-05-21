package com.project.jobs.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Free_resume_file {

	private Long r_resume_no;
	private Long mem_no;
	private String title;
	private String url;
	private MultipartFile file;
	
	
	public String getFileName() {
		return file.getOriginalFilename();
	}
	
	
}
