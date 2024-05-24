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
    @Select("SELECT r.*, c.* FROM recruit r JOIN company c ON r.com_no = c.com_no")
    List<Recruit> getAllRecruits();
	List<Recruit> getJobPostingsForInterestedCompanies(Long mem_no);
    
    
}