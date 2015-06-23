package com.java.date.member.dao;

import java.util.List;

import com.java.date.member.dto.MemberDto;
import com.java.date.member.dto.MemberZipcodeDto;


public interface MemberDao {
	int memberRegister(MemberDto memberDto);
	
	public int idCheck(String id);
	
	public int nickNameCheck(String nickName);
	
	public List<MemberZipcodeDto> zipcode(String dong);
	
	public MemberDto login(String id, String password);
	
	public int delete(String id, String password);
	
	public MemberDto select(String id);
	
	/*public int update(MemberDto member);*/
}
