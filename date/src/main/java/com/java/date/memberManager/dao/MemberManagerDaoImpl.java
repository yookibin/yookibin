package com.java.date.memberManager.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dto.MemberDto;

@Component
public class MemberManagerDaoImpl implements MemberManagerDao{

	@Autowired
	private SqlSessionTemplate sqlSesstion;
	
	@Override
	public List<MemberDto> memberManeger() {
		
		return sqlSesstion.selectList("dao.memberManagerMapper.memberAll");
	}

	@Override
	public int memberManagerDelete(String id) {
		sqlSesstion.delete("dao.memberManagerMapper.eventDelete",id);
		sqlSesstion.delete("dao.memberManagerMapper.pointDelete",id);
		return sqlSesstion.delete("dao.memberManagerMapper.memberDelete",id);
	}

	@Override
	public int memberManagerUpdate(HashMap<String, String> hMap) {
		return sqlSesstion.update("dao.memberManagerMapper.memberUpdate", hMap);
	}

}
