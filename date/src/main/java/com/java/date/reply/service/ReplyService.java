package com.java.date.reply.service;

import org.springframework.web.servlet.ModelAndView;


public interface ReplyService {
	public void reply(ModelAndView mav);
	
	public void replyDelete(ModelAndView mav);
	
	public void replyUpdate(ModelAndView mav);
	
	public void updateReply(ModelAndView mav);
	
}
