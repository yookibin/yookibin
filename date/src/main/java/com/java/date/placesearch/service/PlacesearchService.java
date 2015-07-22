package com.java.date.placesearch.service;

import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

public interface PlacesearchService {

   public void choiceOk(ModelAndView mav);
   public void parkthema(ModelAndView mav);
   public void list(ModelAndView mav);
   public void reply(ModelAndView mav);
   public void art(ModelAndView mav);
   public void concert(ModelAndView mav);
   public void theaters(ModelAndView mav);
   public void shopping(ModelAndView mav);
   public int placesearchSave(HashMap<String,Object> hmap);

}