package com.project.jobs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RecruitByMemResume {

	private String mem_name;
	private String mem_gender;
	private int mem_birth;
	private Long s_resume_no;
	private Long mem_no;
	private String title;
	private Long recruit_no;
	private Long mem_recruit_no;
	private int interest;
}
