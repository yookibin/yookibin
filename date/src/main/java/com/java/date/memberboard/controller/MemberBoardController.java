package com.java.date.memberboard.controller;


import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;
import com.java.date.member.dto.RecommendBoardDto;
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
/**
 * @author yookibin
 *
 */
/**
 * @author yookibin
 *
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
	@RequestMapping(value="/memberboard/writeOk.do", method=RequestMethod.POST)
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
	
	/**
	 * @name : boardRead
	 * @date : 2015. 7. 05.
	 * @author : 유기빈
	 * @description : 글내용 삭제 
	 */
	@RequestMapping(value="/memberboard/delete.do", method=RequestMethod.GET)
	public ModelAndView boardDelete(HttpServletRequest request){
		logger.info("boardDelete GET입니당");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.boardDelete(mav);
		
		return mav;
	}
	
	/**
	 * @name : boardSelect
	 * @date : 2015. 7. 6.
	 * @author : 유기빈
	 * @description : 수정 전 select해오기.
	 */
	@RequestMapping(value="/memberboard/update.do", method=RequestMethod.GET)
	public ModelAndView boardSelect(HttpServletRequest request){
		logger.info("boardSelect GET입니당.");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.boardSelect(mav);
		return mav;
	}
	
	/**
	 * @name : boardUpdate
	 * @date : 2015. 7. 6.
	 * @author : 유기빈
	 * @description : 수정후 성공여부 확인하기 위한 함수,
	 */
	@RequestMapping(value="/memberboard/update.do", method=RequestMethod.POST)
	public ModelAndView boardUpdate(HttpServletRequest request, MemberBoardDto memberBoard){
		logger.info("boardSelect POST입니당.");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberBoard", memberBoard);
		
		service.boardUpdate(mav);
		return mav;
	}
	
	
	/**
	 * @name : recommendBoard
	 * @date : 2015. 7. 6.
	 * @author : 유기빈
	 * @description : 해당 게시물에 추천했는지 여부와 안했으면 한 내용을 table에 담기 위한 함수.
	 */
	@RequestMapping(value="/memberboard/recommend.do", method=RequestMethod.GET)
	public ModelAndView recommendBoard(HttpServletRequest request, HttpServletResponse response, RecommendBoardDto recom){
		logger.info("recommendBoard GET입니당.");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("recom", recom);
		
		service.recommendBoard(mav);
		return null;
	}
	
	@RequestMapping(value="/memberboard/mygasipan.do", method=RequestMethod.GET)
	   public ModelAndView mygasipanList(HttpServletRequest request, HttpServletResponse response){
	      logger.info("게시판 Controller");
	      
	      ModelAndView mav= new ModelAndView();
	      mav.addObject("request",request);
	      
	      service.mygaipanList(mav);
	      return mav;
	   }
	
	
}
