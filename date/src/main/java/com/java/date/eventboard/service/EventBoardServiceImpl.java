package com.java.date.eventboard.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.eventboard.dao.EventBoardDao;
import com.java.date.member.dto.EventBoardDto;

/**
 * @name : EventBoardServiceImpl
 * @date : 2015. 6. 22.
 * @author : JeongSuhyun
 * @description : EventBoardController클래스의 함수들로부터 요청된 함수를 실행한다.
 */
@Component
public class EventBoardServiceImpl implements EventBoardService {
	
	@Autowired
	private EventBoardDao eventBoardDao;
	
	private Logger logger=Logger.getLogger(this.getClass().getName());
	private String dir="C:\\Users\\KOSTA\\date\\date\\src\\main\\webapp\\resources\\eventBoard";
	
	@Override
	public void eventWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=0;
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		mav.addObject("event_code", event_code);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("eventboard/write");
		
	}

	@Override
	public void eventWriteOk(ModelAndView mav) {
		// event_code, pageNumber, writer, event_period, event_title, event_content, file
		logger.info("eventboardServlet으로 넘어옴");
		Map<String, Object> map=mav.getModelMap();
		
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		EventBoardDto eventBoard=(EventBoardDto)map.get("eventBoard");
		
		eventBoard.setRead_count(0);
		eventBoard.setEvent_progress("진행");
		
		MultipartFile upFile=request.getFile("file");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis())+"_"+fileName;
		long fileSize=upFile.getSize();
		
		logger.info("fileName:"+fileName);
		logger.info("timeName:"+timeName);
		logger.info("fileSize:"+fileSize);
		
		if(fileSize!=0){
			try{
				//1. 서버에 올리기(일단은 절대경로 pds가 서버역할)
				//1-1. 절대경로
				//String dir="C:\\Users\\KOSTA_08_027\\git\\date\\date\\src\\main\\webapp\\resources\\eventBoard";
				
				//1-2. 상대경로로 서버를 설정 (fileUp폴더를 서버로 설정)
				//서버를 끄면 아래의 상대경로가 사라짐(resources폴더가 사라진다 ㅇㄴㅇ)
				//String dir=request.getSession().getServletContext().getRealPath("/resources");
				logger.info("dir: "+dir);
				
				File file=new File(dir,timeName);
				upFile.transferTo(file);		//file에 upFile을 넣는건가봐 (입출력)
				
				logger.info("서버에 파일 올라갔당~:D");
				
				//2. DB에 insert하려고 Dto에 값 넣기
				eventBoard.setEvent_filePath(file.getAbsolutePath());
				eventBoard.setEvent_fileName(fileName);
				eventBoard.setEvent_fileSize(fileSize);		
				
				logger.info("filePath: "+eventBoard.getEvent_filePath());
				logger.info("fileName: "+eventBoard.getEvent_fileName());
				logger.info("fileSize: "+eventBoard.getEvent_fileSize());
				
			}catch(Exception e){
				logger.info("EventBoardServiceImpl writeOk 파일 입출력 에러");
				e.printStackTrace();
			}
		}
		
		//3. DB에 insert
		int check=eventBoardDao.boardInsert(eventBoard);
		logger.info("writeOk check:"+check);
		
		//check와 pageNumber를 writeOk.jsp로 넘겨주기
		String pageNumber=request.getParameter("pageNumber");
		
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("eventboard/writeOk");		
		
	}

	@Override
	public void eventList(ModelAndView mav) {
		// TODO Auto-generated method stub
		logger.info("eventList 넘어옴");
		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);	
		
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=eventBoardDao.boardCount();		//총 게시물 수
		
		logger.info("list boardSize:"+boardSize);
		logger.info("list currentPage:"+currentPage);		
		logger.info("list count:"+count);
		
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		List<EventBoardDto> list=eventBoardDao.boardList(hMap);
		logger.info("list listSize:"+list.size());		
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		//logger.info("list[0] filePath: "+list.get(0).getEvent_filePath());
		for(int i=0;i<list.size();i++){
			if(list.get(i).getEvent_fileSize()!=0){
				logger.info("list["+i+"] filfPath: "+list.get(i).getEvent_filePath());
				logger.info(list.get(i).getEvent_filePath().substring(dir.length()+1));
				list.get(i).setEvent_filePath(list.get(i).getEvent_filePath().substring(dir.length()+1));	
				logger.info("list["+i+"] filfPath: "+list.get(i).getEvent_filePath());
			}
			///////////////////////////////////////////////////////////////////////
			//list를 뿌려줄 때 마다 이벤트 기간과 서버의 시간을 비교해서
			//진행상황을 변경한다.
			String event_period=list.get(i).getEvent_period();
			String period[]=event_period.split("~");
			String lastPeriod=period[1].trim();
			logger.info("lastPeriod: "+lastPeriod);
						
			if(lastPeriod!=null){
				
				Calendar calendar=Calendar.getInstance();	//자기 자신의 객체를 못 만들어
				int year=calendar.get(Calendar.YEAR);		//Date클래스에서 안되던 2000년이후year이 가능하다.
				int month=calendar.get(Calendar.MONTH)+1;	//그냥 MONTH하면 개월수 반환
				int date=calendar.get(Calendar.DATE);
				
				String today=Integer.toString(year)+"-"+Integer.toString(month)+"-"+Integer.toString(date);
				logger.info("today: "+today);
				
				Date lastEvent=null;
				Date realToday=null;
				try {
					lastEvent = sdf.parse(lastPeriod);
					realToday=sdf.parse(today);
				} catch (ParseException e) {
					System.out.println("EventBoardServiceImpl eventList Date Error");
					e.printStackTrace();
				}
				
				if(lastEvent.after(realToday)||lastEvent.equals(realToday)){
					list.get(i).setEvent_progress("진행");
					logger.info("진행");
				}else{
					list.get(i).setEvent_progress("종료");
					logger.info("종료");
				}
			}			
			//////////////////////////////////////////////////////////////////////			
		}
				
		// list, count, boardSize, currentPage을 list.jsp에 넘겨줘야 한다.
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);	
		
		mav.setViewName("eventboard/list");
	}

	@Override
	public void eventRead(ModelAndView mav) {
		//${root}/eventboard/read.do?event_code=${eventBoard.event_code}&pageNumber=${currentPage}
		logger.info("eventRead service 넘어옴");
		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		String pageNumber=request.getParameter("pageNumber");
		
		EventBoardDto eventBoard=null;
		
		int check=eventBoardDao.boardReadCount(event_code);
		if(check==1) eventBoard=eventBoardDao.boardRead(event_code);
		logger.info("eventBoard: "+eventBoard);
		
		if(eventBoard.getEvent_fileSize()!=0) eventBoard.setEvent_filePath(eventBoard.getEvent_filePath().substring(dir.length()+1));
		
		String event_period=eventBoard.getEvent_period();
		String period[]=event_period.split("~");
		String lastPeriod=period[1].trim();
		logger.info("lastPeriod: "+lastPeriod);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					
		if(lastPeriod!=null){
			
			Calendar calendar=Calendar.getInstance();	//자기 자신의 객체를 못 만들어
			int year=calendar.get(Calendar.YEAR);		//Date클래스에서 안되던 2000년이후year이 가능하다.
			int month=calendar.get(Calendar.MONTH)+1;	//그냥 MONTH하면 개월수 반환
			int date=calendar.get(Calendar.DATE);
			
			String today=Integer.toString(year)+"-"+Integer.toString(month)+"-"+Integer.toString(date);
			logger.info("today: "+today);
			
			Date lastEvent=null;
			Date realToday=null;
			try {
				lastEvent = sdf.parse(lastPeriod);
				realToday=sdf.parse(today);
			} catch (ParseException e) {
				System.out.println("EventBoardServiceImpl eventList Date Error");
				e.printStackTrace();
			}
			
			if(lastEvent.after(realToday)||lastEvent.equals(realToday)){
				eventBoard.setEvent_progress("진행");
				logger.info("진행");
			}else{
				eventBoard.setEvent_progress("종료");
				logger.info("종료");
			}
		}	
		
		mav.addObject("eventBoard",eventBoard);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("eventboard/read");
		
	}

	@Override
	public void eventDelete(ModelAndView mav) {
		//root+"/eventBoard/delete.do?event_code="+event_code+"&pageNumber="+pageNumber;
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		String pageNumber=request.getParameter("pageNumber");
		
		mav.addObject("event_code",event_code);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("eventboard/delete");		
		
	}

	@Override
	public void eventDeleteOk(ModelAndView mav) {
		// event_code랑 pageNumber가 넘어옴
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		String pageNumber=request.getParameter("pageNumber");
		
		EventBoardDto eventBoard=eventBoardDao.boardRead(event_code);
		
		long event_fileSize=eventBoard.getEvent_fileSize();
		String event_filePath=eventBoard.getEvent_filePath();
		
		if(event_fileSize!=0){
			//기존 파일이 존재 : 기존 파일을 서버에서 삭제 후 새 파일을 서버에 올림
			File oldFile=new File(event_filePath);
			if(oldFile.exists()&&oldFile.isFile()) oldFile.delete();					
		}
		
		int check=eventBoardDao.boardDelete(event_code);
		logger.info("check: "+check);
		
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("eventboard/deleteOk");		
		
	}

	@Override
	public void eventUpdate(ModelAndView mav) {
		//root+"/eventBoard/update.do?event_code="+event_code+"&pageNumber="+pageNumber
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		String pageNumber=request.getParameter("pageNumber");
		
		EventBoardDto eventBoard=eventBoardDao.boardRead(event_code);
		logger.info("eventBoard: "+eventBoard);
		
		mav.addObject("eventBoard",eventBoard);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("eventboard/update");		
		
	}

	@Override
	public void eventUpdateOk(ModelAndView mav) {
		// event_code, pageNumber, event_fileName(기존), event_filePath(기존), event_fileSize(기존), writer, event_period, event_title, event_content, file, event_point, event_giveaway
			Map<String,Object> map=mav.getModelMap();
			MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
			EventBoardDto eventBoard=(EventBoardDto)map.get("eventBoard");
			//pageNumber,event_fileName,event_filePath,event_fileSize, file
			//event_code, writer, event_period, event_title, event_content, event_point, event_giveaway
			
			String pageNumber=request.getParameter("pageNumber");
			//String boardFileName=request.getParameter("boardFileName");
			String event_filePath=request.getParameter("event_filePath");	//기존
			long event_fileSize=Long.parseLong(request.getParameter("event_fileSize"));	 //기존
			
			MultipartFile upFile=request.getFile("file");
			String fileName=upFile.getOriginalFilename();
			String timeName=Long.toString(System.currentTimeMillis())+"_"+fileName;
			long fileSize=upFile.getSize();
			
			logger.info("fileName:"+fileName);
			logger.info("timeName:"+timeName);
			logger.info("fileSize:"+fileSize);
			
			if(fileSize!=0){
				//새로 업데이트한 파일이 존재
				if(event_fileSize!=0){
					//기존 파일이 존재 : 기존 파일을 서버에서 삭제 후 새 파일을 서버에 올림
					File oldFile=new File(event_filePath);
					if(oldFile.exists()&&oldFile.isFile()) oldFile.delete();					
				}
				
				//새 파일에 대한 작업
				try{
					//1. 서버에 올리기(일단은 절대경로 pds가 서버역할)
					//String dir="C:\\Users\\KOSTA_08_027\\git\\date\\date\\src\\main\\webapp\\resources";
					
					File file=new File(dir,timeName);
					upFile.transferTo(file);		//file에 upFile을 넣는건가봐 (입출력)
				//	logger.info("file.getAbsolutePath() : "+file.getAbsolutePath());
					
					//2. DB에 insert하려고 Dto에 값 넣기
					eventBoard.setEvent_filePath(file.getAbsolutePath());
					eventBoard.setEvent_fileName(fileName);
					eventBoard.setEvent_fileSize(fileSize);		
					
				//	logger.info("하하하");
					logger.info("updateOk filepath: "+eventBoard.getEvent_filePath());
					
				}catch(Exception e){
					e.printStackTrace();
					logger.info("EventBoardServiceImpl writeOk 파일 입출력 에러");
				}
				
			}
			
			logger.info("=========================================================");
			logger.info("updateOk filepath: "+eventBoard.getEvent_filePath());
			logger.info("updateOk filename: "+eventBoard.getEvent_fileName());
			logger.info("updateOk filesize: "+eventBoard.getEvent_fileSize());
			logger.info("updateOk filepoint: "+eventBoard.getEvent_point());
			logger.info("updateOk filegiveaway: "+eventBoard.getEvent_giveaway());
			
			int check=eventBoardDao.boardUpdate(eventBoard);
			logger.info("updateOk check: "+check);
			
			//check, pageNumber, boardNumber를 updateOk.jsp에 넘겨준다.
			mav.addObject("check",check);
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("event_code",eventBoard.getEvent_code());
			
			mav.setViewName("eventboard/updateOk");
		
	}

	@Override
	public void eventJoin(ModelAndView mav) {
		//${root}/eventBoard/join.do?event_code=${eventBoard.event_code }&pageNumber=${pageNumber }		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		String pageNumber=request.getParameter("pageNumber");
		
		mav.addObject("event_code",event_code);
		//로그인 후 세션으로 등록된 id를 통해 그 회원의 포인트를 가져와야한다.
		//그 포인트를 mav.addObject할 것
		
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("eventboard/join");		
	}

	
}
