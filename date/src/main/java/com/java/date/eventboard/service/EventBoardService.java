package com.java.date.eventboard.service;

import org.springframework.web.servlet.ModelAndView;

public interface EventBoardService {
	/**
	 * @name : eventWrite
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_code와 pageNumber의 값을 설정하여 jsp페이지로 이동한다.
	 */
	public void eventWrite(ModelAndView mav);
	
	/**
	 * @name : eventWriteOk
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : 넘겨받은 데이터를 가지고 DB에 insert후 jsp페이지로 이동한다.
	 */
	public void eventWriteOk(ModelAndView mav);
	
	/**
	 * @name : eventList
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : DB로부터 EventBoardDto들을 List형태로 가져와 jsp페이지로 이동한다.
	 */
	public void eventList(ModelAndView mav);
	
	/**
	 * @name : eventRead
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_code에 해당하는 EventBoardDto데이터를 DB로부터 가져와 jsp페이지로 이동한다.
	 */
	public void eventRead(ModelAndView mav);
	
	/**
	 * @name : eventDelete
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : event_code와 pageNumber를 가지고 jsp페이지로 이동한다.
	 */
	public void eventDelete(ModelAndView mav);
	
	/**
	 * @name : eventDeleteOk
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : event_code에 해당하는 파일을 서버와 DB에서 삭제 후 jsp페이지로 이동한다. 
	 */
	public void eventDeleteOk(ModelAndView mav);

	/**
	 * @name : eventUpdate
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : event_code에 해당하는 EventBoardDto를 DB로부터 가져와 jsp페이지로 이동한다.
	 */
	public void eventUpdate(ModelAndView mav);

	/**
	 * @name : eventUpdateOk
	 * @date : 2015. 6. 24.
	 * @author : JeongSuhyun
	 * @description : update.jsp로부터 새로 입력받은 데이터들을 가져와 DB를 업데이트한 후 jsp페이지로 이동한다.
	 */
	public void eventUpdateOk(ModelAndView mav);

	/**
	 * @name : eventJoin
	 * @date : 2015. 6. 25.
	 * @author : JeongSuhyun
	 * @description : 현재 세션에 등록되어있는 id회원의 포인트를 DB로부터 가져와서 jsp페이지로 이동한다.
	 */
	public void eventJoin(ModelAndView mav);
	
}
