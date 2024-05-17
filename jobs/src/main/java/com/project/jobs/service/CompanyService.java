package com.project.jobs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.ICompanyDao5963;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.Region;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.jobs.dao.ICompanyDao3854;
import com.project.jobs.dto.Company;


@Service
public class CompanyService {


	@Autowired
	ICompanyDao5963 companyDao5963;
	
	//지역 리스트 가져오기
	public List<Region> getRegion(){
		List<Region> list = companyDao5963.getRegion();
		return list;
	}
	
	// 공고 등록하기
	public void registRecruit(Recruit recruit) {
		companyDao5963.registRecruit(recruit);
	}
	
	// 기업 번호로 공고 리스트 가져오기
	public List<Recruit> getComRecruitAllList(int com_no){
		
		List<Recruit> list = companyDao5963.getComRecruitAllList(com_no);
		
		return list;
	}

    @Autowired
    private ICompanyDao3854 companyDao;

    public List<Company> getAllCompanies() {
        return companyDao.getAllCompanies();
    }

    public Company getCompanyById(Long com_no) {
        return companyDao.getCompanyById(com_no);
    }

    public void insertCompany(Company company) {
        companyDao.insertCompany(company);
    }

    public void updateCompany(Company company) {
        companyDao.updateCompany(company);
    }

    public void deleteCompany(Long com_no) {
        companyDao.deleteCompany(com_no);
    }

    public Company login(String com_id, String com_pw) {
        return companyDao.findByComIdAndComPw(com_id, com_pw);
    }

}
