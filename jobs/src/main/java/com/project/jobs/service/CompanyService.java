package com.project.jobs.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.jobs.dao.ICompanyDao3854;
import com.project.jobs.dto.Company;

@Service
public class CompanyService {

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
