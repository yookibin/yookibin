package com.java.date.memberboard.dao;

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
}
