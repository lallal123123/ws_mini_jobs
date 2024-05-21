package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.jobs.dto.Admin_totalRegistrations;

@Mapper
public interface IAdminDao99 {
	public List<Admin_totalRegistrations> getRegistrations();
	
}
