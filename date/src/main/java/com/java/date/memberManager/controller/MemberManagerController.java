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
	
	@RequestMapping(value="membermanager/memberManagerMain.do")
	public String memberManagerMain (HttpServletRequest request){
		logger.info("membermanager //");
		
		return "membermanager/memberManagerMain";
	}
}
