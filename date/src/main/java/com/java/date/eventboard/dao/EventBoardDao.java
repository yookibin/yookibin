package com.java.date.eventboard.dao;

import java.util.HashMap;
import java.util.List;

import com.java.date.member.dto.EventBoardDto;

public interface EventBoardDao {
	public int boardInsert(EventBoardDto eventBoard);
	
	public int boardCount();
	
	public List<EventBoardDto> boardList(HashMap<String, Integer> hMap);
	
	public int boardReadCount(int event_code);
	
	public EventBoardDto boardRead(int event_code);
	
	public int boardDelete(int event_code);
	
	public EventBoardDto boardUpdate(int event_code);
	
	public int boardUpdate(EventBoardDto eventBoard);
}
