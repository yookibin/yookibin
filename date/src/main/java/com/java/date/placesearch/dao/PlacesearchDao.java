package com.java.date.placesearch.dao;

import java.util.List;
import java.util.Map;

import com.java.date.placesearch.dto.PlacesearchDto;
import com.java.date.reviewBoared.dto.reviewBoardDto;



public interface PlacesearchDao {

	public List<PlacesearchDto> gutheam(String area, String park);

	public PlacesearchDto finalthema(String area,String listcode);
	
	public int replyInsert(reviewBoardDto replyDto);
	
}
