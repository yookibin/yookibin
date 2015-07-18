package com.java.date.chat.service;

//import java.util.ArrayList;
//import java.util.List;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.chat.dao.ChatDao;
import com.java.date.member.dto.ChatDto;

@Component
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	private Logger logger=Logger.getLogger(this.getClass().getName());
	//private List<String> idList=new ArrayList<String>();
	
	@Override
	public void chatStart(ModelAndView mav) {
		logger.info("service chatStart");
		
		mav.setViewName("chat/chatLogin");		
	}
	
	@Override
	public void chatEntrance(ModelAndView mav) {
		logger.info("service chatEntrance");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");		
		String chatId=request.getParameter("chatId");
		
		//DB에서 방들을 가져옴 list로
		List<ChatDto> list=chatDao.getRooms();
		logger.info("chatEntrance listsize: "+list.size());
		
		mav.addObject("chatId", chatId);
		mav.addObject("list",list);
		
		mav.setViewName("chat/chatRoom");
		
	}

	@Override
	public void chatEntranceRoom(ModelAndView mav) {
		//root+"/chatRoom.do?chatId=${chatId}&roomName="+button.value;
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String chatId=request.getParameter("chatId");
		String roomName=request.getParameter("roomName");
		String roomNum=request.getParameter("roomNum");
		logger.info("chatId: "+chatId+" roomName: "+roomName+" roomNum: "+roomNum);		
		
		mav.addObject("chatId",chatId);
		mav.addObject("roomName",roomName);
		mav.addObject("roomNum",roomNum);
		
		mav.setViewName("chat/chat");
		
	}

	@Override
	public void chatDB(ModelAndView mav) {
		//root+"/chatDB.do?chatId=${chatId}&roomName="+roomName;
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String chatId=request.getParameter("chatId");
		String roomName=request.getParameter("roomName");
		logger.info("chatId: "+chatId+" roomName: "+roomName);
		
		int maxRoomNum=chatDao.maxRoomNum();
		logger.info("maxRoomNum: "+maxRoomNum);
		int roomNum=maxRoomNum+1;
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("roomName", roomName);
		hMap.put("roomNum", roomNum);		
		
		int check=chatDao.createRoom(hMap);
		logger.info("chatDB check: "+check);
		
		mav.addObject("chatId",chatId);
		mav.addObject("roomName",roomName);
		mav.addObject("roomNum",roomNum);
		
		mav.setViewName("chat/chatStation");
		
		
		
	}


}
