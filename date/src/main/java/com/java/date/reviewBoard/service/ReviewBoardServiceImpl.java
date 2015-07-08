package com.java.date.reviewBoard.service;

import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.reviewBoard.dao.ReviewBoardDao;

@Component
public class ReviewBoardServiceImpl implements ReviewBoardService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ReviewBoardDao reviewBoardDao;
	
	@Override
	public void replyWrite(ModelAndView mav) {
		Map<String, Object>map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int place_code=Integer.parseInt(request.getParameter("place_code"));
		String lineReply=request.getParameter("lineReply");
		
		logger.info("place_code:"+place_code+"   "+"lineReply:"+lineReply);
		
		int check=reviewBoardDao.replyWrite(place_code,lineReply);
		logger.info("check :" +check);
	}
}
