package com.java.date.memberboard.service;

import org.springframework.web.servlet.ModelAndView;


public interface MemberBoardService {
	public void boardWrite(ModelAndView mav);
	
	public void boardWriteOk(ModelAndView mav);
}
