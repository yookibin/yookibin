package com.java.date.reviewBoard.controller;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.date.reviewBoard.service.ReviewBoardService;

@Controller
public class ReviewBoardController {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ReviewBoardService reviewBoardService;
	
	/**
	 * @name : replyWrite
	 * @date : 2015. 7. 3.
	 * @author : 정희준
	 * @description : 평가하기를 눌렀을때, AJAX를 통해 각 멤버변수들이 들어와 해당 변수들을 reviewBoardService로 리턴해주는 함수
	 */
	
	@RequestMapping("/reviewBoard/insertReview.do")
	@ResponseBody
	public int replyWrite(int star, String place_code, String nickName, String writeReply,String id){
		logger.info("-------------------replyWrite");
		return reviewBoardService.replyWrite(star,place_code,nickName,writeReply,id);
	}
	
	/**
	 * @name : replyDelete
	 * @date :  2015. 7. 5.
	 * @author : 정희준
	 * @description : 삭제버튼을 눌렀을 시 AJAX를 통해 각 멤버변수들이 들어와 해당 변수들을 reviewBoardService로 리턴해주는 함수
	 */
	
	
	@RequestMapping("/reviewBoard/deleteReview.do")
	@ResponseBody
	public int replyDelete(int review_code){
		logger.info("-------------------replyDelete");
		return reviewBoardService.replyDelete(review_code);
	}
	
	
	/**
	 * @name : replyUpdate
	 * @date :  2015. 7. 8.
	 * @author : 정희준
	 * @description : 수정버튼을 눌렀을 시 AJAX를 통해 각 멤버변수들이 들어와 해당 변수들을 reviewBoardService로 리턴해주는 함수
	 */
	
	@RequestMapping("/reviewBoard/updateReview.do")
	@ResponseBody
	public int replyUpdate(int review_code, String review_content){
		logger.info("-------------------replyUpdate");
		System.out.println("컨트롤러");
		System.out.println(review_code);
		System.out.println(review_content);
		
		return reviewBoardService.replyUpdate(review_code, review_content);
	}
}
