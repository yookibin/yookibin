package com.java.date.placesearch.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.placesearch.dao.PlacesearchDao;
import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.reviewBoared.dto.reviewBoardDto;



@Component
public class PlacesearchServiceImpl implements PlacesearchService {
   @Autowired
   private PlacesearchDao placesearchDao;
   /*private PlacesearchDto placesearchDto = new PlacesearchDto();*/
   
   final Logger logger=Logger.getLogger(this.getClass().getName());

   @Override
   public void choiceOk(ModelAndView mav) {
      Map<String,Object> hMap = mav.getModelMap();
      HttpServletRequest request= (HttpServletRequest)hMap.get("request");
      
      String area=request.getParameter("area");
      logger.info("area:"+area);
      
       //List<PlacesearchDto> placesearchList=placesearchDao.select(area);
      mav.addObject("area",area);
      mav.setViewName("placesearch/choiceOk");
   }

   @Override
   public void parkthema(ModelAndView mav) {
      Map<String,Object> hMap =mav.getModelMap();
      HttpServletRequest request=(HttpServletRequest)hMap.get("request");
      
      String thema=request.getParameter("thema");
      String area=request.getParameter("area");
      
      logger.info("area:"+area);
      logger.info("thema:"+thema);
      
      List <PlaceDto> parkthema=placesearchDao.gutheam(area,thema);
      logger.info("gg"+parkthema.size());
      
      mav.addObject("area",area);
      mav.addObject("thema",thema);      
      mav.addObject("parkthema",parkthema);
      
      mav.setViewName("placesearch/parkthema");
      
   }
   
   @Override
   public void list(ModelAndView mav) {
      Map<String,Object> hMap=mav.getModelMap();
      HttpServletRequest request=(HttpServletRequest)hMap.get("request");
      
      String area=request.getParameter("area");
      String listcode=request.getParameter("code");
      
      logger.info("area:"+area);
      logger.info("listcode:"+listcode);
      
      PlaceDto placeBoard=placesearchDao.finalthema(area,listcode);
      mav.addObject("area",area);
      mav.addObject("listcode",listcode);
      mav.addObject("placeBoard",placeBoard);
      
      mav.setViewName("placesearch/list");
      
   }

   @Override
   public void reply(ModelAndView mav) {
      Map<String,Object> hMap=mav.getModelMap();
      HttpServletRequest request=(HttpServletRequest)hMap.get("request");
      
      int place_code=Integer.parseInt(request.getParameter("place_code"));
      String lineReply=request.getParameter("lineReply");
      
      logger.info("place_code"+place_code);
      logger.info("lineReply"+lineReply);
      
      reviewBoardDto replyDto=new reviewBoardDto();
      int check=placesearchDao.replyInsert(replyDto);
      mav.addObject("");
   }
   @Override
   public void art(ModelAndView mav) {
      Map<String,Object> hMap=mav.getModelMap();
      HttpServletRequest request=(HttpServletRequest)hMap.get("request");
      
      String thema=request.getParameter("thema");
      String area=request.getParameter("area");
      

      logger.info("artarea:"+area);
      logger.info("thema:"+thema);
      
      List<PlaceDto> artthema=placesearchDao.gutheam(area,thema);
      logger.info("ddd"+artthema.size());
      
      
      mav.addObject("thema",thema);
      mav.addObject("area",area);
      mav.addObject("artthema",artthema);
      
      mav.setViewName("placesearch/parkthema");
      
   }
   
   @Override
   public void concert(ModelAndView mav) {
      Map<String,Object> map=mav.getModelMap();
      HttpServletRequest request=(HttpServletRequest)map.get("request");
      
      String thema=request.getParameter("thema");
      String area=request.getParameter("area");
      
      logger.info("concertThema"+thema);
      logger.info("concertArea"+area);
      
      List <PlaceDto> concertThema=placesearchDao.gutheam(area,thema);
      logger.info("concertThema"+concertThema.size());
      
      mav.addObject("area",area);
      mav.addObject("thema",thema);
      mav.addObject("concertThema",concertThema);
      
      mav.setViewName("placesearch/parkthema");
      
   }
   
   @Override
   public void theaters(ModelAndView mav) {
      Map<String ,Object> map=mav.getModelMap();
      HttpServletRequest request=(HttpServletRequest)map.get("request");
      
      String thema=request.getParameter("thema");
      String area=request.getParameter("area");
      
      logger.info("theaters"+thema);
      logger.info("theatersArea"+area);
      
      List<PlaceDto> theatersThema=placesearchDao.gutheam(area, thema);
      logger.info("theatersThema:"+theatersThema.size());
      
      mav.addObject("area",area);
      mav.addObject("thema",thema);
      mav.addObject("theatersThema",theatersThema);
      
      mav.setViewName("placesearch/parkthema");
      
   }
   @Override
   public void shopping(ModelAndView mav) {
      Map<String,Object> map =mav.getModelMap();
      HttpServletRequest request=(HttpServletRequest)map.get("request");
      
      String thema=request.getParameter("thema");
      String area=request.getParameter("area");
      
      logger.info("shoopingThema"+thema);
      
      List<PlaceDto> shoopingThema =placesearchDao.gutheam(area, thema);
      
      logger.info("shoopingThema"+shoopingThema.size());
      
      mav.addObject("area",area);
      mav.addObject("thema",thema);
      mav.addObject("shoopingThema",shoopingThema);
      
      mav.setViewName("placesearch/parkthema");
      
   }
   
   @Override
   public int placesearchSave(HashMap<String, Object> hmap) {
      logger.info("placesearchSave입니다"+hmap);
      
      return placesearchDao.placesearchSave(hmap);
   }

}