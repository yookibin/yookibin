package com.java.date.chat.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.ChatDto;

@Component
public class ChatDaoImpl implements ChatDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createRoom(HashMap<String,Object> hMap) {
		
		return sqlSession.insert("dao.chatMapper.createRoom",hMap);
	}

	@Override
	public int maxRoomNum() {
		
		return sqlSession.selectOne("dao.chatMapper.maxRoomNum");
	}

	@Override
	public List<ChatDto> getRooms() {
		
		return sqlSession.selectList("dao.chatMapper.getRooms");
	}

	@Override
	public int deleteRoom(String roomNum) {
		
		return sqlSession.delete("dao.chatMapper.deleteRoom",roomNum);
	}

}
