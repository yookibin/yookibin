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

	@Override
	public int replyBunho() {
		return sqlSession.selectOne("dao.replyMapper.replyBunho");
	}

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

	@Override
	public MemberReplyDto selectReply(int reply_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.replyMapper.replySelect", reply_num);
	}

	@Override
	public int updateReply(int reply_num, String reply_content) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("reply_num", reply_num);
		hMap.put("reply_content", reply_content);
		int check=sqlSession.update("dao.replyMapper.updateReply", hMap);
		return check;
	}
}
