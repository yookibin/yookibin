package com.java.date.recommandPlace.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.recommandPlace.dao.RecommandPlaceDao;
import com.java.date.recommandPlace.dto.LoadCourseDto;
import com.java.date.recommandPlace.dto.PlaceDto;
import com.java.date.recommandPlace.dto.SaveCourseDto;

@Component
public class RecommandPlaceServiceImpl implements RecommandPlaceService {
	@Autowired
	private RecommandPlaceDao dao;
	Logger logger = Logger.getLogger(this.getClass().getName());

	@Override
	public void placeCourseList(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		/* HttpServletRequest request = (HttpServletRequest) map.get("request"); */
		/*
		 * String place_gu = request.getParameter("place_gu"); String
		 * place_season = request.getParameter("place_season"); String
		 * place_weather = request.getParameter("place_weather"); String
		 * place_time = request.getParameter("place_time"); String place_price =
		 * request.getParameter("place_price");
		 */

		PlaceDto dto = (PlaceDto) map.get("placeDto");
		logger.info("잘나오나" + dto.getPlace_gu());
		logger.info("잘나오나" + dto.getPlace_season());
		logger.info("잘나오나" + dto.getPlace_weather());
		logger.info("잘나오나" + dto.getPlace_time());
		logger.info("잘나오나" + dto.getPlace_price());
		List<PlaceDto> placeDtoList = dao.getPlaceDtoList(dto);
		// int a = dao.getPrice("화랑공원");
		System.out.println(placeDtoList.size());
		System.out.println(placeDtoList.get(0).getPlace_name());
		List<List> list = new ArrayList();
		if (placeDtoList.size() >= 3) {
			for (int i = 0; i < placeDtoList.size() - 2; i = i + 2) {
				List<PlaceDto> placeList = new ArrayList();
				placeList.add(placeDtoList.get(i));
				placeList.add(placeDtoList.get(i + 1));
				list.add(placeList);
			}
		}
		mav.addObject("list", list);
		mav.setViewName("recommandPlace/recommandPlaceOk");

	}

	@Override
	public void selectMap(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String place = request.getParameter("place");
		logger.info("place : " + place);
		mav.addObject("place", place);
		mav.setViewName("map/map2");

	}

	@Override
	public void selectMap0(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String place = request.getParameter("place");
		logger.info("place : " + place);
		mav.addObject("place", place);
		mav.setViewName("map/map");

	}

	@Override
	public void selectMap2(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		mav.setViewName("map/map3");
	}

	@Override
	public void selectMap3(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		mav.setViewName("map/map4");
	}

