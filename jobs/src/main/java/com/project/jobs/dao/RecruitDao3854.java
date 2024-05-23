package com.project.jobs.dao;

import com.project.jobs.dto.Recruit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;

@Mapper
public interface RecruitDao3854 {
    @Select("SELECT * FROM recruit WHERE recruit_no = #{recruit_no}")
    Recruit getRecruitById(Long recruit_no);

    @Select("SELECT r.* FROM recruit r JOIN com_interest ci ON r.com_no = ci.com_no WHERE ci.mem_no = #{mem_no}")
    List<Recruit> getJobPostingsForInterestedCompanies(@Param("mem_no") Long mem_no);
}