package com.java.date.mypage.dao;

import java.util.List;

import com.java.date.mypage.dto.MypageDto;
import com.java.date.recommandPlace.dto.SaveCourseDto;

public interface MypageDao {

	public int delete(int num);

	public List<SaveCourseDto> getMyCourse(String id);

	public List<MypageDto> point(String id);

	public List<MypageDto> usingevent(String id);

}
