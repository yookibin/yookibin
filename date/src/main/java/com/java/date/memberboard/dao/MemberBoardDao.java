package com.java.date.memberboard.dao;

import java.util.List;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;
import com.java.date.member.dto.RecommendBoardDto;


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
	
	public int deleteBoard(int board_num);
	
	public MemberBoardDto selectBoard(int board_num);
	
	public int updateBoard(MemberBoardDto memberBoard);
	
	public void replyInsert(MemberReplyDto memberReply);
	
	public int replyCount(int board_num);
	
	public List<MemberReplyDto> replyList(int board_num);
	
	
	
	// 추천수 증가시키기
	public void recomUpdate(int board_num);
	
	// 추천한 적 있는지 확인
	public int selectRecommend(int board_num, String recommend_nickName);
	
	// 추천 값 가져오기
	public int selectBoardRecom(int board_num);
	
	// 처음 추천하는 경우 중복 추천을 방지하기 위해 테이블에 담음.
	public void insertRecommend(RecommendBoardDto recom);
	
	// 추천에 따른 탑3 인기글넣기 
	public List<MemberBoardDto> getPopList();
	
	// 인기글 그룹넘버 업데이트
	public int popGroupNumber(int board_num);
	
	
	
	
}
