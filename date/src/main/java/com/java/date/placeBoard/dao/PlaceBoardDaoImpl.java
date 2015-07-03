package com.java.date.placeBoard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.placeBoard.dto.PlaceBoardDto;
import com.java.date.reviewBoard.dto.ReviewBoardDto;

@Component
public class PlaceBoardDaoImpl implements PlaceBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * @name : placeBoardList
	 * @date : 2015. 6. 23.
	 * @author : 정희준
	 * @description : place_location <강남>에 해당하는 레코드를 뽑기 위해 mapper클래스로 보내주는 함수
	 */
	@Override
	public List<PlaceBoardDto> placeBoardList(String place_location){
		System.out.println("dao String : " + place_location);
		return sqlSession.selectList("dao.placeBoardMapper.placeBoardList",place_location);
	}

	@Override
	public PlaceBoardDto reviewBoard(int place_code) {
		System.out.println("dao int : " + place_code);
		return sqlSession.selectOne("dao.placeBoardMapper.reviewBoard",place_code);
	}
}
