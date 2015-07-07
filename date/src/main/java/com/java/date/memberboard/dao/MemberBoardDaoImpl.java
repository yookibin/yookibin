package com.java.date.memberboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;
import com.java.date.member.dto.RecommendBoardDto;


@Component
public class MemberBoardDaoImpl implements MemberBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(MemberBoardDto memberBoard) {
		int value=0;
		
		if(memberBoard.getBoard_fileName()!=null){
			value=sqlSession.insert("dao.memberBoardMapper.boardWriteFile", memberBoard);
		}else{
			value=sqlSession.insert("dao.memberBoardMapper.boardWrite", memberBoard);
		}
		return value;
		//return sqlSession.insert("dao.memberBoardMapper.boardWrite", memberBoard);
	}

	@Override
	public int getBoardCount() {
		
		return sqlSession.selectOne("dao.memberBoardMapper.getCount");
	}

	@Override
	public List<MemberBoardDto> getBoardList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSession.selectList("dao.memberBoardMapper.boardList", hMap);
	}

	@Override
	public MemberBoardDto boardRead(int board_num) {
		MemberBoardDto member=null;
		try{
			sqlSession.update("dao.memberBoardMapper.readCount", board_num);
			member=sqlSession.selectOne("dao.memberBoardMapper.boardRead", board_num);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public void replyInsert(MemberReplyDto memberReply) {
		
		sqlSession.insert("dao.memberBoardMapper.replyInsert", memberReply);
	}

	@Override
	public int replyCount(int board_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.memberBoardMapper.replyCount", board_num);
	}

	@Override
	public List<MemberReplyDto> replyList(int board_num) {
		return sqlSession.selectList("dao.memberBoardMapper.replyList", board_num);
	}

	@Override
	public int deleteBoard(int board_num) {
		sqlSession.delete("dao.memberBoardMapper.dropReply", board_num);
		return sqlSession.delete("dao.memberBoardMapper.deleteBoard", board_num);
	}

	@Override
	public void recomUpdate(int board_num) {
		
		sqlSession.update("dao.memberBoardMapper.recomUpdate", board_num);
	}

	@Override
	public MemberBoardDto selectBoard(int board_num) {
		return sqlSession.selectOne("dao.memberBoardMapper.selectBoard", board_num);
	}

	@Override
	public int updateBoard(MemberBoardDto memberBoard) {
		
		return sqlSession.update("dao.memberBoardMapper.updateBoard", memberBoard);
	}

	@Override
	public int selectRecommend(int board_num, String recommend_nickName) {
		System.out.println("selectRecommend:"+board_num+","+recommend_nickName);
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("board_num", board_num);
		hMap.put("recommend_nickName", recommend_nickName);
		
		int value=0;
		if(sqlSession.selectOne("dao.memberBoardMapper.selectRecommend", hMap)==null){
			value=0;
		}else{
			value=1;
		}
		return value;
	}

	@Override
	public void insertRecommend(RecommendBoardDto recom) {
		sqlSession.insert("dao.memberBoardMapper.insertRecommend", recom);
	}

	@Override
	public int selectBoardRecom(int board_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.memberBoardMapper.selectBoardRecom", board_num);
	}

	@Override
	public List<MemberBoardDto> getPopList() {
		
		return sqlSession.selectList("dao.memberBoardMapper.selectPop");
	}

	@Override
	public int popGroupNumber(int board_num) {
		
		return sqlSession.update("dao.memberBoardMapper.popGroupNumber",board_num);
	}

	@Override
	public int boardReset() {
		// TODO Auto-generated method stub
		return sqlSession.update("dao.memberBoardMapper.boardReset");
	}




}
