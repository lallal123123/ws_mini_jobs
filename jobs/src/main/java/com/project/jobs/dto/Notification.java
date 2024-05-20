package com.project.jobs.dto;

import java.util.Date;



public class Notification {
    private Long id;
    private Long mem_no;
    private String message;
    private boolean is_read;
    private Date created_at;
	
    
    public boolean isIs_read() {
		return is_read;
	}
	public void setIs_read(boolean is_read) {
		this.is_read = is_read;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getMem_no() {
		return mem_no;
	}
	public void setMem_no(Long mem_no) {
		this.mem_no = mem_no;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

    
}