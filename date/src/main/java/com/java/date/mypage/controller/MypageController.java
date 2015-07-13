package com.java.date.mypage.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.date.mypage.service.MypageService;
import com.java.date.recommandPlace.dto.LoadCourseDto;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/mypage/mycourse.do",method=RequestMethod.GET)
	public String mycouse(HttpServletRequest request, HttpServletResponse response){
		logger.info("mycourse Start----------------");
		
		return "mypage/mycourse";
	}
	/**
	 *@name : RandomPlaceController
	 *@date : 2015. 7. 12.
	 *@author : 박종현
	 *@description : 나의코스중 num(pk)을 지움 
	 */
	@RequestMapping("/mypage/delete.do")
	@ResponseBody
	public int delete(int num){
		logger.info("mycourse Start----------------"+num);
		return mypageService.delete(num);
	}
	/**
	 *@name : RandomPlaceController
	 *@date : 2015. 7. 12.
	 *@author : 박종현
	 *@description : 나의코스를 id로 찾아옴 
	 */
	@RequestMapping("/mypage/getMyCourse.do")
	@ResponseBody
	public List<LoadCourseDto> getMyCourse(String id){
		logger.info("getMyCourse Start----------------"+id);
		System.out.println("getMyCourse");
		return mypageService.getMyCourse(id);
	}
	
	

}
