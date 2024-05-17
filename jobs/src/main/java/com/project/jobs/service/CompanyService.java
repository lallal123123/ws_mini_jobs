package com.project.jobs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.ICompanyDao5963;
import com.project.jobs.dto.Recruit;
import com.project.jobs.dto.Region;

@Service
public class CompanyService {

	@Autowired
	ICompanyDao5963 companyDao;
	
	//지역 리스트 가져오기
	public List<Region> getRegion(){
		List<Region> list = companyDao.getRegion();
		return list;
	}
	
	// 공고 등록하기
	public void registRecruit(Recruit recruit) {
		companyDao.registRecruit(recruit);
	}
	
	// 기업 번호로 공고 리스트 가져오기
	public List<Recruit> getComRecruitAllList(int com_no){
		
		List<Recruit> list = companyDao.getComRecruitAllList(com_no);
		
		return list;
	}
}
