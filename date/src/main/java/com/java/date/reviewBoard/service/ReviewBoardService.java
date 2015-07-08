package com.java.date.reviewBoard.service;

import java.util.List;

import com.java.date.reviewBoard.dto.ReviewBoardDto;

public interface ReviewBoardService {

	public List<ReviewBoardDto> replyWrite(int star, String place_code,String nickName, String writeReply);
	public int replyDelete(int review_code);
	public ReviewBoardDto replyUpdate(int review_code);
}
