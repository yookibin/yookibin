package com.java.date.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dao.MemberDao;
import com.java.date.member.dto.MemberDto;
import com.java.date.member.dto.MemberZipcodeDto;



@Component
public class MemberServiceImpl implements MemberService {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public void memberRegisterOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		logger.info("memberDto:"+memberDto+"--------------------------");
		
		System.out.println("id:"+memberDto.getId());
		System.out.println("pw:"+memberDto.getPw());
		System.out.println("addr:"+memberDto.getAddr());
		System.out.println("age:"+memberDto.getAge());
		System.out.println("birth:"+memberDto.getBirthday());
		System.out.println("nickname:"+memberDto.getNickName());
		System.out.println("phone:"+memberDto.getPhone());
		
		int check=memberDao.memberRegister(memberDto);
		logger.info("check:"+check);
		mav.addObject("check", check);
		mav.setViewName("member/registerOk");	
	}

	@Override
	public void idCheck(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String id=request.getParameter("id");
		logger.info("id:"+id);
		int check=memberDao.idCheck(id);
		logger.info("check:"+check);
		mav.addObject("check", check);
		mav.addObject("id", id);
		mav.setViewName("member/idCheck");
		
	}

	@Override
	public void nickNameCheck(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String nickName=request.getParameter("nickName");
		logger.info("nickName:"+nickName);
		int check=memberDao.nickNameCheck(nickName);
		logger.info("check:"+check);
		mav.addObject("check", check);
		mav.addObject("nickName", nickName);
		mav.setViewName("member/nickNameCheck");
		
	}
	
	@Override
	public void zipcode(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String dong=request.getParameter("dong");
		logger.info("dong:"+dong);
		List<MemberZipcodeDto> list=null;
		if(dong!=null){
			list=memberDao.zipcode(dong);
			logger.info("zipcodeDto:"+list.size());
		}
		mav.addObject("list", list);
		mav.setViewName("member/zipcode");
		
	}
	
	@Override
	public void login(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		logger.info("id:"+id+", password:"+password);
		MemberDto member=memberDao.login(id, password);
		//logger.info(member);
		if(member !=null){
			logger.info("member:"+member);
			//String memberLevel=member.getMemberLevel();
			//System.out.println("memberLevel"+memberLevel);
			//우리도 멤버레벨 추가시켜야함 밑에꺼 일단 보류 .
			//mav.addObject("memberLevel", member.getMemberLevel());
			mav.addObject("id", member.getId());
			mav.addObject("nickName", member.getNickName());
			mav.setViewName("member/loginOk");
			
		}
	}
	
	@Override
	public void delete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		int check=memberDao.delete(id, password);
		logger.info("check:"+check);
		
		mav.addObject("check", check);
		mav.setViewName("member/deleteOk");
		
	}
	
	@Override
	public void select(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String id=request.getParameter("id");
		logger.info("id:"+id);
		MemberDto member=memberDao.select(id);
		logger.info("member:"+ member);
		mav.addObject("member", member);
		mav.setViewName("member/update");
	}

	/*@Override
	public void update(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		//HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto member=(MemberDto)map.get("member");
		logger.info("member:"+member);
		
		int check=memberDao.update(member);
		logger.info("check:"+check);
		mav.addObject("check", check);
		mav.setViewName("member/updateOk");
	}*/
}
