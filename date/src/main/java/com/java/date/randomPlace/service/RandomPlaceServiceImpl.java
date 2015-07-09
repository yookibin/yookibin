package com.java.date.randomPlace.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.java.date.randomPlace.dao.RandomPlaceDao;
import com.java.date.randomPlace.dto.RandomQuestionDto;
import com.java.date.recommandPlace.dto.PlaceDto;



/**
 *@name : RandomPlaceServiceImpl
 *@date : 2015. 7. 7.
 *@author : 이진호
 *@description : 랜덤추천코스의 서비
 */
@Component
public class RandomPlaceServiceImpl implements RandomPlaceService {
	
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private RandomPlaceDao randomPlaceDao;
	
	/**
	 *@name : aquestionCount
	 *@date : 2015. 7. 7.
	 *@author : 이진호
	 *@description : 랜덤장소추천기능이 시작할때에 첫번째 질문의 총갯수를 뽑아오는 함
	 */
	@Override
	public void aquestionCount(ModelAndView mav) {
		logger.info("aquestion Service//");
		
		int aquestionCount=randomPlaceDao.aquestionCount();
	//	int aquestionCount=2;S
		logger.info("question:"+aquestionCount);
		
		mav.addObject("aquestion", aquestionCount);
		mav.setViewName("randomplace/randomPlace");
	}

	/**
	 *@name : rendomPlace
	 *@date : 2015. 7. 7.
	 *@author : 이진호
	 *@description : 랜덤장소추천기능에서 다음질문에 관련된 데이터를 list에 담아주는 기능
	 */
	@Override
	public List<Object> rendomPlace(String number) {
		logger.info("number:"+number);
		RandomQuestionDto question = randomPlaceDao.randomPlaceStart(number);
		logger.info("next_question:"+question.getNext_Question());
		logger.info("question:"+question.getQuestion());
		String nextQuestion=randomPlaceDao.next_Question(question.getNext_Question());
		
		System.out.println(question);
		List<Object> list=new ArrayList<Object>();
		list.add(question);
		list.add(nextQuestion);
		
		return list;
	}

	/**
	 *@name : randomPlaceEnd
	 *@date : 2015. 7. 7.
	 *@author : 이진호
	 *@description : 랜덤장소추천기능 마지막 부분으로 지금까지 받았던 데이터들을 가공해서 데이터를 관리하는 부분
	 */
	
	@Override
	public List<PlaceDto> randomPlaceEnd(String place, String weather, String time) {
		logger.info("randomPlaceEnd //");
		
		String[] rePlace=place.split(",");
		logger.info("rePlace:"+rePlace.length);
		String endPlace=rePlace[(int)(Math.random()*rePlace.length)];
		
		String[] reWeather=weather.split(",");
		logger.info("reWeather:"+reWeather.length);
		String endWeather=reWeather[(int)(Math.random()*reWeather.length)];
		
		String[] reTime=time.split(",");
		logger.info("reTime:"+reTime.length);
		String endTime=reTime[(int)(Math.random()*reTime.length)];
		
		logger.info(endPlace+","+endWeather+","+endTime);
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		
		hMap.put("endPlace",endPlace);
		hMap.put("endWeather",endWeather);
		hMap.put("endTime",Integer.parseInt(endTime));
		
		return randomPlaceDao.randomPlace(hMap);
	}
}
