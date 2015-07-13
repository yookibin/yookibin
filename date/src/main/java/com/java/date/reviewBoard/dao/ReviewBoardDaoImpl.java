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
	public int replyWrite(int star, String place_code,String nickName, String writeReply) {
		Map<String,Object> hMap = new HashMap<String,Object>();
		hMap.put("place_code",place_code);
		hMap.put("nickName",nickName);
		hMap.put("writeReply",writeReply);
		hMap.put("star",star);
		
		return sqlSession.insert("dao.reviewBoardMapper.replyInsert",hMap);
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
	public int replyUpdate(int review_code, String review_content) {
		HashMap<String, Object> hMap = new HashMap<String,Object>();
		hMap.put("review_code", review_code);
		hMap.put("review_content", review_content);
		System.out.println("DAO");
		System.out.println(review_code);
		System.out.println(review_content);
		System.out.println("또 그러는건가");
		return sqlSession.update("dao.reviewBoardMapper.replyDto",hMap);
	}
	
	@Override
	public int selectStar(String place_code) {
		int value=0;
		
		int check=sqlSession.selectOne("dao.reviewBoardMapper.selectStar",place_code);
		if(check==0){
			value=0;
		}else{
			value=1;
		}
		return value;
	}

	@Override
	public int reviewStar(String place_code) {
		return sqlSession.selectOne("dao.reviewBoardMapper.reviewStar",place_code);
	}

	@Override
	public int reviewStarCheck(String place_code) {
		return sqlSession.selectOne("dao.reviewBoardMapper.reviewStarCheck",place_code);
	}

}
