package com.project.jobs.dto;

import org.modelmapper.ModelMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Com_detail {

	private Long com_detail_no;
	private Long com_no;
	private String introduction;
	private String img_url;
	private String pension;
	private String compensation;
	private String facilities;
	private String policy;
	private String convenience;
	private String sectors;
	private int p_number; 
	private int establishment;
	private String history;
	private String ideal_talent;
	
	private static ModelMapper modelMapper = new ModelMapper();
	
	public static Com_detail of(Com_detail_file com_detail_file) {
		return modelMapper.map(com_detail_file, Com_detail.class);
	}
}
