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
 * @date : 2015. 6. 22.
 * @author : 유기빈
 * @description : 회원에 대한 Controller, 세션으로 넘겨줘서 하기위해 만든 것으로 아직 미완성.
 * 				   회원 수정, 비밀번호찾기, 아이디찾기를 만들어줘야함.
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
	 * @description :회원가입창에서 받은 정보(MemberDto)를 service로 넘기는 함수.
	 *               select로 받은 생년월일을 그냥 string으로 넣을지 date로 넣을지 정한 후 그 부분만 고치면 됨.
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
	 * @description : 아이디중복체크를 위해 service로 request정보를 넘기는 함수.
	 */
	@RequestMapping(value="/member/idCheck.do", method=RequestMethod.GET)
	public ModelAndView idCheck(HttpServletRequest request){
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
	 * @description : 아이디중복체크를 위해 service로 request를 넘겨주는 함수
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
	 * @description :우편번호 검색 함수
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
		memberService.update(mav);
		return mav;
	}
	
	/**
	 * @name : update
	 * @date : 2015. 6. 22.
	 * @author : 유기빈
	 * @description : 수정이 성공했는지 여부를 service에 전달하고 이동하기 위한 함수. 
	 * 				  select로 받은 생년월일을 그냥 string으로 넣을지 date로 넣을지 정한 후 그 부분만 고치면 됨.
	 */
	@RequestMapping(value="/member/update.do", method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response, MemberDto member){
		logger.info("updateOk-------------");
		ModelAndView mav=new ModelAndView();
		//mav.addObject("request", request);
		mav.addObject("member", member);
		memberService.updateOk(mav);
		return mav;
	}
	
	/**
	 * @name : findID
	 * @date : 2015. 7. 20.
	 * @author : jeongsuhyun
	 * @description : 닉네임과 휴대폰번호의 정보를 입력받아 DB에서 비교하는 함수로 이동한다.
	 */
	@RequestMapping(value="/member/findID.do", method=RequestMethod.POST)
	public ModelAndView findID(HttpServletRequest request){
		logger.info("findID---------------");
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		memberService.findID(mav);
		
		return mav;
	}
	
	/**
	 * @name : findPW
	 * @date : 2015. 7. 20.
	 * @author : jeongsuhyun
	 * @description : 아이디와 휴대폰번호의 정보를 입력받아 DB에서 비교하는 함수로 이동한다.
	 */
	@RequestMapping(value="/member/findPW.do", method=RequestMethod.POST)
	public ModelAndView findPW(HttpServletRequest request){
		logger.info("findPW---------------");
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		memberService.findPW(mav);
		
		return mav;
	}
	
}
