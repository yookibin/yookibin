package com.java.date.recommandPlace.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.java.date.recommandPlace.dto.PlaceDto;

public interface RecommandPlaceService {

	public void placeCourseList(ModelAndView mav);

	public void selectMap(ModelAndView mav);
	public void selectMap0(ModelAndView mav);

	public void selectMap2(ModelAndView mav);

	public void selectMap3(ModelAndView mav);

	public void daumMap(ModelAndView mav);

	public PlaceDto getInfo(String code);

	public List<PlaceDto> placeList(PlaceDto dto);

	public void selectCourse(ModelAndView mav);

	public List<Object> test12();

	public int saveCourse(String place_code1, String place_code2);

	public void moveMypage(ModelAndView mav);

	public void findPlace(ModelAndView mav);
}
