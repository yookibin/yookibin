package com.java.date.memberManager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.MemberDto;
import com.java.date.memberManager.dao.MemberManagerDao;

@Component
public class MemberManagerServiceImpl implements MemberManagerService {
	
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MemberManagerDao memberManagerDao;

	@Override
	public void memberManager(ModelAndView mav) {
		logger.info("memberManagerService //");
		
		List<MemberDto> list=memberManagerDao.memberManeger();
		mav.addObject("list",list);
		mav.setViewName("membermanager/memberManager");
	}

	@Override
	public void memberManagerDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest requset=(HttpServletRequest) map.get("request");
		String id=requset.getParameter("id");
		int check=memberManagerDao.memberManagerDelete(id);
		logger.info("delete check:"+check);
		
		List<MemberDto> list=memberManagerDao.memberManeger();
		mav.addObject("list",list);
		mav.setViewName("membermanager/memberManager");
	}

	@Override
	public void memberManagerUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest requset=(HttpServletRequest) map.get("request");
		String member_level=requset.getParameter("member_level");
		String id=requset.getParameter("id");
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("member_level", member_level);
		hMap.put("id", id);
		int check=memberManagerDao.memberManagerUpdate(hMap);
		logger.info("update check:"+check);
		
		List<MemberDto> list=memberManagerDao.memberManeger();
		mav.addObject("list",list);
		mav.setViewName("membermanager/memberManager");
		
	}
	
}
