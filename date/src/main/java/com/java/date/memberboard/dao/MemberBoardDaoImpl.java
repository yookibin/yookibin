package com.java.date.memberboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;


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
		return sqlSession.selectOne("dao.memberBoardMapper.boardRead", board_num);
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


}
