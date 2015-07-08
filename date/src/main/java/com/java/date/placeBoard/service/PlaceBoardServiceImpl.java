package com.java.date.placeBoard.service;

import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.placeBoard.dao.PlaceBoardDao;
import com.java.date.placeBoard.dto.PlaceBoardDto;
import com.java.date.reviewBoard.dto.ReviewBoardDto;
 
@Component
public class PlaceBoardServiceImpl implements PlaceBoardService {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private PlaceBoardDao placeBoardDao;

	
	/**
	 * @name : boardList
	 * @date : 2015. 6. 23.
	 * @author : 정희준
	 * @description : controller에서 plce_location 넘어온 값이 없다면 디폴트값을 gangNam으로 설정해주는 함수 
	 *                페이지넘버 설정 함수
	 */
	
	@Override
	public void boardList(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
/*		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		logger.info("boardList startRow: "+startRow+", endRow: "+endRow);
		
		int count=placeBoardDao.getBoardCount();
		logger.info("boardList count: "+count);
		
		List<PlaceBoardDto> boardList=null;
		if(count>0){
			boardList=PlaceBoardDao.getBoardList(startRow, endRow);
		}
		logger.info("boardList size: "+boardList.size());
		*/ 
		
		
		String place_location="";
		logger.info(request.getParameter("place_location"));
		
		//place_location이 null값이라면 place_location=gangName으로 설정
		
		if(request.getParameter("place_location")==null){
			place_location="강남";
		}else{
			place_location=request.getParameter("place_location");
		}
		
		//place_laction이 gangNam에 해당하는 레코드를 뽑아 List로 담아 준다.
		List<PlaceBoardDto> placeBoardList = placeBoardDao.placeBoardList(place_location);
		logger.info("placeBoardList="+placeBoardList.size());
		
		mav.addObject("placeBoardList",placeBoardList);
		mav.setViewName("placeBoard/list");
	}

	/**
	 * @name : placeBoardSearch
	 * @date : 2015. 6. 25.
	 * @author : 정희준
	 * @description : 장소검색을 눌렀을시 해당 장소을 갖고와 장소에 해당하는 레코드를 가지고 오는 함수
	 */
	
	@Override
	public void placeBoardSearch(ModelAndView mav) {
		String selectPlace="";
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String location=request.getParameter("location");
		//logger.info(location);
		
		StringTokenizer token=new StringTokenizer(location, ",");
		
		 while(token.hasMoreTokens()) {
			selectPlace=token.nextToken();
			System.out.println(selectPlace);
		 }
		 
		 List<PlaceBoardDto> placeBoardList=placeBoardDao.placeBoardList(selectPlace);
		 logger.info("placeBoardList : " + placeBoardList.size());
		 
		 mav.addObject("placeBoardList",placeBoardList);
		 mav.setViewName("placeBoard/list");
	}
	
	/**
	 * @name : reviewBoard
	 * @date : 2015. 6. 29.
	 * @author : 정희준
	 * @description : 
	 */
	
	@Override
	public void reviewBoard(ModelAndView mav) {
		Map<String, Object>map=mav.getModel();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int place_code=Integer.parseInt(request.getParameter("place_code"));
		
		PlaceBoardDto placeBoard=placeBoardDao.reviewBoard(place_code);

		logger.info("placeBoard"+placeBoard);
		mav.addObject("placeBoard",placeBoard);
		
		mav.setViewName("reviewBoard/list");
	}
}
