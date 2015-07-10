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
		
		placeBoardService.placeList(mav);
		 
		
		return mav;
	}	
	
	/**
	 * @name : reviewBoard
	 * @date : 2015. 6. 29.
	 * @author : 정희준
	 * @description : '평가하기' 하이퍼링크를 클릭시 리뷰게시판으로 이동함
	 */
	
	@RequestMapping(value="placeBoard/reviewBoard.do")
	public ModelAndView reviewBoard(HttpServletRequest request,HttpServletResponse reponse){
		
		logger.info("---------------------reviewBoard Ok");
		
		ModelAndView mav=new ModelAndView();
	
		mav.addObject("request",request);
		
		placeBoardService.reviewBoard(mav);
		
		return mav;
	}
}