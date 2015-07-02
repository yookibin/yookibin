package com.java.date.eventboard.service;

import org.springframework.web.servlet.ModelAndView;

public interface EventBoardService {

	public void eventWrite(ModelAndView mav);

	public void eventWriteOk(ModelAndView mav);

	public void eventList(ModelAndView mav);

	public void eventRead(ModelAndView mav);

	public void eventDelete(ModelAndView mav);

	public void eventDeleteOk(ModelAndView mav);

	public void eventUpdate(ModelAndView mav);

	public void eventUpdateOk(ModelAndView mav);

	public void eventJoin(ModelAndView mav);
	
	public void eventEnter(ModelAndView mav);
	
	public void eventEnterOk(ModelAndView mav);
	
	public void eventManagerList(ModelAndView mav);
	
	public void eventManagerRead(ModelAndView mav);
	
	public void eventManagerDel(ModelAndView mav);
	
	public void eventManagerDelOk(ModelAndView mav);
	
}
