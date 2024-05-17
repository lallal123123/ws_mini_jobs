package com.project.jobs.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ComInfoJoinRecruit {

	private Long com_no;
	private String com_id;
	private String com_size;
	private Long recruit_no;
	private String title;
	private Date deadline_date;
	
}
