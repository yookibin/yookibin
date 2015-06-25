package com.java.date.placesearch.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.placesearch.dao.PlacesearchDao;
import com.java.date.placesearch.dto.PlacesearchDto;



@Component
public class PlacesearchServiceImpl implements PlacesearchService {
	@Autowired
	private PlacesearchDao placesearchDao;
	/*private PlacesearchDto placesearchDto = new PlacesearchDto();*/
	
	final Logger logger=Logger.getLogger(this.getClass().getName());

	@Override
	public void choiceOk(ModelAndView mav) {
		Map<String,Object> hMap = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)hMap.get("request");
		
		String area=request.getParameter("area");
		logger.info("area:"+area);
		
		 //List<PlacesearchDto> placesearchList=placesearchDao.select(area);
		mav.addObject("area",area);
		mav.setViewName("placesearch/choiceOk");
	}

	@Override
	public void parkthema(ModelAndView mav) {
		Map<String,Object> hMap =mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)hMap.get("request");
		
		String park=request.getParameter("park");
		String area=request.getParameter("area");
		
		logger.info("area:"+area);
		logger.info("park:"+park);
		
		List <PlacesearchDto> parkthema=placesearchDao.gutheam(area,park);
		logger.info("gg"+parkthema.size());
		
		mav.addObject("area",area);
		mav.addObject("park",park);		
		mav.addObject("parkthema",parkthema);
		
		mav.setViewName("placesearch/parkthema");
		
	}


}
