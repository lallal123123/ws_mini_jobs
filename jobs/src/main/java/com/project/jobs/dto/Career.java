package com.project.jobs.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Career {
	
	private Long career_no;
	private Long s_resume_no;
	private String company;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private String car_join_date;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private String quit_date;
	private String main_part;
	private Long mem_no;
}
