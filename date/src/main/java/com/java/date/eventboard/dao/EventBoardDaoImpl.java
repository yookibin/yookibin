package com.java.date.eventboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.EventBoardDto;
import com.java.date.member.dto.EventMemberDto;
import com.java.date.member.dto.MemberDto;

/**
 * @name : EventBoardDaoImpl
 * @date : 2015. 6. 22.
 * @author : JeongSuhyun
 * @description : SqlSessionTemplate클래스의 변수를 통해 mapper.xml의 쿼리문으로 연결시킨다.
 */
@Component
public class EventBoardDaoImpl implements EventBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * @name : boardInsert
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : 파일이 존재할때와 존재하지 않을때를 나눠 event_board테이블에 레코드를 insert한다.
	 */
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

	/**
	 * @name : boardCount
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_board테이블의 총 레코드 수를 세어 반환한다.
	 */
	@Override
	public int boardCount() {
		
		return sqlSession.selectOne("dao.eventBoardMapper.boardCount");
	}

	/**
	 * @name : boardList
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_board테이블에 존재하는 모든 레코드들을 List에 담아 반환한다.
	 */
	@Override
	public List<EventBoardDto> boardList(HashMap<String, Integer> hMap) {
		
		return sqlSession.selectList("dao.eventBoardMapper.boardList",hMap);
	}

	/**
	 * @name : boardRead
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_board테이블에서 event_code에 해당하는 레코드하나를 EventBoardDto객체 하나를 반환한다.
	 */
	@Override
	public EventBoardDto boardRead(int event_code) {
				
		return sqlSession.selectOne("dao.eventBoardMapper.boardRead",event_code);
	}

	/**
	 * @name : boardDelete
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : event_board테이블에서 event_code에 해당하는 레코드를 삭제한다.
	 */
	@Override
	public int boardDelete(int event_code) {
		
		return sqlSession.delete("dao.eventBoardMapper.boardDelete",event_code);
	}

	/**
	 * @name : boardUpdate
	 * @date : 2015. 6. 24.
	 * @author : JeongSuhyun
	 * @description : 파일이 존재할때와 존재하지 않을 때를 구분하여 데이터들을 event_board테이블에 업데이트 한다.
	 */
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

	/**
	 * @name : boardReadCount
	 * @date : 2015. 6. 25.
	 * @author : JeongSuhyun
	 * @description : 업데이트 전 event_board테이블의 read_count를 업데이트한다.
	 */
	@Override
	public int boardReadCount(int event_code) {
		
		return sqlSession.update("dao.eventBoardMapper.readCount",event_code);
	}
	
	/**
	 * @name : getMember
	 * @date : 2015. 6. 26.
	 * @author : JeongSuhyun
	 * @description : 현재 로그인 되어있는 회원의 회원정보를 반환한다.
	 */
	@Override
	public MemberDto getMember(String id) {
		
		return sqlSession.selectOne("dao.eventBoardMapper.getMember",id);
	}
	
	/**
	 * @name : getPoint
	 * @date : 2015. 6. 26.
	 * @author : JeongSuhyun
	 * @description : point테이블에 접근하여 현재 로그인 되어있는 회원의 포인트 합계를 반환한다.
	 */
	@Override
	public int getPoint(String id) {
		
		return sqlSession.selectOne("dao.eventBoardMapper.getPoint",id);
	}

	/**
	 * @name : joinWrite
	 * @date : 2015. 6. 29.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@Override
	public int joinWrite(EventMemberDto eventMember) {
		
		int value=0;
		
		if(eventMember.getJoin_fileName()!=null){		//파일이 존재할 때
			value=sqlSession.insert("dao.eventBoardMapper.joinWriteFile",eventMember);
		}else{
			value=sqlSession.insert("dao.eventBoardMapper.joinWrite",eventMember);
		}
		return value;
	}

	/**
	 * @name : pointWrite
	 * @date : 2015. 6. 29.
	 * @author : JeongSuhyun
	 * @description :
	 */
	@Override
	public int pointWrite(HashMap<String, Object> hMap) {
		
		return sqlSession.insert("dao.eventBoardMapper.pointWrite",hMap);
	}

	/**
	 * @name : eventManagerCount
	 * @date : 2015. 6. 30.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@Override
	public int eventManagerCount(int event_code) {
		
		return sqlSession.selectOne("dao.eventBoardMapper.eventManagerCount", event_code);
	}

	/**
	 * @name : eventManagerList
	 * @date : 2015. 6. 30.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@Override
	public List<EventMemberDto> eventManagerList(HashMap<String, Integer> hMap) {
	
		return sqlSession.selectList("dao.eventBoardMapper.eventManagerList", hMap);
	}

	/**
	 * @name : eventManagerRead
	 * @date : 2015. 6. 30.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@Override
	public EventMemberDto eventManagerRead(int join_code) {
		
		return sqlSession.selectOne("dao.eventBoardMapper.eventManagerRead", join_code);
	}

	/**
	 * @name : eventManagerDel
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@Override
	public int eventManagerDel(int join_code) {
		
		return sqlSession.delete("dao.eventBoardMapper.eventManagerDel", join_code);
	}

	/**
	 * @name : boardGroupNumberMax
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@Override
	public int boardGroupNumberMax() {
		
		return sqlSession.selectOne("dao.eventBoardMapper.boardGroupNumberMax");
	}

	/**
	 * @name : boardGroupNumberUpdate
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@Override
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap) {
		
		return sqlSession.update("dao.eventBoardMapper.boardGroupNumberUpdate", hMap);
	}

	/**
	 * @name : getEventMembers
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : 
	 */
	@Override
	public List<EventMemberDto> getEventMembers(int event_code) {
		
		return sqlSession.selectList("dao.eventBoardMapper.getEventMembers", event_code);
	}
	

	
	
}
