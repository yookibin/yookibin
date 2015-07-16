package com.java.date.recommandPlace.dao;

import java.util.List;

import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.recommandPlace.dto.SaveCourseDto;

public interface RecommandPlaceDao {


	public List<PlaceDto> getPlaceDtoList(PlaceDto dto);
	public List<PlaceDto> getPlaceDtoList();

	public int getPrice(String name);

	public PlaceDto getInfo(String code);

	public List<PlaceDto> placeList(PlaceDto dto);

	public List<PlaceDto> getPlaceDtoList(String placeCode1, String placeCode2);

	public List<Object> test12();

	public int saveCourse(String place_code1, String place_code2);

	public List<SaveCourseDto> moveMypageGetCourse(String cid);
	

}
