package com.java.date.placeBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.placeBoard.service.PlaceBoardService;

@Controller
public class PlaceBoardController{
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private PlaceBoardService placeBoardService;
	
	/**
	 * @name : placeBoard
	 * @date : 2015. 6. 23.
	 * @author : 정희준
	 * @description : 장소게시판 리스트로 이동
	 */
	
	@RequestMapping(value="placeBoard/boardList.do")
	public ModelAndView placeBoard(HttpServletRequest request,HttpServletResponse response){
		
		logger.info("-----------------------boardList");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		placeBoardService.boardList(mav);
		 
		
		return mav;
	}	
	
	/**
	 * @name : placeSearch
	 * @date : 2015. 6. 24.
	 * @author : 정희준
	 * @description : 메뉴에서 장소 검색을 했을 때 해당 장소를 검색 
	 */
	
	@RequestMapping(value="placeBoard/placeBoardsearch.do")
	public ModelAndView placeSearch(HttpServletRequest request,HttpServletResponse response){
		logger.info("----------------------placeBoardSearch");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		placeBoardService.placeBoardSearch(mav);
		
		return null;
	}
}