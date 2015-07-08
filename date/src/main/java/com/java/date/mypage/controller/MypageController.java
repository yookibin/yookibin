package com.java.date.mypage.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.date.mypage.service.MypageServiceImpl;

@Controller
public class MypageController {
	@Autowired
	private MypageServiceImpl mypageServiceImpl;
	
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/mypage/mycourse.do",method=RequestMethod.GET)
	public String mycouse(HttpServletRequest request, HttpServletResponse response){
		logger.info("mycourse Start----------------");
		
		return "mypage/mycourse";
	}

}
