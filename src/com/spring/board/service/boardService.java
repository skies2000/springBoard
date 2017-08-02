package com.spring.board.service;

import java.util.List;

import org.json.simple.JSONArray;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

public interface boardService {

	public String selectTest() throws Exception;

	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;
	
	public int boardDelete(BoardVo boardVo) throws Exception;
	
	public int boardUpdate(BoardVo boardVo) throws Exception;
	
	public List<BoardVo> selectMenuList() throws Exception;
	
	public List<BoardVo> selectPhoneList() throws Exception;
	
	public JSONArray selectUserList() throws Exception;
	
	public int userInsert(BoardVo boardVo) throws Exception;
	
	public int loginiCheck(BoardVo boardVo) throws Exception;
	
	public PageVo pageCompute(int nowPage,int totalCnt) throws Exception;
	
	public String loginIdSelect(String sessionId) throws Exception;
	
	
	
	
}