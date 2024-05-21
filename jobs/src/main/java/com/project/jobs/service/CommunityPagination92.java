package com.project.jobs.service;

import org.springframework.stereotype.Service;

import com.project.jobs.dto.Pagination;

@Service
public class CommunityPagination92 {
	

	public Pagination list(Long page,Long memoCnt) {
		Pagination pagination = new Pagination();
		
		//페이지당 메모수
		pagination.setMemoPerPage(10L);
		//블록당 페이지 수
		pagination.setPagePerBlock(5L);
		// 현재페이지
		pagination.setPage(page);
		
		// 전체 메모 수
		pagination.setMemoCnt(memoCnt); 		
		// 전체 페이지 수
		pagination.setPageCnt((memoCnt - 1) / pagination.getMemoPerPage()+ 1);
		// 현재 페이지 블록
		pagination.setPageBlock((pagination.getPage() - 1) / pagination.getPagePerBlock()+ 1);
		// 전체 페이지 블록 수
		pagination.setPageBlockMax((memoCnt - 1) / 50 + 1);
		
		//필요한 메모 리스트
		
		
		pagination.setEnd((pagination.getPageBlock() * pagination.getPagePerBlock()));
		pagination.setBegin((pagination.getEnd() - (pagination.getPagePerBlock()-1)));
		
	

		pagination.setEndMax(pagination.getPageCnt());

		return pagination;
	}
	
	public Pagination pageNext( Long pageBlock,Long memoCnt) {
		Pagination pagination = new Pagination();
		pagination.setMemoPerPage(10L);
		pagination.setPagePerBlock(5L);
		pagination.setPageBlock(pageBlock + 1);
		pagination.setPage((pagination.getPageBlock()* pagination.getPagePerBlock()) - (pagination.getPagePerBlock()-1));
		
		pagination.setPageCnt((memoCnt - 1) / 10 + 1);
		pagination.setEnd((pagination.getPageBlock() * pagination.getPagePerBlock()));
		pagination.setBegin((pagination.getEnd() - (pagination.getPagePerBlock()-1)));
		pagination.setPageBlockMax((memoCnt - 1) / 50 + 1);
		pagination.setEndMax(pagination.getPageCnt());
		
		return pagination;
	}
	
	public Pagination pagePre(Long pageBlock, Long memoCnt) {
		Pagination pagination = new Pagination();
		pagination.setMemoPerPage(10L);
		pagination.setPagePerBlock(5L);
		pagination.setPageBlock(pageBlock - 1);
		pagination.setPage((pagination.getPageBlock()* pagination.getPagePerBlock()) - (pagination.getPagePerBlock()-1));
		
		
		pagination.setPageCnt((memoCnt - 1) / 10 + 1);
		
		pagination.setEnd((pagination.getPageBlock() * pagination.getPagePerBlock()));
		pagination.setBegin((pagination.getEnd() - (pagination.getPagePerBlock()-1)));
		pagination.setPageBlockMax((memoCnt - 1) / 50 + 1);

		pagination.setEndMax(pagination.getPageCnt());

		return pagination;
	}
			
}