	@Override
	public void daumMap(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String a = request.getParameter("place_name");
		String b = request.getParameter("place_season");
		String c = request.getParameter("place_weather");
		String d = request.getParameter("place_time");
		String e = request.getParameter("place_price");
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);
		PlaceDto dto = (PlaceDto) map.get("placeDto");
		logger.info("잘나오나" + dto.getPlace_name());
		logger.info("잘나오나" + dto.getPlace_season());
		logger.info("잘나오나" + dto.getPlace_weather());
		logger.info("잘나오나" + dto.getPlace_time());
		logger.info("잘나오나" + dto.getPlace_price());
		mav.setViewName("recommandPlace/daumMap");
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 장소코드로 장소DTO를 가져옴.
	 */
	@Override
	public PlaceDto getInfo(String code) {

		return dao.getInfo(code);
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 사용자선택에 의한 장소들을 가져온다.
	 */
	@Override
	public List<PlaceDto> placeList(PlaceDto dto) {
		// TODO Auto-generated method stub
		return dao.placeList(dto);
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 6. 22.
	 * @author : 종현
	 * @description : 선택한 코스에 대한 정보를 제공.
	 */
	@Override
	public void selectCourse(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String courseSelect = request.getParameter("courseSelect");
		logger.info("courseSelect : " + courseSelect);
		String placeCode1;
		String placeCode2;
		String like = request.getParameter("like");
		if(courseSelect != null){
			String[] result = courseSelect.split(",");
			placeCode1 = result[0].trim();
			placeCode2 = result[1].trim();
			System.out.println("이건포스트형식");
			System.out.println(placeCode1);
			System.out.println(placeCode2);
		}else{
			System.out.println("이건겟형식");
			placeCode1 = request.getParameter("place_code1");
			placeCode2 = request.getParameter("place_code2");
			
		}
		List<PlaceDto> placeDtoList = dao.getPlaceDtoList(placeCode1,
				placeCode2);
		System.out.println(placeDtoList.size());
		mav.addObject("like", like);
		mav.addObject("placeDtoList", placeDtoList);
		mav.setViewName("recommandPlace/course");
	}

	@Override
	public List<Object> test12() {
		// TODO Auto-generated method stub
		return dao.test12();
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 7. 10.
	 * @author : 종현
	 * @description : 사용자가 선택한 코스를 저장하는 함수.
	 */
	@Override
	public int saveCourse(String place_code1, String place_code2,String id) {
		// TODO Auto-generated method stub
		return dao.saveCourse(place_code1, place_code2, id);
	}

	/**
	 * @name : RecommandPlaceController
	 * @date : 2015. 7. 12.
	 * @author : 종현
	 * @description : 마이페이지의 내 저장된 코스보기로 이동.
	 */
	@Override
	public void moveMypage(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String cid = request.getParameter("id");
		System.out.println(cid);
		List<SaveCourseDto> cList = dao.moveMypageGetCourse(cid);
		List<LoadCourseDto> lList = new ArrayList();
		for (int i = 0; i < cList.size(); i++) {
			LoadCourseDto dto = new LoadCourseDto();
			dto.setNum(cList.get(i).getNum());
			dto.setSave_cplace1(dao.getInfo(cList.get(i).getSave_cplace1()));
			dto.setSave_cplace2(dao.getInfo(cList.get(i).getSave_cplace2()));
			dto.setSave_date(cList.get(i).getSave_date());
			lList.add(dto);
		}

		mav.addObject("lList", lList);
		mav.setViewName("mypage/mycourse");

	}

	@Override
	public void findPlace(ModelAndView mav) {
		// TODO Auto-generated method stub
		List<PlaceDto> placeList = dao.getPlaceDtoList();
		List<String> guList = new ArrayList<String>();
		for (int i = 0; i < placeList.size(); i++) {
			int check = 0;
			for (int j = 0; j < guList.size(); j++) {
				if (placeList.get(i).getPlace_gu().equals(guList.get(j))) {
					check++;
				}
			}
			System.out.println(i + "번째" + check);
			if (check == 0) {
				guList.add(placeList.get(i).getPlace_gu());
				check = 0;
			}
		}
		mav.addObject("guList", guList);
		mav.addObject("list", placeList);
		mav.setViewName("recommandPlace/recommandPlace");
	}

	@Override
	public void insertMap(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		String place_name = request.getParameter("place_name");
		int place_star = Integer.parseInt(request.getParameter("place_star"));
		int place_price = Integer.parseInt(request.getParameter("place_price"));
		String place_cordi1 = request.getParameter("place_cordi1");
		String place_time = request.getParameter("place_time");
		String place_phone = request.getParameter("place_phone");
		String place_cordi2 = request.getParameter("place_cordi2");
		String place_balance = request.getParameter("place_balance");
		String place_runtime = request.getParameter("place_runtime");
		String place_weather = request.getParameter("place_weather");
		String place_location = request.getParameter("place_location");
		String place_thema = request.getParameter("place_thema");
		String place_season = request.getParameter("place_season");
		String place_gu = request.getParameter("place_gu");
		String place_content = request.getParameter("place_content");
		

		// MultipartHttpServletRequest여기에서 파일인지 아닌지 자동으로 나눠줘
		// 여기서 그냥 파일만 딱 뽑아낼 수 있다.
		MultipartFile upFile = request.getFile("file");
		String fileName = upFile.getOriginalFilename();
//		String timeName = Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize = upFile.getSize();

		logger.info("fileName:" + fileName);
		logger.info("fileSize:" + fileSize);
		PlaceDto dto = new PlaceDto();
		dto.setPlace_name(place_name);
		dto.setPlace_cordi1(place_cordi1);
		dto.setPlace_cordi2(place_cordi2);
		dto.setPlace_weather(place_weather);
		dto.setPlace_season(place_season);
		dto.setPlace_star(place_star);
		dto.setPlace_time(place_time);
		dto.setPlace_balance(place_balance);
		dto.setPlace_location(place_location);
		dto.setPlace_photo("/resources/placeImg/uploadPlace/"+fileName);
		dto.setPlace_content(place_content);
		dto.setPlace_price(place_price);
		dto.setPlace_phone(place_phone);
		dto.setPlace_runtime(place_runtime);
		dto.setPlace_thema(place_thema);
		dto.setPlace_gu(place_gu);
		
		
		if (fileSize != 0) {
			try {
				// 1. 서버에 올리기(일단은 절대경로 pds가 서버역할)
				// 1-1. 절대경로
				String dir = "C:\\Users\\KOSTA\\date\\date\\src\\main\\webapp\\resources\\placeImg\\uploadPlace";

				// 1-2. 상대경로로 서버를 설정 (fileUp폴더를 서버로 설정)
				// String
				//String dir=request.getSession().getServletContext().getRealPath("/resources");
				//dir = dir + "\\placeImg\\uploadPlace";
				logger.info("dir: " + dir);

				File file = new File(dir, fileName);
				upFile.transferTo(file); // file에 upFile을 넣는건가봐 (입출력)

			} catch (Exception e) {
				logger.info("FileBoardServiceImpl writeOk 파일 입출력 에러");
			}
		}

		// 3. DB에 insert
		int check = dao.insertMap(dto);
		logger.info("writeOk check:" + check);

		// check와 pageNumber를 writeOk.jsp로 넘겨주기

		mav.addObject("check", check);
		mav.setViewName("recommandPlace/writeOk");
	}
}
