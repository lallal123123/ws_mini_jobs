package com.project.jobs.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Com_reply {
	
	private Long com_reply_no ;
	private Long com_community_no;
	private Long com_no;
	private String com_id;
	private String content;
	private Date regdate;
	private String s_regdate;
}
