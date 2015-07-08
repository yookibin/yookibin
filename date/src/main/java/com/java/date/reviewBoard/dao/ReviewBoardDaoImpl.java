package com.java.date.reviewBoard.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class ReviewBoardDaoImpl implements ReviewBoardDao {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public int replyWrite(int place_code, String lineReply) {
		HashMap<String, Object>hMap=new HashMap<String, Object>();
		hMap.put("place_code", place_code);
		hMap.put("lineReply", lineReply);
		
		return sqlSession.insert("dao.reviewBoardMapper.replyWrite",hMap);
	}
}
