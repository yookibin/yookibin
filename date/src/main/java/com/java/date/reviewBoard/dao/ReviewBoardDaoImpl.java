package com.java.date.reviewBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.reviewBoard.dto.ReviewBoardDto;
@Component
public class ReviewBoardDaoImpl implements ReviewBoardDao {
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	/**
	 * @name : reviewSelect
	 * @date : 2015. 7. 1.
	 * @author : 정희준
	 * @description : 해당 장소의 리뷰를 보여주기 위해 Mapper클래스로 리턴해주는 함수
	 */
	
	@Override
	public List<ReviewBoardDto> reviewSelect(String place_code) {
		
		return sqlSession.selectList("dao.reviewBoardMapper.replyList",place_code);
	}
	
	/**
	 * @name : replyWrite
	 * @date : 2015. 7. 3.
	 * @author : 정희준
	 * @description : 해당 장소의 리뷰에 글을 작성하기 위해 Mapper클래스로 보내주고, 해당장소에 해당하는 리뷰들을 List로 뿌려주기 위해 Mapper클래스로 보내주는 함수
	 */

	@Override
	public List<ReviewBoardDto> replyWrite(int star, String place_code,String nickName, String writeReply) {
		Map<String,Object> hMap = new HashMap<String,Object>();
		hMap.put("place_code",place_code);
		hMap.put("nickName",nickName);
		hMap.put("writeReply",writeReply);
		hMap.put("star",star);
		
		sqlSession.insert("dao.reviewBoardMapper.replyInsert",hMap);
		return sqlSession.selectList("dao.reviewBoardMapper.replyList",place_code);
	}

	/**
	 * @name : replyDelete
	 * @date : 2015. 7. 5.
	 * @author : 정희준
	 * @description : 해당 장소에 리뷰에 글을 삭제하기 위해 Mapper클래스로 리턴해주는 함수
	 */
	
	@Override
	public int replyDelete(int review_code) {
		System.out.println("review_code:" + review_code);
		return sqlSession.delete("dao.reviewBoardMapper.replyDelete",review_code);
	}

	/**
	 * @name : replyUpdate
	 * @date : 2015. 7. 8.
	 * @author : 정희준
	 * @description : 해당 장소에 리뷰에 수정을 해야하는 해당 글을 보여주기 위해 Mapper클래스로 리턴해주는 함수
	 */
	
	@Override
	public ReviewBoardDto replyUpdate(int review_code) {
		return sqlSession.selectOne("dao.reviewBoardMapper.replyDto",review_code);
	}
}
