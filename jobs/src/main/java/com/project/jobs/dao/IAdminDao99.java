package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.jobs.dto.Admin_totalRegistrations;

@Mapper
public interface IAdminDao99 {
	public Admin_totalRegistrations getCurrentMemRegist();
	public Admin_totalRegistrations getPastMemRegist();
	public Admin_totalRegistrations getCurrentComRegist();
	public Admin_totalRegistrations getPastComRegist();
}
