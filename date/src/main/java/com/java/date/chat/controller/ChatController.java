package com.java.date.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping(value="/chatStart.do", method=RequestMethod.GET)
	public ModelAndView chatStart(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		chatService.chatStart(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/chat.do", method=RequestMethod.GET)
	public ModelAndView chatEntrance(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		chatService.chatEntrance(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/chatRoom.do", method=RequestMethod.GET)
	public ModelAndView chatEntrance(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		chatService.chatEntranceRoom(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/chatDB.do", method=RequestMethod.GET)
	public ModelAndView chatDB(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		chatService.chatDB(mav);
		
		return mav;
	}
}
