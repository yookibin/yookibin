package com.java.date.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.MemberDto;
import com.java.date.member.dto.MemberZipcodeDto;


@Component
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int memberRegister(MemberDto memberDto) {
		
		return sqlSession.insert("dao.memberMapper.memberInsert", memberDto);
	}
	
	@Override
	public int idCheck(String id) {
		String check=sqlSession.selectOne("dao.memberMapper.idCheck", id);
		int value=0;
		
		if(check!=null){
			value=1; 
		}
		return value;
	}

	@Override
	public int nickNameCheck(String nickName) {
		String check=sqlSession.selectOne("dao.memberMapper.nickNameCheck", nickName);
		int value=0;
		
		if(check!=null){
			value=1; 
		}
		return value;
	}
	
	@Override
	public List<MemberZipcodeDto> zipcode(String dong) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("dao.memberMapper.zipcode", dong);
	}
	
	@Override
	public MemberDto login(String id, String password) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("id", id);
		hMap.put("password", password);
		//System.out.println(id+password);
		return sqlSession.selectOne("dao.memberMapper.login", hMap);
	}
	
	@Override
	public int delete(String id, String password) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("id", id);
		hMap.put("password", password);
		return sqlSession.delete("dao.memberMapper.delete", hMap);
	}
	
	@Override
	public MemberDto select(String id) {
		
		return sqlSession.selectOne("dao.memberMapper.select", id);
	}

	/*@Override
	public int update(MemberDto member) {
		// TODO Auto-generated method stub
		return sqlSession.update("dao.memberMapper.update", member);
	}*/
}
