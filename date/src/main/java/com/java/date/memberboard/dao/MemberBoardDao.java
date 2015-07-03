package com.java.date.memberboard.dao;

import java.util.List;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;


public interface MemberBoardDao {
	/**
	 * @name : insert
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : write한  내용을 db에 insert하기 위한 함수
	 */
	public int insert(MemberBoardDto memberBoard);
	
	/**
	 * @name : getBoardCount
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 게시판테이블에 작성된 레코드들의 수를 가져오기 위한 함수.
	 */
	public int getBoardCount();
	
	/**
	 * @name : getBoardList
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 게시판에 글 목록을 뿌려주기 위해 지정해준 범위내의 레코드를 가져오기 위한 함수
	 */
	public List<MemberBoardDto> getBoardList(int startRow, int endRow);
	
	/**
	 * @name : boardRead
	 * @date : 2015. 6. 26.
	 * @author : 유기빈
	 * @description : 해당 글 목록을 읽기위한 함수
	 */
	public MemberBoardDto boardRead(int board_num);
	
	
	public void replyInsert(MemberReplyDto memberReply);
	
	public int replyCount(int board_num);
	
	public List<MemberReplyDto> replyList(int board_num);
	
	public int deleteBoard(int board_num, String pw);
	
	
}
