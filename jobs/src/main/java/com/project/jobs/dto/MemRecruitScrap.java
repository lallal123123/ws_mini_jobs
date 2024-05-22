package com.project.jobs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemRecruitScrap {

	private Long s_recruit_no; 
    private Long mem_no;
    private Long com_no;
    private String com_id;
    private String com_name;
    private String com_size;
    private String com_addr;
    private Long recruit_no;
    private String field;
    private String education;
    private String pay;
    private String title;
    private String deadline_date;
	
}
