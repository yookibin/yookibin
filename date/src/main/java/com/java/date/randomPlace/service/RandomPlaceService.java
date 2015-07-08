package com.java.date.randomPlace.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.java.date.recommandPlace.dto.PlaceDto;

public interface RandomPlaceService {
	public void aquestionCount(ModelAndView mav);
	
	public List<Object> rendomPlace(String number);
	
	public List<PlaceDto> randomPlaceEnd(String place,String weather,String time);

}
