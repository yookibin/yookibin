package com.java.date.memberboard.service;

import org.springframework.web.servlet.ModelAndView;


public interface MemberBoardService {

	public void boardWrite(ModelAndView mav);
	
	
	public void boardWriteOk(ModelAndView mav);
	
	
	public void boardList(ModelAndView mav);
	
	public void boardRead(ModelAndView mav);
	
	public void boardDelete(ModelAndView mav);
	
	public void boardSelect(ModelAndView mav);
	
	public void boardUpdate(ModelAndView mav);
	
	public void recommendBoard(ModelAndView mav);
	
	
}
