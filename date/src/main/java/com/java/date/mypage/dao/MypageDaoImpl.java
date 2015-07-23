package com.java.date.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.EventBoardDto;
import com.java.date.mypage.dto.MypageDto;
import com.java.date.recommandPlace.dto.SaveCourseDto;

@Component
public class MypageDaoImpl implements MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	final Logger logger=Logger.getLogger(getClass().getName());

	@Override
	public int delete(int num) {
		// sqlSession.selectList("dao.recommandPlaceMapper.getPlaceList");
		return sqlSession.delete("dao.myPageMapper.delete", num);
	}

	/**
	 * @name : RandomPlaceController
	 * @date : 2015. 7. 12.
	 * @author : 박종현
	 * @description : 나의코스를 id로 찾아옴
	 */
	@Override
	public List<SaveCourseDto> getMyCourse(String id, String like) {
		// TODO Auto-generated method stub
		Map<String, String> hMap = new HashMap<String, String>();
		hMap.put("id", id);
		hMap.put("like", like);
		return sqlSession.selectList("dao.myPageMapper.getMyCourse", hMap);
	}

	@Override
	public List<MypageDto> point(String id) {
		logger.info("id2" + id);

		return sqlSession.selectList("pointcheck", id);
	}

	   @Override
	   public List<EventBoardDto> usingevent(String nickName) {
	      logger.info("usingeventid3" + nickName);
	      return sqlSession.selectList("usingevent", nickName);
	   }

	   @Override
	   public int remainCheck(String id) {
	      logger.info("remainCheckid" + id);
	      return sqlSession.selectOne("remainCheck",id);
	   }

}
