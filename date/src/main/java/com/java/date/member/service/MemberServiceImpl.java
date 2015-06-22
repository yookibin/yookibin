package com.java.date.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.date.member.dao.MemberDao;


@Component
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
}
