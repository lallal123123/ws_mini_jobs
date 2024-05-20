package com.project.jobs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Pagination {

	public long memoCnt;
	public long pageCnt;
	public long pageBlock;
	public long page;
	public long pageBlockMax;
	public long memoPerPage;
	public long pagePerBlock;
	public long begin;
	public long end;
	public long endMax;
	
	
}
