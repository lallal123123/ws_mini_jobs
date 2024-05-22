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

   int countByComId(@Param("com_id") String com_id);

   boolean existsByComId(@Param("com_id") String com_id);

   Company findByComIdAndComPw(@Param("com_id") String com_id, @Param("com_pw") String com_pw);

   void addInterestCompany(@Param("mem_no") Long mem_no, @Param("com_no") Long com_no);

   void removeInterestCompany(@Param("mem_no") Long mem_no, @Param("com_no") Long com_no);

   List<Company> getInterestCompanies(@Param("mem_no") Long mem_no);

   boolean isInterestCompany(@Param("mem_no") Long mem_no, @Param("com_no") Long com_no);

   void addNotInterestCompany(@Param("mem_no") Long mem_no, @Param("com_no") Long com_no);

   void removeNotInterestCompany(@Param("mem_no") Long mem_no, @Param("com_no") Long com_no);

   boolean isNotInterestCompany(@Param("mem_no") Long mem_no, @Param("com_no") Long com_no);

   List<Company> getNotInterestCompanies(@Param("mem_no") Long mem_no);
   
   List<Company> getAllCompaniesWithoutNotInterested(@Param("mem_no") Long mem_no);
}