package com.project.jobs.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Education {
	
	private Long education_no;
	private Long s_resume_no;
	private String school;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edu_join_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date graduation_date;
	private Boolean graduation; 
	private int grades;
	private String major;
	private Long mem_no;

}
