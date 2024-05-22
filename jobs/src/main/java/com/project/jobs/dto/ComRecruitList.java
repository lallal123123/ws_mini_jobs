package com.project.jobs.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ComRecruitList {

    private Long recruit_no; 
    private Long com_no;
    private String career;
    private String education;
    private String skill; 
    private String field; 
    private int pay;
    private String location;
    private String working_time; 
    private String rank; 
    private String title;
    private String com_size;
    private String qualification;
    private String welfare;
    private String seprocedure;
    private String notice;  
    private String reg_date;
    private String deadline_date;
    private int p_number; 
    private int mem_count;
    
    
	private String com_id;
	private String com_pw;
	private String com_name;
	private String com_ceo;
	private String com_addr;
	private String com_companynum;
	private String com_tel;
	private String com_email;
	private String com_url;
	private Date make_date;
	
}
