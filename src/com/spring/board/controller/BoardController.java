package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model,PageVo pageVo, HttpSession session) throws Exception{
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<BoardVo> menuList = new ArrayList<BoardVo>();
		JSONArray jArr = new JSONArray();
		String[] boardTypeArr = pageVo.getBoardTypeArr();
		int page = 1;
		int totalCnt = 0;
		
		if(boardTypeArr!=null){
			for(String str : boardTypeArr){
				JSONObject obj = new JSONObject();
				obj.put("type", str);
				jArr.add(obj);
			}
		}
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		boardList = boardService.SelectBoardList(pageVo);

		if(boardList.size()>0 && boardList!=null){
			 totalCnt = boardList.get(0).getTotalCnt();
		}
		
		menuList = boardService.selectMenuList();
		pageVo = boardService.pageCompute(pageVo.getPageNo(), totalCnt);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		model.addAttribute("page", pageVo);
		model.addAttribute("boardTypeCheck", jArr);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception{
		List<BoardVo> menuList = new ArrayList<BoardVo>();
		menuList = boardService.selectMenuList();
		model.addAttribute("menuList", menuList);
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		BoardVo boardVo = new BoardVo();
		boardVo =  boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardUpdate";
	}
	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale,BoardVo boardVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardUpdate(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/boardDeleteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDeleteAction(Locale locale,BoardVo boardVo) throws Exception{
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = boardService.boardDelete(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
		@RequestMapping(value = "/board/boardJoin.do", method = RequestMethod.GET)
	
	public String boardJoin(Locale locale, Model model) throws Exception{
		List<BoardVo> phoneList = new ArrayList<BoardVo>();
		phoneList = boardService.selectPhoneList();
		model.addAttribute("phoneList", phoneList);
		return "/board/boardJoin";
	}
		
	@RequestMapping(value = "/board/boardLogin.do", method = RequestMethod.GET)
	public String boardLogin(Locale locale) throws Exception{
		return "/board/boardLogin";
	}
	
	@RequestMapping(value = "/board/boardSelectIdList.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray boardSelectIdList(Locale locale) throws Exception{
		JSONArray jArr = boardService.selectUserList();
		
		System.out.println("JSONArray:"+jArr);
		
		return jArr;
	}
	
	@RequestMapping(value = "/board/boardJoinAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardJoinAction(Locale locale,BoardVo boardVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.userInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/boardLoginAction.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONArray boardLoginAction(Locale locale,BoardVo boardVo, HttpSession session) throws Exception{
		
		
		
		JSONArray resultJson = boardService.loginCheck(boardVo, session);
		
		
		System.out.println("resultJson :"+resultJson );
		
		return resultJson;
	}
	
	@RequestMapping(value = "/board/boardLogoutAction.do", method = RequestMethod.GET)
	@ResponseBody
	public String LogoutAction(Locale locale, HttpSession session) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		session.invalidate();
		result.put("success", "Y");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	
	
}
