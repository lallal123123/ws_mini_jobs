package com.project.jobs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Faq {
	private Long faq_no;
	private String title;
	private String content;
	private String category;
	private boolean mem_type;
}
