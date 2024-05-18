package com.project.jobs.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.project.jobs.dto.Company;

@Mapper
public interface ICompanyDao3854 {

    List<Company> getAllCompanies();

    Company getCompanyById(Long com_no);

    void insertCompany(Company company);

    void updateCompany(Company company);

    void deleteCompany(Long com_no);

    Company findByComIdAndComPw(@Param("com_id") String com_id, @Param("com_pw") String com_pw);
    
    int countByComId(@Param("com_id") String com_id);
    
    boolean existsByComId(String com_id);

	
}