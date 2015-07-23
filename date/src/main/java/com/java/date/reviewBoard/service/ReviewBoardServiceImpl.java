package com.java.date.reviewBoard.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;







import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

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
	public int replyWrite(int star, String place_code, String nickName, String writeReply,String id) {
		// TODO Auto-generated method stub
		return reviewBoardDao.replyWrite(star,place_code,nickName,writeReply,id);
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
	
	@Override
	   public void myReviwBoard(ModelAndView mav) {
	      logger.info("myReviwBoardService------------------");
	      
	      Map<String,Object> hmap=mav.getModelMap();
	      HttpServletRequest request=(HttpServletRequest)hmap.get("request");
	      
	      String id=request.getParameter("id");
	      
	      List<ReviewBoardDto> myReviwBoard= reviewBoardDao.myReviewGet(id);
	      
	      mav.addObject("myReviwBoard",myReviwBoard);
	      mav.setViewName("reviewBoard/myReviewBoard");
	   }
}
