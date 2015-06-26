package com.java.date.eventboard.dao;

import java.util.HashMap;
import java.util.List;

import com.java.date.member.dto.EventBoardDto;

public interface EventBoardDao {

	/**
	 * @name : boardInsert
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : 파일이 존재할때와 존재하지 않을때를 나눠 event_board테이블에 레코드를 insert한다.
	 */
	public int boardInsert(EventBoardDto eventBoard);

	/**
	 * @name : boardCount
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_board테이블의 총 레코드 수를 세어 반환한다.
	 */
	public int boardCount();

	/**
	 * @name : boardList
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_board테이블에 존재하는 모든 레코드들을 List에 담아 반환한다.
	 */
	public List<EventBoardDto> boardList(HashMap<String, Integer> hMap);

	/**
	 * @name : boardReadCount
	 * @date : 2015. 6. 25.
	 * @author : JeongSuhyun
	 * @description : 업데이트 전 event_board테이블의 read_count를 업데이트한다.
	 */
	public int boardReadCount(int event_code);

	/**
	 * @name : boardRead
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_board테이블에서 event_code에 해당하는 레코드하나를 EventBoardDto객체 하나를 반환한다.
	 */
	public EventBoardDto boardRead(int event_code);

	/**
	 * @name : boardDelete
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : event_board테이블에서 event_code에 해당하는 레코드를 삭제한다.
	 */
	public int boardDelete(int event_code);

	/**
	 * @name : boardUpdate
	 * @date : 2015. 6. 24.
	 * @author : JeongSuhyun
	 * @description : 파일이 존재할때와 존재하지 않을 때를 구분하여 데이터들을 event_board테이블에 업데이트 한다.
	 */
	public int boardUpdate(EventBoardDto eventBoard);
}
