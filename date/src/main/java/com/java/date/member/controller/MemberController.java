package com.java.date.member.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.MemberDto;
import com.java.date.member.service.MemberService;



/**
 * @name : MemberController
 * @date : 2015. 6. 23.
 * @author : 유기빈
 * @description :
 */
/**
 * @name : MemberController
 * @date : 2015. 6. 22.
 * @author : 유기빈
 * @description :
 */
@Controller
public class MemberController {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * @name : register
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 회원가입창이동
	 */
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public String register(HttpServletRequest request){
		logger.info("MemberRegister GET---------------");
		return "member/register";
	}
	
	/**
	 * @name : register
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description :회원가입창에서 받은 정보를 service로 전달.
	 */
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request, MemberDto memberDto){
		logger.info("MemberRegister POST-----------------");
		//System.out.println(memberDto.getBirthday());
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberDto", memberDto);
		memberService.memberRegisterOk(mav);
		return mav;
	}
	
	/**
	 * @name : idCheck
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 아이디중복체크를 위해 service로 request에서 받은 id값을 넘김.
	 */
	@RequestMapping(value="/member/idCheck.do", method=RequestMethod.GET)
	public ModelAndView idCheck(HttpServletRequest request, HttpServletResponse response){
		logger.info("idCheck-----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		memberService.idCheck(mav);
		return mav;
	}
	
	/**
	 * @name : nickNameCheck
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 아이디중복체크를 위해 service로 request에서 받은 nickName값을 넘김.
	 */
	@RequestMapping(value="/member/nickNameCheck.do", method=RequestMethod.GET)
	public ModelAndView nickNameCheck(HttpServletRequest request, HttpServletResponse response){
		logger.info("nickNameCheck-----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		memberService.nickNameCheck(mav);
		return mav;
	}
	
	/**
	 * @name : zipcode
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description :우편번호 검색해서 검색한 내용을 service로 전달.
	 */
	@RequestMapping(value="/member/zipcodeCheck.do")
	public ModelAndView zipcode(HttpServletRequest request, HttpServletResponse response){
		logger.info("zipcode-----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		memberService.zipcode(mav);
		
		return mav;
	}
	
	/**
	 * @name : login
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description :로그인 페이지 이동.
	 */
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String login(HttpServletRequest request){
		logger.info("login---------------------------");
		return "member/login";
	}
	
	/**
	 * @name : login
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 로그인이 성공했는지 여부를 확인하기위한 함수.
	 */
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response){
		logger.info("loginOk-----------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.login(mav);
		return mav;
	}
	
	/**
	 * @name : logOut
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 로그아웃페이지이동.
	 */
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response){
		logger.info("logOut---------------");
		return "member/logout";
	}
	
	/**
	 * @name : delete
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description :삭제하기위한 삭제페이지로 이동.
	 */
	@RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
	public String delete(HttpServletRequest request){
		logger.info("delete---------------");
		return "member/delete";
	}
	
	/**
	 * @name : delete
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description :삭제성공여부를 확인하기위한 함수.
	 */
	@RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response){
		logger.info("deleteOk----------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.delete(mav);
		return mav;
	}
	
	/**
	 * @name : update
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 수정하기위한 창을 기존 정보값을 가지고 이동하기 위한 함수.
	 */
	@RequestMapping(value="/member/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response){
		logger.info("update----------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.select(mav);
		return mav;
	}
	
	/**
	 * @name : update
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 수정이 성공했는지 여부를 service에 전달하고 이동하기 위한 함수.
	 */
	/*@RequestMapping(value="/member/update.do", method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response, MemberDto member){
		logger.info("updateOk-------------");
		ModelAndView mav=new ModelAndView();
		//mav.addObject("request", request);
		mav.addObject("member", member);
		memberService.update(mav);
		return mav;
	}*/
	
}
