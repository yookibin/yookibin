package com.java.date.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.mypage.dao.MypageDao;
import com.java.date.recommandPlace.dao.RecommandPlaceDao;
import com.java.date.recommandPlace.dto.LoadCourseDto;
import com.java.date.recommandPlace.dto.SaveCourseDto;

@Component
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDao dao;
	@Autowired
	private RecommandPlaceDao placeDao;
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Override
	public int delete(int num) {
		// TODO Auto-generated method stub
		return dao.delete(num);
	}

	/**
	 *@name : RandomPlaceController
	 *@date : 2015. 7. 12.
	 *@author : 박종현
	 *@description : 나의코스를 id로 찾아옴 
	 */
	@Override
	public List<LoadCourseDto> getMyCourse(String id) {
		// TODO Auto-generated method stub
		System.out.println("여긴 서비스");
		List<SaveCourseDto>	sList = dao.getMyCourse(id);
		List<LoadCourseDto> lList = new ArrayList<LoadCourseDto>();
		for(int i = 0; i< sList.size();i++){
			LoadCourseDto dto = new LoadCourseDto();
			dto.setNum(sList.get(i).getNum());
			dto.setSave_cplace1(placeDao.getInfo(sList.get(i).getSave_cplace1()));
			dto.setSave_cplace2(placeDao.getInfo(sList.get(i).getSave_cplace2()));
			dto.setSave_date(sList.get(i).getSave_date());
			lList.add(dto);
		}
		return lList;
	}

}
