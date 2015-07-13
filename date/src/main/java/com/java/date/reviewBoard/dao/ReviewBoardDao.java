package com.java.date.reviewBoard.dao;

import java.util.List;

import com.java.date.reviewBoard.dto.ReviewBoardDto;

public interface ReviewBoardDao {
	public List<ReviewBoardDto> reviewSelect(String place_code);

	public int replyWrite(int star, String place_code,String nickName, String writeReply); 
	
	public int replyDelete(int review_code); 
	
	public int replyUpdate(int review_code, String review_content);
	
	public int selectStar(String place_code);
	
	public int reviewStar(String place_code);
	
	public int reviewStarCheck(String place_code); 
	
}
