package com.java.date.placesearch.dao;

import java.util.List;

import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.reviewBoared.dto.reviewBoardDto;



public interface PlacesearchDao {

	public List<PlaceDto> gutheam(String area, String park);

	public PlaceDto finalthema(String area,String listcode);
	
	public int replyInsert(reviewBoardDto replyDto);
	
}
