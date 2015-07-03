package com.java.date.placeBoard.dao;

import java.util.List;

import com.java.date.placeBoard.dto.PlaceBoardDto;
import com.java.date.reviewBoard.dto.ReviewBoardDto;

public interface PlaceBoardDao {
	public List<PlaceBoardDto> placeBoardList(String place_location);
	public PlaceBoardDto reviewBoard(int place_code);
}
