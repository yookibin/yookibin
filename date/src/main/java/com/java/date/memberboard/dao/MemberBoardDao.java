package com.java.date.memberboard.dao;

import java.util.List;

import com.java.date.member.dto.MemberBoardDto;


public interface MemberBoardDao {
	public int insert(MemberBoardDto memberBoard);
	
	public int getBoardCount();
	
	public List<MemberBoardDto> getBoardList(int startRow, int endRow);
	
	public MemberBoardDto boardRead(int board_num);
}
