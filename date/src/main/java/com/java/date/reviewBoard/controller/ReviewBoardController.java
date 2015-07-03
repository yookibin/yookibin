package com.java.date.reviewBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.reviewBoard.service.ReviewBoardService;

@Controller
public class ReviewBoardController {
	@Autowired
	private ReviewBoardService reviewBoardService;
	
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/reviewBoard/replyWrite.do")
	public ModelAndView replyWrite(HttpServletRequest request,HttpServletResponse response){
		
		logger.info("----------replyWrite");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		reviewBoardService.replyWrite(mav);
	
		return null;
	}
}
