package com.project.jobs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Com_interest {
    private Long com_interest_no;
    private Long mem_no;
    private Long com_no;
    private boolean status;
	
    public Long getCom_interest_no() {
		return com_interest_no;
	}
	public void setCom_interest_no(Long com_interest_no) {
		this.com_interest_no = com_interest_no;
	}
	public Long getMem_no() {
		return mem_no;
	}
	public void setMem_no(Long mem_no) {
		this.mem_no = mem_no;
	}
	public Long getCom_no() {
		return com_no;
	}
	public void setCom_no(Long com_no) {
		this.com_no = com_no;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
    
    
}

