package com.java.date.placesearch.dao;

import java.util.HashMap;
import java.util.List;

import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.reviewBoared.dto.reviewBoardDto;



public interface PlacesearchDao {

   public List<PlaceDto> gutheam(String area, String thema);

   public PlaceDto finalthema(String area,String listcode);
   
   public int replyInsert(reviewBoardDto replyDto);
   
   public int placesearchSave(HashMap<String, Object> hmap);
}