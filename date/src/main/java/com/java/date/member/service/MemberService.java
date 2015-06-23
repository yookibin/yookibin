package com.java.date.member.service;

import org.springframework.web.servlet.ModelAndView;



public interface MemberService {
	public void memberRegisterOk(ModelAndView mav);
	
	public void idCheck(ModelAndView mav);
	
	public void nickNameCheck(ModelAndView mav);
	
	public void zipcode(ModelAndView mav);
	
	public void login(ModelAndView mav);
	
	public void delete(ModelAndView mav);
	
	public void select(ModelAndView mav);
	
	/*public void update(ModelAndView mav);*/
	
}
