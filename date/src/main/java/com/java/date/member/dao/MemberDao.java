package com.java.date.member.dao;

import java.util.HashMap;
import java.util.List;

import com.java.date.member.dto.MemberDto;
import com.java.date.member.dto.MemberZipcodeDto;


public interface MemberDao {
	/**
	 * @name : memberRegister
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 회원이 회원가입하기위해 정보를 넣기 위한 함수
	 */
	int memberRegister(MemberDto memberDto);
	
	/**
	 * @name : idCheck
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : id중복체크를 하기 위한 함수
	 */
	public int idCheck(String id);
	
	/**
	 * @name : nickNameCheck
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : nickName중복체크를 하기 위한 함수
	 */
	public int nickNameCheck(String nickName);
	
	/**
	 * @name : zipcode
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 해당하는 우편번호를 검색해오기 위한 함수
	 */
	public List<MemberZipcodeDto> zipcode(String dong);
	
	/**
	 * @name : login
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 회원이 로그인하기 위한 함수
	 */
	public MemberDto login(String id, String password);
	
	/**
	 * @name : delete
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 회원 아이디 및 정보를 삭제하기 위한 함수
	 */
	public int delete(String id, String password);
	
	/**
	 * @name : select
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 회원 정보를 수정하기 전 셀렉트해오기 함수
	 */
	public MemberDto select(String id);
	
	public int update(MemberDto member);
	
	public int memberPoint(String id);
	
	public String findID(HashMap<String,String> hMap);
	
	public String findPW(HashMap<String,String> hMap);
	
}
