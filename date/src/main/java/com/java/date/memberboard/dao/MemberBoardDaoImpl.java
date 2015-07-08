package com.java.date.memberboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;
import com.java.date.member.dto.RecommendBoardDto;


@Component
public class MemberBoardDaoImpl implements MemberBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * @name : insert
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : write한  내용을 db에 insert하기 위한 함수
	 */
	@Override
	public int insert(MemberBoardDto memberBoard) {
		int value=0;
		
		if(memberBoard.getBoard_fileName()!=null){
			value=sqlSession.insert("dao.memberBoardMapper.boardWriteFile", memberBoard);
		}else{
			value=sqlSession.insert("dao.memberBoardMapper.boardWrite", memberBoard);
		}
		return value;
		//return sqlSession.insert("dao.memberBoardMapper.boardWrite", memberBoard);
	}

	/**
	 * @name : getBoardCount
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 게시판테이블에 작성된 레코드들의 수를 가져오기 위한 함수.
	 */
	@Override
	public int getBoardCount() {
		
		return sqlSession.selectOne("dao.memberBoardMapper.getCount");
	}

	/**
	 * @name : getBoardList
	 * @date : 2015. 6. 23.
	 * @author : 유기빈
	 * @description : 게시판에 글 목록을 뿌려주기 위해 지정해준 범위내의 레코드를 가져오기 위한 함수
	 */
	@Override
	public List<MemberBoardDto> getBoardList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSession.selectList("dao.memberBoardMapper.boardList", hMap);
	}

	/**
	 * @name : boardRead
	 * @date : 2015. 6. 26.
	 * @author : 유기빈
	 * @description : 해당 글 목록을 읽기위한 함수
	 */
	@Override
	public MemberBoardDto boardRead(int board_num) {
		MemberBoardDto member=null;
		try{
			sqlSession.update("dao.memberBoardMapper.readCount", board_num);
			member=sqlSession.selectOne("dao.memberBoardMapper.boardRead", board_num);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public void replyInsert(MemberReplyDto memberReply) {
		
		sqlSession.insert("dao.memberBoardMapper.replyInsert", memberReply);
	}

	@Override
	public int replyCount(int board_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.memberBoardMapper.replyCount", board_num);
	}

	@Override
	public List<MemberReplyDto> replyList(int board_num) {
		return sqlSession.selectList("dao.memberBoardMapper.replyList", board_num);
	}

	/**
	 * @name : deleteBoard
	 * @date : 2015. 6. 26.
	 * @author : 유기빈
	 * @description : 해당 글 목록을 삭제하기 위한 함수
	 */
	@Override
	public int deleteBoard(int board_num) {
		sqlSession.delete("dao.memberBoardMapper.dropReply", board_num);
		return sqlSession.delete("dao.memberBoardMapper.deleteBoard", board_num);
	}

	@Override
	public void recomUpdate(int board_num) {
		
		sqlSession.update("dao.memberBoardMapper.recomUpdate", board_num);
	}

	/**
	 * @name : selectBoard
	 * @date : 2015. 6. 26.
	 * @author : 유기빈
	 * @description : 해당 글 목록을 수정하기전 가져오는 가져오는 함수
	 */
	@Override
	public MemberBoardDto selectBoard(int board_num) {
		return sqlSession.selectOne("dao.memberBoardMapper.selectBoard", board_num);
	}

	/**
	 * @name : updateBoard
	 * @date : 2015. 6. 26.
	 * @author : 유기빈
	 * @description : 해당 글 목록을 수정하기 위한 함수
	 */
	@Override
	public int updateBoard(MemberBoardDto memberBoard) {
		
		return sqlSession.update("dao.memberBoardMapper.updateBoard", memberBoard);
	}
	
	/**
	 * @name : selectRecommend
	 * @date : 2015. 7. 6.
	 * @author : 유기빈
	 * @description : 추천한 이력 확인하기 위한 함수
	 */
	@Override
	public int selectRecommend(int board_num, String recommend_nickName) {
		System.out.println("selectRecommend:"+board_num+","+recommend_nickName);
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("board_num", board_num);
		hMap.put("recommend_nickName", recommend_nickName);
		
		int value=0;
		if(sqlSession.selectOne("dao.memberBoardMapper.selectRecommend", hMap)==null){
			value=0;
		}else{
			value=1;
		}
		return value;
	}
	
	/**
	 * @name : insertRecommend
	 * @date : 2015. 7. 6.
	 * @author : 유기빈
	 * @description : 추천 중복 방지 위해 테이블 등록하기 위한 함수
	 */

	@Override
	public void insertRecommend(RecommendBoardDto recom) {
		sqlSession.insert("dao.memberBoardMapper.insertRecommend", recom);
	}

	/**
	 * @name : selectBoardRecom
	 * @date : 2015. 7. 6.
	 * @author : 유기빈
	 * @description : 해당 글 목록을 읽기위한 함수
	 */
	@Override
	public int selectBoardRecom(int board_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.memberBoardMapper.selectBoardRecom", board_num);
	}

	/**
	 * @name : selectPop
	 * @date : 2015. 7. 7.
	 * @author : 유기빈
	 * @description :  게시글의 탑3개를 가져오기 . 
	 */
	@Override
	public List<MemberBoardDto> getPopList() {
		
		return sqlSession.selectList("dao.memberBoardMapper.selectPop");
	}

	/**
	 * @name : selectPop
	 * @date : 2015. 7. 7.
	 * @author : 유기빈
	 * @description : 탑3에 그룹넘버 1씩 적용해주는 함수
	 */
	@Override
	public int popGroupNumber(int board_num) {
		
		return sqlSession.update("dao.memberBoardMapper.popGroupNumber",board_num);
	}

	/**
	 * @name : boardReset
	 * @date : 2015. 7. 7.
	 * @author : 유기빈
	 * @description :  인기글이 뒤바뀔수 있기때문에 0으로 다시 초기화해주기 위한 함수.
	 */
	@Override
	public int boardReset() {
		// TODO Auto-generated method stub
		return sqlSession.update("dao.memberBoardMapper.boardReset");
	}




}
