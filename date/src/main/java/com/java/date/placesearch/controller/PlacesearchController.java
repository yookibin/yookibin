package com.java.date.placesearch.controller;

import java.util.HashMap;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.placesearch.service.PlacesearchService;

@Controller
public class PlacesearchController {
   
   @Autowired
   private PlacesearchService placesearchService;
   
   final Logger logger=Logger.getLogger(this.getClass().getName());
   
   @RequestMapping(value="/placesearch/choice.do",method=RequestMethod.GET)
   public  String choice(HttpServletRequest request,HttpServletResponse response){
      logger.info("placesearch choice Start---------------");
      
   
      
      return "placesearch/choice";
      
   }
   
   @RequestMapping(value="/placesearch/choiceOk.do",method=RequestMethod.GET)
   public  ModelAndView choiceOk(HttpServletRequest request,HttpServletResponse response){
      logger.info("choiceOk Start---------------");
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("request",request);
      
      placesearchService.choiceOk(mav);
      
      return mav;   
   }
   @RequestMapping(value="/placesearch/map.do",method=RequestMethod.GET)
   public String map(HttpServletRequest request,HttpServletResponse response){
      logger.info("placesearch choice Start---------------");
      
   
      
      return "placesearch/map";
   }
   
   @RequestMapping(value="placesearch/parkthema.do",method=RequestMethod.GET)
   public ModelAndView parkthema(HttpServletRequest request,HttpServletResponse response){
      logger.info("parkthema Start-----------------");
      
      ModelAndView mav= new ModelAndView();
      mav.addObject("request",request);
      
      placesearchService.parkthema(mav);
      return mav;
   }
   
   @RequestMapping(value="placesearch/list.do",method=RequestMethod.GET)
   public ModelAndView list(HttpServletRequest request,HttpServletResponse response){
      logger.info("list Start-----------------");
      
      ModelAndView mav= new ModelAndView();
      mav.addObject("request",request);
      
      placesearchService.list(mav);
      return mav;
   }
   
   @RequestMapping(value="placesearch/ReplyWriteAction.do",method=RequestMethod.GET)
   public ModelAndView reply(HttpServletRequest request,HttpServletResponse response){
      logger.info("reply Start----------------");
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("request",request);
      
      placesearchService.reply(mav);
      return mav;
   }
   
   @RequestMapping(value="placesearch/art.do",method=RequestMethod.GET)
   public ModelAndView art(HttpServletRequest request,HttpServletResponse response){
      logger.info("art Start-----------------");
      
      ModelAndView mav= new ModelAndView();
      mav.addObject("request",request);
      
      placesearchService.art(mav);
      
      
      return mav;
   }

   @RequestMapping(value="placesearch/concert.do",method=RequestMethod.GET)
   public ModelAndView concert(HttpServletRequest request,HttpServletResponse response){
      logger.info("concert Start---------------");
      
      ModelAndView mav =new ModelAndView();
      mav.addObject("request",request);
      
      placesearchService.concert(mav);
      return mav;
      
   }
   
   @RequestMapping(value="placesearch/theaters.do",method=RequestMethod.GET)
   public ModelAndView theathers(HttpServletRequest request,HttpServletResponse response){
      logger.info("theaters Start----------------");
      
      ModelAndView mav= new ModelAndView();
      mav.addObject("request",request);
      
      placesearchService.theaters(mav);
      return mav;
   }
   

   
   @RequestMapping(value="placesearch/shopping.do",method=RequestMethod.GET)
   public ModelAndView shopping(HttpServletRequest request){
      logger.info("Shopping Start----------------");
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("request",request);
      
      placesearchService.shopping(mav);
      return mav;
   }

   
   @RequestMapping(value="/placesearch/saveCourse.do")   
   @ResponseBody
   public int saveCourse(String id,String place){
      logger.info("placesearchSave ajaxson //");
      
      String place2="0";
      String thema="thema";
      logger.info("id:"+id+"thema:"+thema+"place_code1:"+place+"place_code2"+0);
      
      HashMap<String,Object> hmap= new HashMap<String,Object>();
      hmap.put("id",id);
      hmap.put("thema",thema);
      hmap.put("place1",place);
      hmap.put("place2", place2);
      
   return placesearchService.placesearchSave(hmap);
   }
   
   
   
}