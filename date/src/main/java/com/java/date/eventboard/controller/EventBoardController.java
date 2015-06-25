package com.java.date.eventboard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.eventboard.service.EventBoardService;
import com.java.date.member.dto.EventBoardDto;

@Controller
public class EventBoardController {
	
	@Autowired
	private EventBoardService eventBoardService;
	
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/eventBoard/wirte.do", method=RequestMethod.GET)
	public ModelAndView eventWrite(HttpServletRequest request){
		logger.info("event write");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventWrite(mav);
		
		return mav;		
	}
	
	@RequestMapping(value="/eventBoard/wirte.do", method=RequestMethod.POST)
	public ModelAndView eventWrite(MultipartHttpServletRequest request, EventBoardDto eventBoard){
		logger.info("event writeOk");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("eventBoard",eventBoard);
		
		eventBoardService.eventWriteOk(mav);
		
		return mav;		
	}
	
	@RequestMapping(value="/eventBoard/list.do", method=RequestMethod.GET)
	public ModelAndView eventList(HttpServletRequest request){
		logger.info("event list");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventList(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/eventBoard/read.do", method=RequestMethod.GET)
	public ModelAndView eventRead(HttpServletRequest request){
		//${root}/eventboard/read.do?event_code=${eventBoard.event_code}&pageNumber=${currentPage}
		logger.info("event read");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventRead(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/eventBoard/delete.do", method=RequestMethod.GET)
	public ModelAndView eventDelete(HttpServletRequest request){
		//root+"/eventBoard/delete.do?event_code="+event_code+"&pageNumber="+pageNumber;
		logger.info("event Delete");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventDelete(mav);
		
		return mav;
	}

	@RequestMapping(value="/eventBoard/delete.do", method=RequestMethod.POST)
	public ModelAndView eventDelete(HttpServletRequest request, EventBoardDto eventBoard){
		//root+"/eventBoard/delete.do?event_code="+event_code+"&pageNumber="+pageNumber;
		logger.info("event DeleteOk");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventDeleteOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/eventBoard/update.do", method=RequestMethod.GET)
	public ModelAndView eventUpdate(HttpServletRequest request){
		//root+"/eventBoard/update.do?event_code="+event_code+"&pageNumber="+pageNumber
		logger.info("event Update");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventUpdate(mav);
		
		return mav;		
	}
	
	@RequestMapping(value="/eventBoard/update.do", method=RequestMethod.POST)
	public ModelAndView update(MultipartHttpServletRequest request,EventBoardDto eventBoard){
		logger.info("update----------");
				
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("eventBoard",eventBoard);
		
		eventBoardService.eventUpdateOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/eventBoard/join.do", method=RequestMethod.GET)
	public ModelAndView join(HttpServletRequest request){
		//${root}/eventBoard/join.do?event_code=${eventBoard.event_code }&pageNumber=${pageNumber }
		logger.info("join----------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventJoin(mav);
		
		return mav;
	}
	
}

