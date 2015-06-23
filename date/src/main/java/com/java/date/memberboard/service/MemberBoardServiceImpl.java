package com.java.date.memberboard.service;

import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.memberboard.dao.MemberBoardDao;




@Component
public class MemberBoardServiceImpl implements MemberBoardService {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MemberBoardDao memberBoardDao;

	@Override
	public void boardWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String pageNumber=null;
		
		if(request.getParameter("pageNumber")==null){
			pageNumber="1";
		}else if(request.getParameter("pageNumber")!=null){
			pageNumber=request.getParameter("pageNumber");
		}
		logger.info("pageNumber:"+pageNumber);
		
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("memberboard/write");
	}

	@Override
	public void boardWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MemberBoardDto memberBoard=(MemberBoardDto)map.get("memberBoard");
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		
		memberBoard.setBoard_date(new Date());
		memberBoard.setBoard_count(0);
		
		
	}
}
