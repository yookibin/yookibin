package com.java.date.reply.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.MemberReplyDto;

@Component
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * @name : replyInsert
	 * @date : 2015. 7. 7.
	 * @author : 유기빈
	 * @description : replyDto를 테이블에 삽입하는 함수.
	 */
	@Override
	public int replyInsert(MemberReplyDto memberReply) {
		
		return sqlSession.insert("dao.replyMapper.replyInsert", memberReply);
	}

	@Override
	public int replyCount(int board_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.replyMapper.replyCount", board_num);
	}

	@Override
	public List<MemberReplyDto> replyList(int board_num) {
		return sqlSession.selectList("dao.replyMapper.replyList", board_num);
	}

	/**
	 * @name : replyBunho
	 * @date : 2015. 7. 7.
	 * @author : 유기빈
	 * @description : 댓글번호중 제일 높은 댓글번호를 가져오는 함수.
	 */
	@Override
	public int replyBunho() {
		return sqlSession.selectOne("dao.replyMapper.replyBunho");
	}

	/**
	 * @name : replyDelete
	 * @date : 2015. 7. 7.
	 * @author : 유기빈
	 * @description : 테이블상에서 해당 댓글을 삭제하기 위한 함수.
	 */
	@Override
	public int replyDelete(int reply_num) {
		int check=sqlSession.delete("dao.replyMapper.replyDelete", reply_num);
		System.out.println("check:"+ check);
		/*if(check>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}*/
		
		return check;
	}

	/**
	 * @name : selectReply
	 * @date : 2015. 7. 7.
	 * @author : 유기빈
	 * @description : 댓글을 수정하기전에 해당 댓글을 가져오기 위한 함수.
	 */
	@Override
	public MemberReplyDto selectReply(int reply_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.replyMapper.replySelect", reply_num);
	}

	/**
	 * @name : updateReply
	 * @date : 2015. 7. 7.
	 * @author : 유기빈
	 * @description : 수정된 내용을 해당 댓글에 업데이트하기 위한 함수,
	 */
	@Override
	public int updateReply(int reply_num, String reply_content) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("reply_num", reply_num);
		hMap.put("reply_content", reply_content);
		int check=sqlSession.update("dao.replyMapper.updateReply", hMap);
		return check;
	}
}
