package com.project.jobs.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class License {

	private Long license_no;
	private Long s_resume_no;
	private String license_name;
	private String agency;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date get_date;
}
