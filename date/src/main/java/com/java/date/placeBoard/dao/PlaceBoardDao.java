package com.java.date.placeBoard.dao;

import java.util.List;

import com.java.date.recommandPlace.dto.PlaceDto;

public interface PlaceBoardDao {
	public List<PlaceDto> placeBoardList(String place_location);
	public int getBoardCount(String place_location);
	public List<PlaceDto> getPlaceList(int startRow, int endRow, String place_location);
	public PlaceDto reviewBoard(String place_code);
	public int starUpdate(float place_star,String place_code);
}
