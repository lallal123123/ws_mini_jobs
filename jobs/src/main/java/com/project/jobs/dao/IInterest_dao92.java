package com.project.jobs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.jobs.dto.Mem_interest;

@Mapper
public interface IInterest_dao92 {

	public List<Mem_interest> memList(@Param("comNo") Long comNo);
}