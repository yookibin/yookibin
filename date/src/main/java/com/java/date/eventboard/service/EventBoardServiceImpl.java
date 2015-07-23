package com.java.date.eventboard.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.java.date.member.dto.EventMemberDto;

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
	
	/**
	 * @name : eventWrite
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_code와 pageNumber의 값을 설정하여 jsp페이지로 이동한다.
	 */
	@Override
	public void eventWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=0;
		int group_number=1;
		int sequence_number=0;
		int sequence_level=0;
		
		
		//답글일때
		if(request.getParameter("event_code")!=null){
			event_code=Integer.parseInt(request.getParameter("event_code"));
			group_number=Integer.parseInt(request.getParameter("group_number"));
			sequence_number=Integer.parseInt(request.getParameter("sequence_number"));
			sequence_level=Integer.parseInt(request.getParameter("sequence_level"));
			
			int num=0;
						
			if(request.getParameter("num")!=null){
				num=Integer.parseInt(request.getParameter("num"));
			}
			
			ArrayList<EventMemberDto> winnerList=castWinner(event_code,num);
			
			EventBoardDto eventBoard=eventBoardDao.boardRead(event_code);
						
			mav.addObject("winnerList", winnerList);
			mav.addObject("eventBoard", eventBoard);
			
		}
		
		logger.info("event_code:"+event_code);
		logger.info("group_number:"+group_number);
		logger.info("sequence_number:"+sequence_number);
		logger.info("sequence_level:"+sequence_level);
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		mav.addObject("event_code", event_code);
		mav.addObject("group_number", group_number);
		mav.addObject("sequence_number", sequence_number);
		mav.addObject("sequence_level", sequence_level);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("eventboard/write");
		
	}
	
	/**
	 * @name : castWinner
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : event_code에 해당하는 레코드들 중 입력받은 개수의 레코드를 랜덤으로 선택하여 반환한다.
	 */
	public ArrayList<EventMemberDto> castWinner(int event_code, int num){
		ArrayList<EventMemberDto> winnerList=new ArrayList<EventMemberDto>();		
		//event_code에 해당하는 EventMemberDto들을 가져온다.(해당 이벤트에 응모한 글들을 가져오는거지)
		//랜덤으로 join_code를 num개수만큼 선택한다.
		//랜덤으로 뽑힌 join_code에 해당하는 EventMemberDto를 winnerList에 담는다.
		
		List<EventMemberDto> list=eventBoardDao.getEventMembers(event_code);
		logger.info("castWinner listSize: "+list.size());
				
		if(list.size()>=num){
			int[] number=new int[num];
			
			for(int i=0;i<number.length;i++){
				number[i]=(int)(Math.random()*list.size());
				
				for(int j=0;j<i;j++){
					if(number[i]==number[j]){
						i--;
						break;
					}
				}
				
				logger.info("number["+i+"]="+number[i]);
			}		
		
			for(int i=0;i<number.length;i++){
				winnerList.add(list.get(number[i]));
			}
		}
		
		return winnerList;
	}
	
	/**
	 * @name : eventWriteOk
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : 넘겨받은 데이터를 가지고 DB에 insert후 jsp페이지로 이동한다.
	 */
	@Override
	public void eventWriteOk(ModelAndView mav) {
		// event_code, pageNumber, writer, event_period, event_title, event_content, file
		logger.info("eventboardServlet으로 넘어옴");
		Map<String, Object> map=mav.getModelMap();
		
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		EventBoardDto eventBoard=(EventBoardDto)map.get("eventBoard");
		//MultipartFile naverFile=(MultipartFile)map.get("naverFile");
		
		//-------------------------------------------------------
	/*	String naverFileName=naverFile.getOriginalFilename();
		logger.info("eventWriteOk naverFile: "+naverFileName);
		String fileExtension=naverFileName.substring(naverFileName.lastIndexOf(".")+1);
		
		fileExtension.toLowerCase();
		
		String serverPath=request.getSession().getServletContext().getRealPath("/");
		String storePath=serverPath+"resources"+File.separator+"eventBoard"+File.separator;
		
		try{
			naverFile.transferTo(new File(storePath+"image."+fileExtension));
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		String event_content=request.getParameter("event_content");
		logger.info("event_content: "+event_content);*/
		
		//-------------------------------------------------------
		eventBoardWriteNumber(eventBoard);
		
		eventBoard.setRead_count(0);
		eventBoard.setEvent_progress("진행");
		
	/*	MultipartFile upFile=request.getFile("file");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis())+"_"+fileName;
		long fileSize=upFile.getSize();*/
		
/*		logger.info("fileName:"+fileName);
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
		}*/
		
		//3. DB에 insert
		int check=eventBoardDao.boardInsert(eventBoard);
		logger.info("writeOk check:"+check);
		
		//check와 pageNumber를 writeOk.jsp로 넘겨주기
		String pageNumber=request.getParameter("pageNumber");
		
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("eventboard/writeOk");		
		
	}

	/**
	 * @name : eventBoardWriteNumber
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : 작성하는 게시물의 group_number, sequence_number, sequence_level을 답글과 부모글을 구분지어 정의한다.
	 */
	public void eventBoardWriteNumber(EventBoardDto eventBoard){
		int event_code=eventBoard.getEvent_code();
		int group_number=eventBoard.getGroup_number();
		int sequence_number=eventBoard.getSequence_number();
		int sequence_level=eventBoard.getSequence_level();
		
		logger.info("event_code:" + event_code);
		logger.info("group_number:"+ group_number);
		logger.info("sequence_number:"+sequence_number);
		logger.info("sequence_level:"+sequence_level);
		
		//이전부터 안됐음.
		int max=0;
		if(event_code==0){
			//root 그룹넘버가 바껴야함.
			max=eventBoardDao.boardGroupNumberMax();
			if(max!=0){
				max=max+1;
			}else{
				max=eventBoard.getGroup_number();
			}
			logger.info("max:"+max);
			
			group_number=max;
			sequence_number=eventBoard.getSequence_number();
			sequence_level=eventBoard.getSequence_level();
		}else{
			//답글 sequenceNumber와 level이 수정되야함.
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("group_number", group_number);
			hMap.put("sequence_number", sequence_number);
			hMap.put("sequence_level", sequence_level);
			
			eventBoardDao.boardGroupNumberUpdate(hMap);
			sequence_number=sequence_number+1;
			sequence_level=sequence_level+1;
		}
		
		eventBoard.setGroup_number(group_number);
		eventBoard.setSequence_number(sequence_number);
		eventBoard.setSequence_level(sequence_level);
	}
	
	/**
	 * @name : eventList
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : DB로부터 EventBoardDto들을 List형태로 가져와 jsp페이지로 이동한다.
	 */
	@Override
	public void eventList(ModelAndView mav) {
		// TODO Auto-generated method stub
		logger.info("eventList 넘어옴");
		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
	
	
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);	
		
		int boardSize=10;
		
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=eventBoardDao.boardCount();		//총 게시물 수
		
		//logger.info("list boardSize:"+boardSize);
		//logger.info("list currentPage:"+currentPage);		
		//logger.info("list count:"+count);
		
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
	
	/**
	 * @name : eventRead
	 * @date : 2015. 6. 22.
	 * @author : JeongSuhyun
	 * @description : event_code에 해당하는 EventBoardDto데이터를 DB로부터 가져와 jsp페이지로 이동한다.
	 */
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
	
	/**
	 * @name : eventDelete
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : event_code와 pageNumber를 가지고 jsp페이지로 이동한다.
	 */
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
	
	/**
	 * @name : eventDeleteOk
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : event_code에 해당하는 파일을 서버와 DB에서 삭제 후 jsp페이지로 이동한다. 
	 */
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
		
		
		//삭제하려는 이벤트에 이미 응모한 글이 존재하면 무결성때문에 삭제되지 않는다.
		//응모한 글을 먼저 삭제 후 삭제해야 한다.
		int firstCheck=eventBoardDao.eventManagerCount(event_code);
		int secondCheck=0;
		int check=0;
		if(firstCheck>0) secondCheck=eventBoardDao.eventEnterAllDel(event_code);
		logger.info("eventDeleteOk firstCheck: "+firstCheck);
		
		if(firstCheck==0||secondCheck>0){
			check=eventBoardDao.boardDelete(event_code);
			logger.info("check: "+check);
		}		
		
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("eventboard/deleteOk");		
		
	}

	/**
	 * @name : eventUpdate
	 * @date : 2015. 6. 23.
	 * @author : JeongSuhyun
	 * @description : event_code에 해당하는 EventBoardDto를 DB로부터 가져와 jsp페이지로 이동한다.
	 */
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

	/**
	 * @name : eventUpdateOk
	 * @date : 2015. 6. 24.
	 * @author : JeongSuhyun
	 * @description : update.jsp로부터 새로 입력받은 데이터들을 가져와 DB를 업데이트한 후 jsp페이지로 이동한다.
	 */
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
			
		/*	MultipartFile upFile=request.getFile("file");
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
			*/
			
			int check=eventBoardDao.boardUpdate(eventBoard);
			logger.info("updateOk check: "+check);
			
			//check, pageNumber, boardNumber를 updateOk.jsp에 넘겨준다.
			mav.addObject("check",check);
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("event_code",eventBoard.getEvent_code());
			
			mav.setViewName("eventboard/updateOk");
		
	}

	/**
	 * @name : eventJoin
	 * @date : 2015. 6. 25.
	 * @author : JeongSuhyun
	 * @description : 현재 세션에 등록되어있는 id회원의 포인트를 DB로부터 가져와서 jsp페이지로 이동한다.
	 */
	@Override
	public void eventJoin(ModelAndView mav) {
		//root+"/eventBoard/join.do?event_code="+event_code+"&pageNumber="+pageNumber+"&id="+id+"&event_point="+event_point+"&form="+form		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		String pageNumber=request.getParameter("pageNumber");
		String id=request.getParameter("id");		
		int event_point=Integer.parseInt(request.getParameter("event_point"));//이벤트참여를 위해 차감될 포인트
		//Form form=Form.valueOf(request.getParameter("form"));
		
		//logger.info("form: "+form);		
		logger.info("id: "+id);
		
		int point=eventBoardDao.getPoint(id);			//회원이 보유하고 있는 포인트
		logger.info("eventJoin point: "+point);
		
		mav.addObject("event_code",event_code);	
		mav.addObject("point",point);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("event_point",event_point);
		//mav.addObject("form",form);
		
		mav.setViewName("eventboard/join");		
	}

	/**
	 * @name : eventEnter
	 * @date : 2015. 6. 26.
	 * @author : JeongSuhyun
	 * @description : 넘겨받은 데이터를 mav에 담에 enter.jsp로 이동한다.
	 */
	@Override
	public void eventEnter(ModelAndView mav) {
		//root+"/eventBoard/enter.do?event_code="+event_code+"&pageNumber="+pageNumber
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		String pageNumber=request.getParameter("pageNumber");
		int event_point=Integer.parseInt(request.getParameter("event_point"));
		
		mav.addObject("event_code",event_code);	
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("event_point",event_point);
		
		mav.setViewName("eventboard/enter");	
		
	}

	/**
	 * @name : eventEnterOk
	 * @date : 2015. 6. 28.
	 * @author : JeongSuhyun
	 * @description : enter.jsp에서 입력받은 데이터를 바탕으로 이미 응모한 적이 있는 아이디인지 조사 후 insert한다.
	 */
	@Override
	public void eventEnterOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		logger.info("eventEnterOk service까지 넘어왔지롱");
		
		Map<String,Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		EventMemberDto eventMember=(EventMemberDto)map.get("eventMember");
