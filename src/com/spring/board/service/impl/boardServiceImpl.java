package com.spring.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

import net.sf.json.JSONObject;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}
	
	@Override
	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.selectBoardList(pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCnt();
	}
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.boardInsert(boardVo);
	}
	
	@Override
	public int boardDelete(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.boardDelete(boardVo);
	}
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.boardUpdate(boardVo);
	}
	 @Override
	public List<BoardVo> selectMenuList() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.menuList();
	}
	@Override
	public List<BoardVo> selectPhoneList() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.phoneList();
	}
	@Override
	public JSONArray selectUserList() throws Exception {
		JSONArray jArr = new JSONArray();
		List<BoardVo>list = boardDao.userList();
		for(BoardVo vo: list){
			JSONObject jObj = new JSONObject();
			jObj.put("userId", vo.getUserId());
			jArr.add(jObj);
		}
		return jArr;
	}
	@Override
	public int userInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.userInsert(boardVo);
	}
	
	@Override
	public int loginiCheck(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.loginCheck(boardVo);
	}
	
	@Override
	 public PageVo pageCompute(int nowPage,int totalCnt){
		 PageVo pVo = new PageVo();
		  
		  int totList = 0; //리스트 전체 개수
		  int totPage = 0; // 전체 페이지수
		  int totBlock = 0;	//전체 블럭수
		  
		  int nowBlock = 1; // 현재 블럭
		  int startNo = 0; //리스트 목록의 시작위치
		  int endNo = 0; //리스트 목록의 마지막 위치
		  
		  int startPage = 0; // 한블럭에 표시할 시작 페이지 번호
		  int endPage = 0; // 한블럭에 표시할 마지막 페이지 번호
		 
		  totList = totalCnt;
		  
			  totPage = (int)Math.ceil(totList/(pVo.getListSize()*1.0));
			  totBlock = (int)Math.ceil(totPage/(pVo.getBlockSize()*1.0));
			  nowBlock = (int)Math.ceil(nowPage/(pVo.getBlockSize()*1.0));
			  
			  endPage = nowBlock * pVo.getBlockSize();
			  startPage = endPage - pVo.getBlockSize()+1;
			  endNo = nowPage * pVo.getListSize(); 
			  startNo = endNo - pVo.getListSize();
			  
			  if(endPage > totPage) endPage = totPage;
			  if(endNo > totList) endNo = totList;
			  
			  pVo.setTotList(totList);
			  pVo.setTotBlock(totBlock);
			  pVo.setEndNo(endNo);
			  pVo.setEndPage(endPage);
			  pVo.setNowBlock(nowBlock);
			  pVo.setStartNo(startNo);
			  pVo.setStartPage(startPage);
			  pVo.setTotPage(totPage);
			  return pVo;
	 }
	
	@Override
	public String loginIdSelect(String sessionId) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.loginIdSelect(sessionId);
	}
}


