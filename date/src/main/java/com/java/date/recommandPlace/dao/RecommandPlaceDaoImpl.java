package com.java.date.recommandPlace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.recommandPlace.dto.PlaceDto;

@Component
public class RecommandPlaceDaoImpl implements RecommandPlaceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PlaceDto> getPlaceDtoList(PlaceDto dto) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("dao.recommandPlaceMapper.getPlaceList");
	}

	@Override
	public int getPrice(String name) {
		// TODO Auto-generated method stub
		System.out.println(name);
		return sqlSession.selectOne("dao.recommandPlaceMapper.getPrice", name);
	}

	@Override
	public PlaceDto getInfo(String code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.recommandPlaceMapper.getInfo", code);
	}

	@Override
	public List<PlaceDto> placeList(PlaceDto dto) {
		// TODO Auto-generated method stub
		System.out.println("디에오");
		System.out.println(dto.getPlace_gu());
		System.out.println(dto.getPlace_season());
		System.out.println(dto.getPlace_weather());
		System.out.println(dto.getPlace_time());
		System.out.println(dto.getPlace_balance());
		System.out.println("출력되어라");
		List<PlaceDto> list = sqlSession.selectList("dao.recommandPlaceMapper.selectList22", dto);
		System.out.println("이거 하자" + list.size());
		return list;
	}

	@Override
	public List<PlaceDto> getPlaceDtoList(String placeCode1, String placeCode2) {
		// TODO Auto-generated method stub
		Map<String, String> hMap = new HashMap<String, String>();
		hMap.put("placeCode1", placeCode1);
		hMap.put("placeCode2", placeCode2);
		List<String> placeCode = new ArrayList();
		placeCode.add(placeCode1);
		placeCode.add(placeCode2);
		return sqlSession.selectList("dao.recommandPlaceMapper.userSelect",placeCode);
	}

	@Override
	public List<Object> test12() {
		String a = "p001";
		PlaceDto dto = sqlSession.selectOne("dao.recommandPlaceMapper.test12",a);
		List<Object> aa = new ArrayList();
		aa.add(a);
		aa.add(dto);
		return aa;
	}
}
