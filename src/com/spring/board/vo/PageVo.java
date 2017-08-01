package com.spring.board.vo;

public class PageVo {
	
	private int pageNo = 0;
	private String[] boardTypeArr;

	
	
	
	public String[] getBoardTypeArr() {
		return boardTypeArr;
	}

	public void setBoardTypeArr(String[] boardTypeArr) {
		this.boardTypeArr = boardTypeArr;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
}
