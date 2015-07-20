package com.java.date.recommandPlace.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.recommandPlace.service.RecommandPlaceService;

@Controller
public class RecommandPlaceController {
	Logger logger = Logger.getLogger(this.getClass().getName());
	@Autowired
	private RecommandPlaceService service;
	
	
	@RequestMapping("/recommandPlace/helpMap.do")
	public String helpMap(){
		
		return "recommandPlace/helpMapCordi";
	}
	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 코스추천페이지로 이동한다.
	 */
	@RequestMapping("/recommandPlace/findPlace.do")
	public ModelAndView findPlace(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("findPlace ㅋㅋ");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		service.findPlace(mav);
		return mav;
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 장소코드로 장소DTO를 가져옴.
	 */
	@RequestMapping("/recommandPlace/getInfo.do")
	@ResponseBody
	public PlaceDto getInfo(String code) {
		return service.getInfo(code);
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 사용자선택에 의한 장소들을 가져온다.
	 */
	@RequestMapping("/recommandPlace/select2.do")
	@ResponseBody
	public List<PlaceDto> select2(String place_gu, String place_season,
			String place_weather, String place_time, String place_balance) {
		logger.info("이것이 실행되어야함?");
		System.out.println(place_gu);
		System.out.println(place_season);
		System.out.println(place_weather);
		System.out.println(place_time);
		System.out.println(place_balance);
		PlaceDto dto = new PlaceDto();
		dto.setPlace_gu(place_gu);
		dto.setPlace_season(place_season);
		dto.setPlace_weather(place_weather);
		dto.setPlace_time(place_time);
		dto.setPlace_balance(place_balance);
		return service.placeList(dto);
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 선택한 코스에 대한 정보를 제공.
	 */
	@RequestMapping(value = "/recommandPlace/selectCourse.do", method = RequestMethod.POST)
	public ModelAndView selectCourse(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("selectCourse ㅋㅋ");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		service.selectCourse(mav);
		return mav;
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 7. 10.
	 * @author : 종현
	 * @description : 사용자가 선택한 코스를 저장하는 함수.
	 */
	@RequestMapping("/recommandPlace/saveCourse.do")
	@ResponseBody
	public int saveCourse(String place_code1, String place_code2, String id) {
		System.out.println("지금은 여기로 오는게 맞는가???");
		System.out.println(place_code1);
		System.out.println(place_code2);
		System.out.println("id" + id);
		return service.saveCourse(place_code1, place_code2, id);
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 7. 12.
	 * @author : 종현
	 * @description : 마이페이지의 내 저장된 코스보기로 이동.
	 */
	@RequestMapping(value = "/recommandPlace/moveMypage.do", method = RequestMethod.GET)
	public ModelAndView moveMypage(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("moveMypage ㅋㅋ");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		service.moveMypage(mav);
		return mav;
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 7. 12.
	 * @author : 종현
	 * @description : 운영자가 장소추가(placeDto를 Multi형식으로 넘김)
	 */
	@RequestMapping(value="/recommandPlace/insertMap.do", method=RequestMethod.POST)
	public ModelAndView insertMap(MultipartHttpServletRequest request) {
		logger.info("insertMap insertMap----------");
		System.out.println("이zz동합zz니z다.");

		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		service.insertMap(mav);

		return mav;
	}
	@RequestMapping(value="/recommandPlace/insertM.do")
	public String insertM(){
		System.out.println("이동합니다.");
		return "recommandPlace/insertMap";
	}

	/*--------------------아래함수들은 테스트 함수들입니다.----------------------------------------------------*/

	@RequestMapping("/recommandPlace/map.do")
	public String map() {
		logger.info("map");
		return "recommandPlace/map";
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 사용자선택에 의한 장소들을 가져온다 근데 에이젝스가 아니다 이건 지워야할듯?.
	 */
	@RequestMapping(value = "/recommandPlace/select.do", method = RequestMethod.POST)
	public ModelAndView placeCourseList(HttpServletRequest request,
			HttpServletResponse response, PlaceDto placeDto) {
		logger.info("select중");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("placeDto", placeDto);
		service.placeCourseList(mav);
		return mav;
	}

	@RequestMapping(value = "/recommandPlace/selectMap.do", method = RequestMethod.GET)
	public ModelAndView selectMap(HttpServletRequest request) {
		logger.info("selectMap");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		service.selectMap(mav);
		return mav;
	}

	@RequestMapping(value = "/recommandPlace/selectMap0.do", method = RequestMethod.GET)
	public ModelAndView selectMap0(HttpServletRequest request) {
		logger.info("selectMap");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		service.selectMap0(mav);
		return mav;
	}

	@RequestMapping(value = "/recommandPlace/selectMap2.do", method = RequestMethod.GET)
	public ModelAndView selectMap2(HttpServletRequest request) {
		logger.info("selectMap");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		service.selectMap2(mav);
		return mav;
	}

	@RequestMapping(value = "/recommandPlace/selectMap3.do", method = RequestMethod.GET)
	public ModelAndView selectMap3(HttpServletRequest request) {
		logger.info("selectMap");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		service.selectMap3(mav);
		return mav;
	}

	@RequestMapping(value = "/recommandPlace/daumMap.do", method = RequestMethod.POST)
	public ModelAndView daumMap(HttpServletRequest request,
			HttpServletResponse response, PlaceDto placeDto) {
		logger.info("daumMap");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("placeDto", placeDto);
		service.daumMap(mav);
		return mav;
	}

	/*
	 * @RequestMapping(value = "/recommandPlace/selectMap.do", method =
	 * RequestMethod.POST) public ModelAndView selectMap(HttpServletRequest
	 * request, HttpServletResponse response) { logger.info("selectMap");
	 * ModelAndView mav = new ModelAndView(); mav.addObject("request", request);
	 * service.selectMap(mav); return mav; }
	 */
	/*
	 * @RequestMapping(value="/recommandPlace/??.do", method=RequestMethod.POST)
	 * public ModelAndView placeList(HttpServletRequest request,
	 * HttpServletResponse response){ ModelAndView mav = new ModelAndView();
	 * mav.addObject("request", request); service.placeCourseList(mav);
	 * 
	 * return mav; }
	 */
}
