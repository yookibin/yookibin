package com.java.date.memberboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.MemberBoardDto;


@Component
public class MemberBoardDaoImpl implements MemberBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(MemberBoardDto memberBoard) {
		
		return sqlSession.insert("dao.memberBoardMapper.boardWrite", memberBoard);
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
}
