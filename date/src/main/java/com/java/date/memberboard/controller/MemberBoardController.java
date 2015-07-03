package com.java.date.memberboard.controller;


import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;
import com.java.date.memberboard.service.MemberBoardService;


/**
 * @name : MemberBoardController
 * @date : 2015. 6. 22.
 * @author : 유기빈
 * @description :회원추천게시판 컨트롤러.
 */
/**
 * @name : MemberBoardController
 * @date : 2015. 6. 23.
 * @author : 유기빈
 * @description :
 */
@Controller
public class MemberBoardController {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	MemberBoardService service;
	
	/**
	 * @name : boardWrite
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description :회원추천 게시판 글쓰기
	 * write 글내용부분 수정중.
	 */
	@RequestMapping(value="/memberboard/write.do", method=RequestMethod.GET)
	public ModelAndView boardWrite(HttpServletRequest request, HttpServletResponse response){
		logger.info("write GET입니다.---------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		service.boardWrite(mav);
		
		return mav;
	}
	
	/**
	 * @name : boardWrite
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 글쓰기 완료여부 확인 및 서비스로 값을 주고받기 위한 함수
	 */
	@RequestMapping(value="/memberboard/write.do", method=RequestMethod.POST)
	public ModelAndView boardWrite(MultipartHttpServletRequest request, MemberBoardDto memberBoard){
		logger.info("write POST입니다.---------------------");
		ModelAndView mav=new ModelAndView();
		
		/*System.out.println(memberBoard.getBoard_writer());
		System.out.println(memberBoard.getBoard_title());
		System.out.println(memberBoard.getBoard_content());*/
		
		mav.addObject("request", request);
		mav.addObject("memberBoard", memberBoard);
		service.boardWriteOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : boardList
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description :글목록 가져오기.
	 */
	@RequestMapping(value="/memberboard/list.do", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request){
		logger.info("boardList입니다.");
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		service.boardList(mav);
		return mav;
	}
	
	/**
	 * @name : boardRead
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 글내용 보기위한 함수. 
	 * 이 부분은 write 글내용넣기 수정한 후에 다시 해야함.
	 */
	@RequestMapping(value="/memberboard/read.do", method=RequestMethod.GET)
	public ModelAndView boardRead(HttpServletRequest request, MemberReplyDto memberReply){
		
		logger.info("boardRead입니당.");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberReply", memberReply);
		service.boardRead(mav);
		return mav;
	}
	
	@RequestMapping(value="/memberboard/delete.do", method=RequestMethod.GET)
	public ModelAndView boardDelete(HttpServletRequest request){
		logger.info("boardDelete GET입니당");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.boardDelete(mav);
		
		return mav;
	}
	@RequestMapping(value="/board/deleteOk.do", method=RequestMethod.POST)
	public ModelAndView boardDelete(HttpServletRequest request, HttpServletResponse response){
		logger.info("boardDelete POST입니당");
		logger.info(request.getParameter("board_num"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.boardDeleteOk(mav);
		return mav;
	}
}
