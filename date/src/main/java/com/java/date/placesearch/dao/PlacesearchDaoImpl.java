package com.java.date.placesearch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.placesearch.dto.PlacesearchDto;

@Component
public class PlacesearchDaoImpl implements PlacesearchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PlacesearchDto> gutheam(String area, String park) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		//System.out.println("areass:"+area+park);
		hMap.put("area", area);
		hMap.put("park", park);
		
		return sqlSession.selectList("dao.placesearchMapper.selectThema",hMap);
	}
	

}
