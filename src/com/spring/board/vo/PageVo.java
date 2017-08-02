package com.spring.board.vo;

public class PageVo {
	
	private int pageNo = 0;
	private String[] boardTypeArr;
	
	//페이지 분리 관련 변수 선언
	
	private int listSize = 10; 
	private int blockSize = 5; // 한블럭당 표시 페이지수
		
	private	int totList = 0; //리스트 전체 갯수
	private	int totPage = 0; //전체 페이지수
	private	int totBlock = 0; //전체 블럭수
		
	private	int nowBlock = 1; //현재 블럭
		
	private	int startNo = 0; //리스트 목록의 시작 위치
	private	int endNo = 0; //리스트 목록의 마지막 위치
		
	private	int startPage = 0; //한블럭에 표시할 시작 페이지 번호
	private	int endPage = 0; //한블럭에 표시할 마지막 페이지 번호

	
	
	
	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotList() {
		return totList;
	}

	public void setTotList(int totList) {
		this.totList = totList;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

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
