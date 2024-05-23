package com.project.jobs.dao;

import com.project.jobs.dto.Com_detail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ComDetailDao3854 {
    
    @Select("SELECT * FROM com_detail WHERE com_no = #{com_no}")
    Com_detail getComDetailByCompanyId(Long com_no);
}