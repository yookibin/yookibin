package com.java.date.placeBoard.dao;

import java.util.List;

import com.java.date.recommandPlace.dto.PlaceDto;

public interface PlaceBoardDao {
	public List<PlaceDto> placeBoardList(String place_gu);
	public int getGuCount(String place_gu);
	public List<PlaceDto> placeList(int startRow, int endRow);
	public List<PlaceDto> getPlaceList(int startRow, int endRow, String place_gu,String place_thema,String place_balance);
	public PlaceDto reviewBoard(String place_code);
	public int starUpdate(float place_star,String place_code);
	public int getPlaceCount(String place_gu,String place_thema,String place_balance);
}
