package com.java.date.memberboard.service;

import org.springframework.web.servlet.ModelAndView;


public interface MemberBoardService {
	/**
	 * @name : boardWrite
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 회원추천 게시판 글쓰기 
	 */
	public void boardWrite(ModelAndView mav);
	
	/**
	 * @name : boardWriteOk
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 회원추천 게시판 글쓰기 성공여부를 확인 하는 함수
	 */
	public void boardWriteOk(ModelAndView mav);
	
	/**
	 * @name : boardList
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 회원추천 게시판 글 목록
	 */
	public void boardList(ModelAndView mav);
	
	/**
	 * @name : boardRead
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 회원 추천 게시판 글 내용 
	 */
	public void boardRead(ModelAndView mav);
	
	public void boardDelete(ModelAndView mav);
	
	public void boardSelect(ModelAndView mav);
	
	public void boardUpdate(ModelAndView mav);
	
	public void recommendBoard(ModelAndView mav);
	
	
}
