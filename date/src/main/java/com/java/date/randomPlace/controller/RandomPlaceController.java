package com.java.date.randomPlace.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.randomPlace.service.RandomPlaceService;
import com.java.date.recommandPlace.dto.PlaceDto;

/**
 * @name : RandomPlaceController
 * @date : 2015. 7. 7.
 * @author : 이진호
 * @description : 렌덤장소추천의 컨트롤러
 */
@Controller
public class RandomPlaceController {

	private final Logger logger = Logger.getLogger(this.getClass().getName());

	@Autowired
	private RandomPlaceService randomPlaceService;

	/**
	 * @name : randomPlaceStart
	 * @date : 2015. 7. 7.
	 * @author : 이진호
	 * @description : 랜덤장소추천의 시작부분이며 맨처음 질문의 총갯수를 가져가고 시작하는 ajax로 넘어간다
	 */
	@RequestMapping(value = "randomplace/randomPlaceStart.do")
	public ModelAndView randomPlaceStart(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("randomPlace //");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		randomPlaceService.aquestionCount(mav);

		return mav;
	}

	/**
	 * @name : randomPlace
	 * @date : 2015. 7. 7.
	 * @author : 이진호
	 * @description : 랜덤장소추천에서 질문에 답을 할때에 다음질문에 관한데이터를 가져올때 사용되는 컨트롤러
	 */
	@RequestMapping(value = "randomplace/randomPlace.do")
	@ResponseBody
	public List<Object> randomPlace(String number) {
		logger.info("randomPlace //");
		return randomPlaceService.rendomPlace(number);
	}

	/**
	 * @name : randomPlaceEnd
	 * @date : 2015. 7. 7.
	 * @author : 이진호
	 * @description : 랜덤장소추천에서 모든질문에 답을 받고 그데이터를 가지고 알맞은 데이터를 꺼내올때 사용되는 컨트롤러
	 */
	@RequestMapping(value = "/randomplace/randomPlaceEnd.do")
	@ResponseBody
	public List<PlaceDto> randomPlaceEnd(String place, String weather,
			String time) {
		logger.info("randomPlaceEnd //");
		logger.info(place + "," + weather + "," + time);
		return randomPlaceService.randomPlaceEnd(place, weather, time);
	}
}
