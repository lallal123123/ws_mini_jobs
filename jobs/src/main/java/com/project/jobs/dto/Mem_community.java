package com.project.jobs.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Mem_community {
	
	private Long mem_community_no;
	private Long mem_no;
	private String mem_id;
	private String title;
	private String content;
	private Date reg_date;
	private String s_reg_date;
	private String category;
	private long views;
	private int secret;
	private long replyCnt;

}
