package com.project.jobs.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Cs_question {

	private Long cs_no;
	private Long mem_no;
	private Long com_no;
	private String com_id;
	private String mem_id;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	private String category;
	private Boolean ch_private; 
	private String answerStatus;
}
