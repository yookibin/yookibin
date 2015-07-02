package com.java.date.eventboard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.eventboard.service.EventBoardService;
import com.java.date.member.dto.EventBoardDto;
import com.java.date.member.dto.EventMemberDto;

/**
 * @name : EventBoardController
 * @date : 2015. 6. 22.
 * @author : JeongSuhyun
 * @description : 요청된 주소에 따라 해당 함수를 실행한다.
 */
@Controller
public class EventBoardController {
	
	@Autowired
	private EventBoardService eventBoardService;
	
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name : eventWrite
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : request를 담은 mav를 가지고 eventWrite함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/write.do", method=RequestMethod.GET)
	public ModelAndView eventWrite(HttpServletRequest request){
		logger.info("event write");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventWrite(mav);
		
		return mav;		
	}
	
	/**
	 * @name : eventWrite
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : write.jsp로부터 받은 정보들을 담은 mav를 가지고 eventWriteOk함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/write.do", method=RequestMethod.POST)
	public ModelAndView eventWrite(MultipartHttpServletRequest request, EventBoardDto eventBoard){
		logger.info("event writeOk");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("eventBoard",eventBoard);
		
		eventBoardService.eventWriteOk(mav);
		
		return mav;		
	}
	
	/**
	 * @name : eventList
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : request를 담은 mav를 가지고 eventList함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/list.do", method=RequestMethod.GET)
	public ModelAndView eventList(HttpServletRequest request){
		logger.info("event list");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventList(mav);
		
		return mav;
	}
	
	/**
	 * @name : eventRead
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : read.jsp로 부터 전달받은 event_code와 pageNumber데이터를 담은 mav를 가지고 eventRead함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/read.do", method=RequestMethod.GET)
	public ModelAndView eventRead(HttpServletRequest request){
		//${root}/eventboard/read.do?event_code=${eventBoard.event_code}&pageNumber=${currentPage}
		logger.info("event read");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventRead(mav);
		
		return mav;
	}
	
	/**
	 * @name : eventDelete
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : eventBoardService의 eventDelete함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/delete.do", method=RequestMethod.GET)
	public ModelAndView eventDelete(HttpServletRequest request){
		//root+"/eventBoard/delete.do?event_code="+event_code+"&pageNumber="+pageNumber;
		logger.info("event Delete");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventDelete(mav);
		
		return mav;
	}

	/**
	 * @name : eventDelete
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : eventBoardService의 eventDeleteOk함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/delete.do", method=RequestMethod.POST)
	public ModelAndView eventDelete(HttpServletRequest request, EventBoardDto eventBoard){
		//root+"/eventBoard/delete.do?event_code="+event_code+"&pageNumber="+pageNumber;
		logger.info("event DeleteOk");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventDeleteOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : eventUpdate
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : eventBoardService의 eventUpdate함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/update.do", method=RequestMethod.GET)
	public ModelAndView eventUpdate(HttpServletRequest request){
		//root+"/eventBoard/update.do?event_code="+event_code+"&pageNumber="+pageNumber
		logger.info("event Update");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventUpdate(mav);
		
		return mav;		
	}
	
	/**
	 * @name : eventUpdate
	 * @date : 2015. 6. 24.
	 * @author : JeongSuhyun
	 * @description : update.jsp로부터 전달받은 수정할 데이터들을 mav에 담아 eventUpdateOk함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/update.do", method=RequestMethod.POST)
	public ModelAndView eventUpdate(HttpServletRequest request,EventBoardDto eventBoard){
		logger.info("update----------");
				
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("eventBoard",eventBoard);
		
		eventBoardService.eventUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : enter
	 * @date : 2015. 6. 26.
	 * @author : JeongSuhyun
	 * @description : eventBoardService의 eventEnter함수를 실행한다. 
	 */
	@RequestMapping(value="/eventBoard/enter.do", method=RequestMethod.GET)
	public ModelAndView enter(HttpServletRequest request){
		//root+"/eventBoard/enter.do?event_code="+event_code+"&pageNumber="+pageNumber
		logger.info("enter----------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventEnter(mav);
		
		return mav;
	}
	
	/**
	 * @name : join
	 * @date : 2015. 6. 25.
	 * @author : JeongSuhyun
	 * @description : event_code와 pageNumber를 mav에 담아 eventJoin함수를 실행한다.
	 */
	@RequestMapping(value="/eventBoard/join.do", method=RequestMethod.GET)
	public ModelAndView join(HttpServletRequest request){
		//root+"/eventBoard/join.do?event_code="+event_code+"&pageNumber="+pageNumber+"&id="+id+"&event_point="+event_point+"&form="+form
		logger.info("join----------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventJoin(mav);
		
		return mav;
	}
	
	/**
	 * @name : enter
	 * @date : 2015. 6. 26.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@RequestMapping(value="/eventBoard/enter.do", method=RequestMethod.POST)
	public ModelAndView enter(MultipartHttpServletRequest request, EventMemberDto eventMember){
		//root+"/eventBoard/enter.do?event_code="+event_code+"&pageNumber="+pageNumber
		logger.info("enterOk?----------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("eventMember",eventMember);
		
		eventBoardService.eventEnterOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : eventManagerList
	 * @date : 2015. 6. 30.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@RequestMapping(value="/eventBoard/managerList.do",method=RequestMethod.GET)
	public ModelAndView eventManagerList(HttpServletRequest request){
		//root+"/eventBoard/managerList.do?event_code="+event_code+"&pageNumber="+pageNumber;
		logger.info("eventManagerList----------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventManagerList(mav);
		
		return mav;
	}

	/**
	 * @name : eventManagerRead
	 * @date : 2015. 6. 30.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@RequestMapping(value="/eventBoard/managerRead.do",method=RequestMethod.GET)
	public ModelAndView eventManagerRead(HttpServletRequest request){
		//${root }/eventBoard/managerRead.do?join_code=${eventMember.join_code }&eventPageNumber=${eventPageNumber}&event_code=${eventMember.event_code}&pageNumber=${pageNumber}
		logger.info("eventManagerRead----------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		eventBoardService.eventManagerRead(mav);
		
		return mav;
	}

	/**
	 * @name : eventManagerDel
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@RequestMapping(value="/eventBoard/managerDel.do", method=RequestMethod.GET)
	public ModelAndView eventManagerDel(HttpServletRequest request){
		//root+"/eventBoard/managerDel.do?join_code="+join_code+"&event_code="+event_code+"&eventPageNumber="+eventPageNumber+"&pageNumber="+pageNumber;
		logger.info("eventManagerDel-----------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		eventBoardService.eventManagerDel(mav);
		
		return mav;
	}
	
	/**
	 * @name : eventManagerDel
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@RequestMapping(value="/eventBoard/managerDel.do", method=RequestMethod.POST)
	public ModelAndView eventManagerDel(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("eventManagerDelOk-----------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		eventBoardService.eventManagerDelOk(mav);
		
		return mav;
	}
	
}

