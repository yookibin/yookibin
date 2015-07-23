package com.java.date.placesearch.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.reviewBoared.dto.reviewBoardDto;

@Component
public class PlacesearchDaoImpl implements PlacesearchDao {
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public List<PlaceDto> gutheam(String area, String thema) {
      HashMap<String,Object> hMap=new HashMap<String,Object>();
      //System.out.println("areass:"+area+park);
      hMap.put("area", area);
      hMap.put("thema", thema);
      
      return sqlSession.selectList("dao.placesearchMapper.selectThema",hMap);
   }
   
   @Override
   public PlaceDto finalthema(String area, String listcode) {
      HashMap<String,Object> hMap= new HashMap<String,Object>();
      
      hMap.put("area", area);
      hMap.put("listcode", listcode);
      
      
      return sqlSession.selectOne("dao.placesearchMapper.finalthema",hMap);
   }
   @Override
   public int replyInsert(reviewBoardDto replyDto) {

      return 0;
   }
   
   public int placesearchSave(HashMap<String, Object> hMap) {
      return sqlSession.insert("dao.placesearchMapper.placesearchSave",hMap);
   }
   
}