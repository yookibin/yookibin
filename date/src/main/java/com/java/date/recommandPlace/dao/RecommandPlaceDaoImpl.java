package com.java.date.recommandPlace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.recommandPlace.dto.SaveCourseDto;

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
	public List<PlaceDto> getPlaceDtoList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("dao.recommandPlaceMapper.getPlaceList");
	}

	@Override
	public int getPrice(String name) {
		// TODO Auto-generated method stub
		System.out.println(name);
		return sqlSession.selectOne("dao.recommandPlaceMapper.getPrice", name);
	}
	
	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 장소코드로 장소DTO를 가져옴.
	 */
	@Override
	public PlaceDto getInfo(String code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.recommandPlaceMapper.getInfo", code);
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 사용자선택에 의한 장소들을 가져온다.
	 */
	@Override
	public List<PlaceDto> placeList(PlaceDto dto) {
		// TODO Auto-generated method stub
		System.out.println("디에오");
		System.out.println("showmethemony");
		System.out.println(dto.getPlace_gu());
		System.out.println(dto.getPlace_season());
		System.out.println(dto.getPlace_weather());
		System.out.println(dto.getPlace_time());
		System.out.println(dto.getPlace_balance());
		System.out.println("출력되어라");
		List<PlaceDto> list = sqlSession.selectList("dao.recommandPlaceMapper.selectList22", dto);
		for(int i=0;i<list.size();i++){
			float a = list.get(i).getPlace_star();
			System.out.println(a);
		}
		return list;
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 선택한 코스에 대한 정보를 제공.
	 */
	@Override
	public List<PlaceDto> getPlaceDtoList(String placeCode1, String placeCode2) {
		// TODO Auto-generated method stub
		Map<String, String> hMap = new HashMap<String, String>();
		hMap.put("placeCode1", placeCode1);
		hMap.put("placeCode2", placeCode2);
		List<String> placeCode = new ArrayList<String>();
		placeCode.add(placeCode1);
		placeCode.add(placeCode2);
		System.out.println(placeCode1);
		System.out.println(placeCode2);
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

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 7. 10.
	 * @author : 종현
	 * @description : 사용자가 선택한 코스를 저장하는 함수.
	 */
	@Override
	public int saveCourse(String place_code1, String place_code2, String id) {
		System.out.println("here DAO");
		System.out.println(place_code1);
		System.out.println(place_code2);
		String cid = id;
		String recom = "recom";
		Map<String, String> hMap = new HashMap<String, String>();
		hMap.put("cid", cid);
		hMap.put("recom", recom);
		hMap.put("place_code1", place_code1);
		hMap.put("place_code2", place_code2);
		return sqlSession.insert("dao.recommandPlaceMapper.saveCourse", hMap);
	}

	@Override
	public List<SaveCourseDto> moveMypageGetCourse(String cid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("dao.recommandPlaceMapper.getMyCourseList", cid);
	}
	@Override
	public int insertMap(PlaceDto dto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("dao.recommandPlaceMapper.insertMap", dto);
	}
}
