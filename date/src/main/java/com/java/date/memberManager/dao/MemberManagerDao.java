package com.java.date.memberManager.dao;

import java.util.HashMap;
import java.util.List;

import com.java.date.member.dto.MemberDto;

public interface MemberManagerDao {
	public List<MemberDto> memberManeger();
	
	public int memberManagerDelete(String id);
	
	public int memberManagerUpdate(HashMap<String, String> hMap);
}
