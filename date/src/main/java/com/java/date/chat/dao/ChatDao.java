package com.java.date.chat.dao;

import java.util.HashMap;
import java.util.List;

import com.java.date.member.dto.ChatDto;

public interface ChatDao {
	public int createRoom(HashMap<String, Object> hMap);
	
	public int maxRoomNum();
	
	public List<ChatDto> getRooms();
	
	public int deleteRoom(String roomNum);
}
