package com.project.jobs.dto;

import org.modelmapper.ModelMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Free_resume {
	
	private Long r_resume_no;
	private Long mem_no;
	private String title;
	private String url;
	private String file;
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
	private static ModelMapper modelMapper = new ModelMapper();
	
	public static Free_resume of(Free_resume_file free_resume_file) {
		return modelMapper.map(free_resume_file, Free_resume.class);
	}
	
	
}
