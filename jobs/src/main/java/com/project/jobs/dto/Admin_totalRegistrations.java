package com.project.jobs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin_totalRegistrations {
	
	private String year;
	private String month;
	private String totalRegistrations;
	private String member_type;
}
