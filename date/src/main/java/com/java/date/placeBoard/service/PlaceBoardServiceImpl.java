package com.java.date.placeBoard.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.placeBoard.dao.PlaceBoardDao;
import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.reviewBoard.dao.ReviewBoardDao;
import com.java.date.reviewBoard.dto.ReviewBoardDto;
 
@Component
public class PlaceBoardServiceImpl implements PlaceBoardService {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private PlaceBoardDao placeBoardDao;
	
	@Autowired
	private ReviewBoardDao reviewBoardDao;

	
	/**
	 * @name : placeList
	 * @date : 2015. 6. 23.
	 * @author : 정희준
	 * @description : controller에서 plce_location 넘어온 값이 없다면 디폴트값을 gangNam으로 설정해주는 함수
	 *                페이지넘버 설정 함수
	 */
	
	@Override
	public void placeList(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String place_location="";
		if(request.getParameter("place_location")==null){
			place_location="강남";
		}else{
			place_location=request.getParameter("place_location");
		}
		logger.info("place_location:"+place_location);
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=12;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		logger.info("boardList startRow: "+startRow+", endRow: "+endRow);
		
		int count=placeBoardDao.getBoardCount(place_location);
		logger.info("boardList count: "+count);
		
		List<PlaceDto> boardList=null;
		if(count>0){
			boardList=placeBoardDao.getPlaceList(startRow, endRow, place_location);
		}
		logger.info("boardList size: "+boardList.size());
		
		//place_laction이 강남에 해당하는 레코드를 뽑아 List로 담아 준다.
		
		logger.info("boardSize"+boardSize);
		logger.info("currentPage"+currentPage);
		logger.info("count"+count);

		mav.addObject("boardList",boardList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		
		mav.setViewName("placeBoard/list");
	}

	
	/**
	 * @name : reviewBoard
	 * @date : 2015. 6. 29.
	 * @author : 정희준
	 * @description : '평가하기'를 눌렀을 시 해당 place_code를 갖고있는 리뷰들을 리스트 형태로 갖고오는 함수
	 */
	
	@Override
	public void reviewBoard(ModelAndView mav) {
		Map<String, Object>map=mav.getModel();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String place_code=request.getParameter("place_code");
		
		PlaceDto placeBoard=placeBoardDao.reviewBoard(place_code); 
		List<ReviewBoardDto> reviewList=reviewBoardDao.reviewSelect(place_code);
		 
		int selectStar=reviewBoardDao.selectStar(place_code);
		logger.info("selectStar :" + selectStar);
		
		if(selectStar==1){	
			int review_star=reviewBoardDao.reviewStar(place_code);
			logger.info("star : " + review_star);
			
			int starCheck=reviewBoardDao.reviewStarCheck(place_code);
			logger.info("starCheck : " + starCheck);
			
			float place_star=review_star/starCheck/(float)10;
			logger.info("place_star :"+place_star);
			
			int check=placeBoardDao.starUpdate(place_star,place_code);
			logger.info("check :"+check);
		}
		
		logger.info("placeBoard:"+placeBoard+"reviewList:"+reviewList);
		mav.addObject("placeBoard",placeBoard);
		mav.addObject("reviewList",reviewList);
		
		mav.setViewName("reviewBoard/list");
	}


	@Override
	public void newBoardList(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
	}
}
