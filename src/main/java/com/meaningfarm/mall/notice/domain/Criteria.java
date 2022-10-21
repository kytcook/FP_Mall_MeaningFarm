package com.meaningfarm.mall.notice.domain;

public class Criteria {
	//rNum의 제한값과 현재 페이지, 페이지에 출력되는 게시물 숫자를 제어함
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;

	public Criteria() { // 기본 1 페이지 출력 10개
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) { //아무것도 없을때 처리
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}


	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}

	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "" + ", rowStart=" + getRowStart()
		+ ", rowEnd=" + getRowEnd() + "]";
	}
}