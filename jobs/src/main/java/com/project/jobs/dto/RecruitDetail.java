package com.project.jobs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RecruitDetail {
	private Long com_no;
	private String com_name;
	private String com_size;
	private String com_ceo;
	private String com_addr;
	private String com_url;
	private Long recruit_no;
	private String career;
	private String education;
	private String skill; 
	private String field; 
	private int pay;
	private String location;
	private String working_time; 
	private String rank; 
	private String title;
	private String qualification;
	private String welfare;
	private String seprocedure;
	private String notice;  
	private String reg_date;
	private String deadline_date;
	private int p_number; 
	private int mem_count;
}
