package com.java.date.randomPlace.dao;

import java.util.HashMap;
import java.util.List;

import com.java.date.randomPlace.dto.RandomQuestionDto;
import com.java.date.recommandPlace.dto.PlaceDto;

public interface RandomPlaceDao {
	public int aquestionCount();
	
	public RandomQuestionDto randomPlaceStart(String num);
	
	public String next_Question(String next_Question);
	
	public List<PlaceDto> randomPlace(HashMap<String, String> hMap);
}
