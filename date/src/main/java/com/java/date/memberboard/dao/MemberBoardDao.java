package com.java.date.memberboard.dao;

import java.util.List;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;
import com.java.date.member.dto.RecommendBoardDto;


public interface MemberBoardDao {
	
	public int insert(MemberBoardDto memberBoard);
	
	public int getBoardCount();
	
	public List<MemberBoardDto> getBoardList(int startRow,int endRow);
	
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
	
	public int boardReset();
	
	// 토탈포인트 가져오기
	public int getPoint(String id);
	
	// 포인트지급 
	public void pointGive(String id, int totalPoint);

	public List<MemberBoardDto> Selectmygasipan(String id);
	
	
	
	
}
