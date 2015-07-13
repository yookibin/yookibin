package com.java.date.mypage.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.java.date.recommandPlace.dto.LoadCourseDto;

public interface MypageService {

	public int delete(int num);

	public List<LoadCourseDto> getMyCourse(String id);

	public void pointCheck(ModelAndView mav);

	public void usingevent(ModelAndView mav);

}
