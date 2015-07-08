package com.java.date.placeBoard.dao;

import java.util.List;

import com.java.date.placeBoard.dto.PlaceBoardDto;

public interface PlaceBoardDao {
	public List<PlaceBoardDto> placeBoardList(String place_location);
	public PlaceBoardDto reviewBoard(String place_code);
}
