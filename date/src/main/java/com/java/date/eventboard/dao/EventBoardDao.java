package com.java.date.eventboard.dao;

import java.util.HashMap;
import java.util.List;

import com.java.date.member.dto.EventBoardDto;
import com.java.date.member.dto.EventMemberDto;
import com.java.date.member.dto.MemberDto;

public interface EventBoardDao {
	
	public int boardInsert(EventBoardDto eventBoard);

	public int boardCount();

	public List<EventBoardDto> boardList(HashMap<String, Integer> hMap);

	public int boardReadCount(int event_code);

	public EventBoardDto boardRead(int event_code);

	public int boardDelete(int event_code);

	public int boardUpdate(EventBoardDto eventBoard);

	public MemberDto getMember(String id);

	public int getPoint(String id);
	
	public int joinWrite(EventMemberDto eventMember);
	
	public int pointWrite(HashMap<String, Object> hMap);
	
	public int eventManagerCount(int event_code);
	
	public List<EventMemberDto> eventManagerList(HashMap<String, Integer> hMap);
	
	public EventMemberDto eventManagerRead(int join_code);
	
	public int eventManagerDel(int event_code);
	
	public int boardGroupNumberMax();
	
	public int boardGroupNumberUpdate(HashMap<String,Integer> hMap);
	
	public List<EventMemberDto> getEventMembers(int event_code);
}
