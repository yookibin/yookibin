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
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.EventBoardDto;
import com.java.date.mypage.dto.MypageDto;
import com.java.date.mypage.service.MypageService;
import com.java.date.recommandPlace.dto.LoadCourseDto;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;

	final Logger logger = Logger.getLogger(this.getClass().getName());

	@RequestMapping(value = "/mypage/mycourse.do", method = RequestMethod.GET)
	public String mycouse(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("mycourse Start----------------");

		return "mypage/mycourse";
	}

	/**
	 * @name : RandomPlaceController
	 * @date : 2015. 7. 12.
	 * @author : 박종현
	 * @description : 나의코스중 num(pk)을 지움
	 */
	@RequestMapping("/mypage/delete.do")
	@ResponseBody
	public int delete(int num) {
		logger.info("mycourse Start----------------" + num);
		return mypageService.delete(num);
	}

	/**
	 * @name : RandomPlaceController
	 * @date : 2015. 7. 12.
	 * @author : 박종현
	 * @description : 나의코스를 id로 찾아옴
	 */
	@RequestMapping("/mypage/getMyCourse.do")
	@ResponseBody
	public List<LoadCourseDto> getMyCourse(String id,String like) {
		logger.info("getMyCourse Start----------------" + id);
		System.out.println("getMyCourse");
		return mypageService.getMyCourse(id, like);
	}
	@RequestMapping("/mypage/point.do")
	@ResponseBody
    public List<MypageDto> point(String id) {
	    logger.info("point Start----------------");

	    System.out.println("point");
	      

	    return mypageService.pointCheck(id);
    }
	   
	@RequestMapping("/mypage/usingevent.do")
	@ResponseBody
	public List<EventBoardDto> usingevent(String nickName){
	  logger.info("usingEvetn Start--------------");
	  System.out.println("Event 된당");
	      
	     return mypageService.usingCheck(nickName);
	  }
	
	@RequestMapping("/mypage/remainPoint.do")
	   @ResponseBody
	   public int remainPoint(String id){
	      logger.info("remainPoint Start--------------");
	      System.out.println("remainPoint 된당");
	      
	      return mypageService.remainCheck(id);
	   }
	/*
	@RequestMapping(value = "/mypage/point.do", method = RequestMethod.GET)
	public ModelAndView point(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("point Start----------------");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.pointCheck(mav);

		return mav;
	}

	@RequestMapping(value = "/mypage/usingevent.do", method = RequestMethod.GET)
	public ModelAndView usingevent(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("usingeven Start----------------");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.usingevent(mav);

		return mav;
	}*/

}
