package com.java.date.placeBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component; 

import com.java.date.recommandPlace.dto.PlaceDto;

@Component
public class PlaceBoardDaoImpl implements PlaceBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * @name : placeBoardList
	 * @date : 2015. 6. 23.
	 * @author : 정희준 
	 * @description : place_gu <강남>에 해당하는 레코드를 뽑기 위해 mapper클래스로 보내주는 함수
	 */
	
	@Override
	public List<PlaceDto> placeBoardList(String place_gu){
		System.out.println("dao String : " + place_gu);
		return sqlSession.selectList("dao.placeBoardMapper.placeBoardList",place_gu);
	}


	/**
	 * @name : getGuCount 
	 * @date : 2015. 6. 25.
	 * @author : 정희준
	 * @description : 게시판테이블에 작성된 '**구'에 해당하는 레코드들의 수를 가져오기 위한 함수.
	 */
	
	
	
	@Override
	public int getGuCount(String place_gu) {
		return sqlSession.selectOne("dao.placeBoardMapper.getGuCount",place_gu);
	}

	/**
	 * @name : placeList
	 * @date : 2015. 6. 25.
	 * @author : 정희준
	 * @description : 최초 게시판 접속시 글 목록을 뿌려주기 위해 지정해준 범위내의 레코드를 가져오기 위한 함수
	 */
	
	@Override
	public List<PlaceDto> placeList(int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.placeBoardMapper.firstList", hMap);
	}
	
	/**
	 * @name : getPlaceList
	 * @date : 2015. 6. 25.
	 * @author : 정희준
	 * @description : 게시판에 글 목록을 뿌려주기 위해 지정해준 범위내의 레코드를 가져오기 위한 함수
	 */
	
	@Override
	public List<PlaceDto> getPlaceList(int startRow, int endRow, String place_gu,String place_thema,String place_balance) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("place_gu", place_gu);
		hMap.put("place_thema", place_thema);
		hMap.put("place_balance", place_balance);
		return sqlSession.selectList("dao.placeBoardMapper.placeList", hMap);
	}

	/**
	 * @name : reviewBoard
	 * @date : 2015. 6. 27.
	 * @author : 정희준
	 * @description : 특정 place_code를 갖고있는 review_Board의 레코드를 뽑기 위해 mapper클래스로 보내주는 함수 
	 */

	@Override
	public PlaceDto reviewBoard(String place_code) {
		System.out.println("dao int : " + place_code);
		return sqlSession.selectOne("dao.placeBoardMapper.reviewBoard",place_code);
	}

	@Override
	public int starUpdate(float place_star,String place_code) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("place_star", place_star);
		hMap.put("place_code", place_code);
		return sqlSession.update("dao.placeBoardMapper.starUpdate",hMap);
	}
}
