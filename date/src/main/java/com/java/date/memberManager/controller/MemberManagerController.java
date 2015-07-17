package com.java.date.memberManager.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.memberManager.service.MemberManagerService;

@Controller
public class MemberManagerController {
	
	Logger logger=Logger.getLogger(this.getClass().getName());

	@Autowired
	private MemberManagerService memberManagerService;
	
	@RequestMapping(value="membermanager/memberManager.do")
	public ModelAndView memberManagerMain (HttpServletRequest request){
		logger.info("membermanager //");
		ModelAndView mav=new ModelAndView();
		
		memberManagerService.memberManager(mav);
		//삭제해야될부분
	//	mav.setViewName("membermanager/memberManager");
		
		return mav;
	}
	
	@RequestMapping(value="membermanager/memberManagerDelete.do")
	public ModelAndView memberManagerDelete(HttpServletRequest request){
		logger.info("membermanagerDelete //");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberManagerService.memberManagerDelete(mav);
		return mav;
	}
	
	@RequestMapping(value="membermanager/memberManagerUpdate.do")
	public ModelAndView memberManagerUpdate(HttpServletRequest request){
		logger.info("membermanagerUpdate //");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberManagerService.memberManagerUpdate(mav);
		return mav;
	}
}
