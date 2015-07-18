package com.java.date.chat.service;

import org.springframework.web.servlet.ModelAndView;

public interface ChatService {
	
	public void chatStart(ModelAndView mav);
	
	public void chatEntrance(ModelAndView mav);
	
	public void chatEntranceRoom(ModelAndView mav);
	
	public void chatDB(ModelAndView mav);
}
