package com.java.date.reviewBoard.service;

import org.springframework.web.servlet.ModelAndView;

public interface ReviewBoardService {

	public int replyWrite(int star, String place_code,String nickName, String writeReply,String id);
	public int replyDelete(int review_code);
	public int replyUpdate(int review_code, String review_content);
	public void myReviwBoard(ModelAndView mav);
}
