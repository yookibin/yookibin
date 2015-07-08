package com.java.date.reviewBoard.service;

import java.util.List;
import java.util.logging.Logger;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.reviewBoard.dao.ReviewBoardDao;
import com.java.date.reviewBoard.dto.ReviewBoardDto;

@Component
public class ReviewBoardServiceImpl implements ReviewBoardService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ReviewBoardDao reviewBoardDao;
	

	/**
	 * @name : replyWrite
	 * @date : 2015. 7. 3.
	 * @author : 정희준
	 * @description : 
	 *               
	 */
	
	@Override
	public int replyWrite(int star, String place_code, String nickName, String writeReply) {
		// TODO Auto-generated method stub
		return reviewBoardDao.replyWrite(star,place_code,nickName,writeReply);
	}
	
	/**
	 * @name : replyDelete
	 * @date : 2015. 7. 5.
	 * @author : 정희준
	 * @description : 
	 *               
	 */

	@Override
	public int replyDelete(int review_code) {
		logger.info("review_code: "+review_code);
		return reviewBoardDao.replyDelete(review_code);
	}
	
	/**
	 * @name : replyUpdate
	 * @date : 2015. 7. 8.
	 * @author : 정희준
	 * @description : 
	 *               
	 */

	@Override
	public int replyUpdate(int review_code, String review_content) {
		logger.info("review_code: " + review_code);
		return reviewBoardDao.replyUpdate(review_code, review_content);
	}
	
}
