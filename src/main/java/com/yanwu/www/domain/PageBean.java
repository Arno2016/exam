package com.yanwu.www.domain;

import org.springframework.stereotype.Repository;

@Repository
public class PageBean {

	private int curPageNum; // 第几页
	private int pageSize; // 每页记录数
	private int start;  // 起始记录数
	
	public PageBean(){}
	public PageBean(int curPageNum, int pageSize) {
		super();
		this.curPageNum = curPageNum;
		this.pageSize = pageSize;
	}
	
	
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStart() {
		return (curPageNum-1)*pageSize;
	}



	public int getCurPageNum() {
		return curPageNum;
	}



	public void setCurPageNum(int curPageNum) {
		this.curPageNum = curPageNum;
	}
	
	
}
