package com.project.jobs.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.jobs.dao.ICompanyDao3854;
import com.project.jobs.dao.IMemberDao3854;
import com.project.jobs.dto.Company;

@Service
public class CompanyService3854 {

	@Autowired
	private ICompanyDao3854 companyDao;

	@Autowired
	private IMemberDao3854 memberDao;

	public List<Company> getAllCompanies() {
		return companyDao.getAllCompanies();
	}

	public Company getCompanyById(Long com_no) {
		return companyDao.getCompanyById(com_no);
	}

	public void insertCompany(Company company) {
		company.setMake_date(new Date());
		companyDao.insertCompany(company);
	}

	public void updateCompany(Company company) {
		companyDao.updateCompany(company);
	}

	public void deleteCompany(Long com_no) {
		companyDao.deleteCompany(com_no);
	}

	public boolean isComIdExists(String com_id) {
		return companyDao.existsByComId(com_id) || memberDao.existsByMemId(com_id);
	}

	public Company login(Company company) {
		return companyDao.findByComIdAndComPw(company.getCom_id(), company.getCom_pw());
	}

	public List<Company> getAllCompaniesWithInterests(Long mem_no) {
		List<Company> companies = companyDao.getAllCompanies();
		for (Company company : companies) {
			boolean isInterest = companyDao.isInterestCompany(mem_no, company.getCom_no());
			company.setInterest(isInterest);
		}
		return companies;
	}

	public boolean isInterestCompany(Long mem_no, Long com_no) {
		return companyDao.isInterestCompany(mem_no, com_no);
	}

	public boolean toggleInterestCompany(Long mem_no, Long com_no) {
		if (isInterestCompany(mem_no, com_no)) {
			companyDao.removeInterestCompany(mem_no, com_no);
			return false;
		} else {
			companyDao.addInterestCompany(mem_no, com_no);
			return true;
		}
	}

	public List<Company> getInterestCompanies(Long mem_no) {
		return companyDao.getInterestCompanies(mem_no);
	}
}