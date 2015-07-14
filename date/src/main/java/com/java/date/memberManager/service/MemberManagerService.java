package com.java.date.memberManager.service;

import org.springframework.web.servlet.ModelAndView;


public interface MemberManagerService {
	public void memberManager(ModelAndView mav);
	
	public void memberManagerDelete(ModelAndView mav);
	
	public void memberManagerUpdate(ModelAndView mav);
}
