package com.java.date.placeBoard.service;

import org.springframework.web.servlet.ModelAndView;

public interface PlaceBoardService {
	public void boardList(ModelAndView mav);
	public void placeBoardSearch(ModelAndView mav);
	public void reviewBoard(ModelAndView mav);
}
