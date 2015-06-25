package com.java.date.eventboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.EventBoardDto;

@Component
public class EventBoardDaoImpl implements EventBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int boardInsert(EventBoardDto eventBoard) {
		
		//return sqlSession.insert("dao.eventBoardMapper.write", eventBoard);
		int value=0;
		
		if(eventBoard.getEvent_fileName()!=null){		//파일이 존재할 때
			value=sqlSession.insert("dao.eventBoardMapper.boardInsertFile",eventBoard);
		}else{
			value=sqlSession.insert("dao.eventBoardMapper.boardInsert",eventBoard);
		}
		return value;
	}

	@Override
	public int boardCount() {
		
		return sqlSession.selectOne("dao.eventBoardMapper.boardCount");
	}

	@Override
	public List<EventBoardDto> boardList(HashMap<String, Integer> hMap) {
		
		return sqlSession.selectList("dao.eventBoardMapper.boardList",hMap);
	}

	@Override
	public EventBoardDto boardRead(int event_code) {
				
		return sqlSession.selectOne("dao.eventBoardMapper.boardRead",event_code);
	}

	@Override
	public int boardDelete(int event_code) {
		
		return sqlSession.delete("dao.eventBoardMapper.boardDelete",event_code);
	}

	@Override
	public EventBoardDto boardUpdateRead(int event_code) {
		
		return sqlSession.selectOne("dao.eventBoardMapper.boardRead",event_code);
	}

	@Override
	public int boardUpdate(EventBoardDto eventBoard) {		
		int value=0;
		
		if(eventBoard.getEvent_fileName()==null&&eventBoard.getEvent_fileSize()==0){
			//새로운 파일이 없음
			value=sqlSession.update("dao.eventBoardMapper.boardUpdate",eventBoard);
		}else{
			//새로운 파일이 있음
			value=sqlSession.update("dao.eventBoardMapper.boardUpdateFile",eventBoard);
		}
		
		return value;
	}

	@Override
	public int boardReadCount(int event_code) {
		
		return sqlSession.update("dao.eventBoardMapper.readCount",event_code);
	}

	
	
}
