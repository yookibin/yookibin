package com.java.date.reply.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;







import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.MemberReplyDto;
import com.java.date.reply.service.ReplyService;

@Controller
public class ReplyController {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value="/reply/reply.do", method=RequestMethod.GET)
	public ModelAndView readList(HttpServletRequest request,HttpServletResponse response, MemberReplyDto memberReply){
		logger.info("reply페이지입니당.");
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberReply", memberReply);
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		replyService.reply(mav);
		return null;
	}
	
	@RequestMapping(value="/reply/replyDelete.do", method=RequestMethod.GET)
	public ModelAndView replyDelete(HttpServletRequest request, HttpServletResponse response){
		logger.info("replyDelete GET입니당.");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		
		replyService.replyDelete(mav);
		return null;
	}
	
	@RequestMapping(value="/reply/replyUpdate.do", method=RequestMethod.GET)
	public ModelAndView replyUpdate(HttpServletRequest request, HttpServletResponse response){
		logger.info("replyUpdate GET입니당.");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		replyService.replyUpdate(mav);
		return null;
	}
	
	@RequestMapping(value="/reply/update.do", method=RequestMethod.GET)
	public ModelAndView updateReply(HttpServletRequest request, HttpServletResponse response){
		logger.info("updateReply GET입니당.");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		replyService.updateReply(mav);
		return null;
	}
	
	
}