/*		event_code
		id
		join_title
		join_writer
		join_content
		join_fileName
		file


		pageNumber
		event_point
		afterPoint*/
	/*	
		logger.info("event_code: "+eventMember.getEvent_code());
		logger.info("id: "+eventMember.getId());
		logger.info("join_title: "+eventMember.getJoin_title());
		logger.info("join_writer: "+eventMember.getJoin_writer());
		logger.info("join_content: "+eventMember.getJoin_content());
		logger.info("join_filePath: "+eventMember.getJoin_filePath());
		
		logger.info("pageNumber: "+request.getParameter("pageNumber"));
		logger.info("event_point: "+request.getParameter("event_point"));
		logger.info("afterPoint: "+request.getParameter("afterPoint"));
		*/
		
		String pageNumber=request.getParameter("pageNumber");
		int event_point=Integer.parseInt(request.getParameter("event_point"));
		int afterPoint=Integer.parseInt(request.getParameter("afterPoint"));
		int event_code=eventMember.getEvent_code();
	/*	
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
				eventMember.setJoin_filePath(file.getAbsolutePath());
				eventMember.setJoin_fileName(fileName);
				eventMember.setJoin_fileSize(fileSize);		
				
				logger.info("filePath: "+eventMember.getJoin_filePath());
				logger.info("fileName: "+eventMember.getJoin_fileName());
				logger.info("fileSize: "+eventMember.getJoin_fileSize());
				
			}catch(Exception e){
				logger.info("EventBoardServiceImpl eventEnterOk 파일 입출력 에러");
				e.printStackTrace();
			}
		}
		*/
		//3. DB에 insert
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("id", eventMember.getId());
		hMap.put("event_point", event_point);
		hMap.put("afterPoint", afterPoint);
		hMap.put("event_code", event_code);
		
		//---------------------------------------------------------------
		//event테이블에서 이미 응모한 적이 있는 아이디인지 확인해야한다.
		int firstCheck=eventBoardDao.joinWriteCheck(hMap);
		logger.info("eventEnterOk firstCheck: "+firstCheck);
		
		//---------------------------------------------------------------
		int check=0;
		
		if(firstCheck==0){		//event테이블에 해당 아이디 레코드가 하나도 없으면 event테이블에 insert
			check=eventBoardDao.joinWrite(eventMember);
			logger.info("joinWrite check: "+check);
		}	
		
		if(check>0) check=eventBoardDao.pointWrite(hMap);
		logger.info("pointWrite check: "+check);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("firstCheck",firstCheck);
		
		mav.setViewName("eventboard/enterOk");	
		
	}

	/**
	 * @name : eventManagerList
	 * @date : 2015. 6. 30.
	 * @author : JeongSuhyun
	 * @description : DB로부터 EventMemberDto들을 List형태로 가져와 jsp페이지로 이동한다.
	 */
	@Override
	public void eventManagerList(ModelAndView mav) {
		//root+"/eventBoard/managerList.do?event_code="+event_code+"&group_number="+group_number+"&sequence_number="+sequence_number
		//+"&sequence_level="+sequence_level+"&pageNumber="+pageNumber;
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		int group_number=Integer.parseInt(request.getParameter("group_number"));
		int sequence_number=Integer.parseInt(request.getParameter("sequence_number"));
		int sequence_level=Integer.parseInt(request.getParameter("sequence_level"));
		String pageNumber=request.getParameter("pageNumber");	//이벤트 게시물의 페이지넘버(되돌아갈 페이지 넘버)
		
		//-----------------------------------------------------------
		EventBoardDto eventBoard=eventBoardDao.boardRead(event_code);
		String event_period=eventBoard.getEvent_period();		
		
		//-----------------------------------------------------------
		
		String eventPageNumber=request.getParameter("eventPageNumber");	
		if(eventPageNumber==null) eventPageNumber="1";
		//운영자만 볼 수 있는 이벤트 응모글들 페이지 넘버
		logger.info("===================================EventBoardServiceImpl eventManagerList: "+eventPageNumber);
		
		int boardSize=10;
		
		int currentPage=Integer.parseInt(eventPageNumber);	
		
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=eventBoardDao.eventManagerCount(event_code);	//해당이벤트에 응모한 글의 개수
		logger.info("eventManagerList count: "+count);
		logger.info("eventManagerList event_code: "+event_code);
		logger.info("eventManagerList startRow: "+startRow);
		logger.info("eventManagerList endRow: "+endRow);
		
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("event_code", event_code);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		
		List<EventMemberDto> list=eventBoardDao.eventManagerList(hMap);		
		logger.info("eventManagerList listSize: "+list.size());
				
		for(int i=0;i<list.size();i++){
			if(list.get(i).getJoin_fileSize()!=0){
				logger.info("list["+i+"] filfPath: "+list.get(i).getJoin_filePath());
				logger.info(list.get(i).getJoin_filePath().substring(dir.length()+1));
				list.get(i).setJoin_filePath(list.get(i).getJoin_filePath().substring(dir.length()+1));	
				logger.info("list["+i+"] filfPath: "+list.get(i).getJoin_filePath());
			}
		}

		mav.addObject("event_period",event_period);
		mav.addObject("event_code",event_code);
		mav.addObject("group_number",group_number);
		mav.addObject("sequence_number",sequence_number);
		mav.addObject("sequence_level",sequence_level);
		mav.addObject("boardSize",boardSize);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("eventPageNumber", eventPageNumber);
		mav.addObject("count", count);
		mav.addObject("list", list);
		
		mav.setViewName("eventboard/managerList");
		
	}

	/**
	 * @name : eventManagerRead
	 * @date : 2015. 6. 30.
	 * @author : JeongSuhyun
	 * @description : join_code에 해당하는 EventMemberDto데이터를 DB로부터 가져와 jsp페이지로 이동한다.
	 */
	@Override
	public void eventManagerRead(ModelAndView mav) {
		//${root }/eventBoard/managerRead.do?join_code=${eventMember.join_code }&eventPageNumber=${eventPageNumber}&event_code=${eventMember.event_code}&pageNumber=${pageNumber}
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int join_code=Integer.parseInt(request.getParameter("join_code"));
		String eventPageNumber=request.getParameter("eventPageNumber");
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		int group_number=Integer.parseInt(request.getParameter("group_number"));
		int sequence_number=Integer.parseInt(request.getParameter("sequence_number"));
		int sequence_level=Integer.parseInt(request.getParameter("sequence_level"));
		String pageNumber=request.getParameter("pageNumber");
		
		logger.info(join_code+"/"+eventPageNumber+"/"+event_code+"/"+pageNumber);
		
		EventMemberDto eventMember=eventBoardDao.eventManagerRead(join_code);
		logger.info("eventManagerRead eventMember: "+eventMember);
		
		if(eventMember.getJoin_fileSize()!=0) eventMember.setJoin_filePath(eventMember.getJoin_filePath().substring(dir.length()+1));
				
		mav.addObject("event_code", event_code);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("join_code", join_code);
		mav.addObject("eventPageNumber", eventPageNumber);
		mav.addObject("eventMember", eventMember);
		mav.addObject("group_number",group_number);
		mav.addObject("sequence_number",sequence_number);
		mav.addObject("sequence_level",sequence_level);
		
		mav.setViewName("eventboard/managerRead");
		
	}

	/**
	 * @name : eventManagerDel
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : 넘겨받은 데이터를 가지고 jsp페이지로 이동한다.
	 */
	@Override
	public void eventManagerDel(ModelAndView mav) {
		//root+"/eventBoard/managerDel.do?join_code="+join_code+"&event_code="+event_code+"&eventPageNumber="+eventPageNumber+"&pageNumber="+pageNumber;
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		int join_code=Integer.parseInt(request.getParameter("join_code"));
		String eventPageNumber=request.getParameter("eventPageNumber");
		String pageNumber=request.getParameter("pageNumber");
		int group_number=Integer.parseInt(request.getParameter("group_number"));
		int sequence_number=Integer.parseInt(request.getParameter("sequence_number"));
		int sequence_level=Integer.parseInt(request.getParameter("sequence_level"));
		
		mav.addObject("event_code",event_code);
		mav.addObject("join_code",join_code);
		mav.addObject("eventPageNumber",eventPageNumber);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("group_number",group_number);
		mav.addObject("sequence_number",sequence_number);
		mav.addObject("sequence_level",sequence_level);
		
		mav.setViewName("eventboard/managerDel");
		
	}

	/**
	 * @name : eventManagerDelOk
	 * @date : 2015. 7. 01.
	 * @author : JeongSuhyun
	 * @description : join_code에 해당하는 레코드를 event테이블에서 삭제 후 jsp페이지로 이동한다.
	 */
	@Override
	public void eventManagerDelOk(ModelAndView mav) {
		// event_code, join_code, eventPageNumber, pageNumber 를 form으로 받음
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int event_code=Integer.parseInt(request.getParameter("event_code"));
		int join_code=Integer.parseInt(request.getParameter("join_code"));
		String eventPageNumber=request.getParameter("eventPageNumber");
		String pageNumber=request.getParameter("pageNumber");
		int group_number=Integer.parseInt(request.getParameter("group_number"));
		int sequence_number=Integer.parseInt(request.getParameter("sequence_number"));
		int sequence_level=Integer.parseInt(request.getParameter("sequence_level"));
		
		//파일이 있는 경우 서버에서도 파일 삭제
		//파일이 있나 보려면 먼저 join_code에 해당하는 레코드 가져와야겠다.
		EventMemberDto eventMember=eventBoardDao.eventManagerRead(join_code);
		if(eventMember.getJoin_fileSize()!=0){
			File oldFile=new File(eventMember.getJoin_filePath());
			if(oldFile.exists()&&oldFile.isFile()) oldFile.delete();
		}		
		
		//DB에서 레코드 삭제
		int check=eventBoardDao.eventManagerDel(join_code);
		logger.info("eventManagerDelOk check: "+check);
		
		mav.addObject("check", check);
		mav.addObject("event_code",event_code);
		mav.addObject("join_code", join_code);
		mav.addObject("eventPageNumber",eventPageNumber);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("group_number",group_number);
		mav.addObject("sequence_number",sequence_number);
		mav.addObject("sequence_level",sequence_level);
		
		mav.setViewName("eventboard/managerDelOk");
		
	}

	
}
