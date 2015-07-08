package com.java.date.randomPlace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.randomPlace.dto.RandomQuestionDto;
import com.java.date.recommandPlace.dto.PlaceDto;

/**
 *@name : RandomPlaceDaoImpl
 *@date : 2015. 7. 7.
 *@author : 이진호
 *@description : 랜덤장소추천의 Dao부분
 */
@Component
public class RandomPlaceDaoImpl implements RandomPlaceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 *@name : aquestionCount
	 *@date : 2015. 7. 7.
	 *@author : 이진호
	 *@description : 첫번째 질문의 갯수를 꺼내오는 함수
	 */
	@Override
	public int aquestionCount() {
		
		return sqlSession.selectOne("dao.randomPlaceMapper.aquestionCount");
	}
	
	/**
	 *@name : randomPlaceStart
	 *@date : 2015. 7. 7.
	 *@author : 이진호
	 *@description : 질문번호를 받아 질문을 꺼내오는 함수
	 */
	@Override
	public RandomQuestionDto randomPlaceStart(String num) {
		
		return sqlSession.selectOne("dao.randomPlaceMapper.randomPlaceStart", num);
	}
	
	/**
	 *@name : next_Question
	 *@date : 2015. 7. 7.
	 *@author : 이진호
	 *@description : 다음질문의 총갯수를 꺼내오는 함수
	 */
	@Override
	public String next_Question(String next_Question) {

		return sqlSession.selectOne("dao.randomPlaceMapper.next_QuestionCount", next_Question);
	}
	
	/**
	 *@name : randomPlace
	 *@date : 2015. 7. 7.
	 *@author : 이진호
	 *@description : 랜덤장소추천의 모든데이터를 받아 랜덤한 데이터를 데이터베이스에서 꺼내오는 기능
	 */
	@Override
	public List<PlaceDto> randomPlace(HashMap<String, String> hMap) {
		List<PlaceDto> list=new ArrayList<PlaceDto>();
		List<PlaceDto> placeList=sqlSession.selectList("dao.randomPlaceMapper.randomPlaceResult", hMap);
		int fristPlace=(int)(Math.random()*placeList.size());
		int secondPlace=(int)(Math.random()*placeList.size());
		while(fristPlace==secondPlace){
			secondPlace=(int)(Math.random()*placeList.size());
		}
		list.add(placeList.get(fristPlace));
		list.add(placeList.get(secondPlace));
		return list;
	}

}
