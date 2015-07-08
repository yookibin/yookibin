package com.java.date.member.service;

import org.springframework.web.servlet.ModelAndView;



public interface MemberService {
	/**
	 * @name : memberRegisterOk
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 회원가입 성공여부를 확인하기 위한 함수
	 */
	public void memberRegisterOk(ModelAndView mav);
	
	/**
	 * @name : idCheck
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : id중복체크를 하기위한 함수
	 */
	public void idCheck(ModelAndView mav);
	
	/**
	 * @name : nickNameCheck
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : nickName중복체크를 하기위한 함수.
	 */
	public void nickNameCheck(ModelAndView mav);
	
	/**
	 * @name : zipcode
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 우편번호 검색을 하기 위한 함수
	 */
	public void zipcode(ModelAndView mav);
	
	/**
	 * @name : login
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 회원이 로그인을 하기 위한 함수.
	 */
	public void login(ModelAndView mav);
	
	/**
	 * @name : delete
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 회원이 자기 아이디와 정보를 삭제 하기 위한 함수
	 */
	public void delete(ModelAndView mav);
	
	/**
	 * @name : update
	 * @date : 2015. 6. 26.
	 * @author : 유기빈
	 * @description : 수정하기 전 회원이 자기 정보를 가져오기 위한 함수
	 */
	public void update(ModelAndView mav);
	
	public void updateOk(ModelAndView mav);
	
}
