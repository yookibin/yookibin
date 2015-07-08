package com.java.date.memberboard.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.member.dto.MemberReplyDto;
import com.java.date.member.dto.RecommendBoardDto;
import com.java.date.memberboard.dao.MemberBoardDao;





@Component
public class MemberBoardServiceImpl implements MemberBoardService {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	//private String dir="C:\\Users\\KOSTA\\date\\date\\src\\main\\webapp\\resources\\board";
	
	@Autowired
	private MemberBoardDao memberBoardDao;
	
	@Override
	public void boardWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String pageNumber=null;
		
		if(request.getParameter("pageNumber")==null){
			pageNumber="1";
		}else if(request.getParameter("pageNumber")!=null){
			pageNumber=request.getParameter("pageNumber");
		}
		logger.info("pageNumber:"+pageNumber);
		
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("memberboard/write");
	}

	@Override
	public void boardWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
	
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		MemberBoardDto memberBoard=(MemberBoardDto)map.get("memberBoard");
		
		String pageNumber=request.getParameter("pageNumber");
		String content=request.getParameter("content");
		String memberLevel=request.getParameter("memberLevel");
		logger.info("writeOk-memberLevel:"+memberLevel);
		logger.info("content:"+content);
		logger.info("memberBoard:"+memberBoard.getBoard_content());
		
		logger.info("memberBoard:"+memberBoard);
		
		memberBoard.setBoard_date(new Date());
		memberBoard.setBoard_count(0);
		memberBoard.setBoard_recom(0);
		
		
		if(memberLevel.equals("AA")){
			memberBoard.setGroupNumber(2);
		}else{
			memberBoard.setGroupNumber(0);
		}
		
		/*MultipartFile upFile=request.getFile("file");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis())+"_"+fileName;
		long fileSize=upFile.getSize();
		
		logger.info("fileName:"+fileName);
		logger.info("timeName:"+timeName);
		logger.info("fileSize:"+fileSize);
		
		if(fileSize!=0){
			try{
				logger.info("dir: "+dir);
				
				File file=new File(dir,timeName);
				upFile.transferTo(file);
				
				memberBoard.setBoard_fileRoot(file.getAbsolutePath());
				memberBoard.setBoard_fileName(fileName);
				memberBoard.setBoard_fileSize(fileSize);
				
			}catch(Exception e){
				logger.info("BoardServiceImpl writeOk 파일 입출력 에러");
				e.printStackTrace();
			}
		}*/
		
		int check=memberBoardDao.insert(memberBoard);
		logger.info("check:"+check);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("memberboard/writeOk");
		      
	}

	@Override
	public void boardList(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=memberBoardDao.getBoardCount();
		logger.info("count"+count);
		
		List<MemberBoardDto> boardList=null;
		List<MemberBoardDto> popularity=null;
		List<MemberBoardDto> TotalList=null;
		MemberBoardDto member=null;
		if(count>0){
			
			int value=memberBoardDao.boardReset();
			// 탑3 인기글가져오기
			 popularity=memberBoardDao.getPopList();
			 logger.info("인기글개수:"+popularity.size());
			for(int i=0; i<popularity.size(); i++){
				member=popularity.get(i);
				
				logger.info("member.setBoardNumber: "+member.getBoard_num());
				
				// 인기글은 그룹넘버에 1을주자.
				int check=memberBoardDao.popGroupNumber(member.getBoard_num());
				logger.info("check: "+check);
				
			}			
			
			// 페이지마다 뿌려줄 게시물 가져오기.
			boardList=memberBoardDao.getBoardList(startRow, endRow);			
			
		}
		
		logger.info("boardList"+boardList.size());
		
		mav.addObject("memberboardList", boardList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		// top 3 
		// mav.addObject("popularity", popularity);
		mav.setViewName("memberboard/list");
		
	}

	@Override
	public void boardRead(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberReplyDto memberReply=(MemberReplyDto)map.get("memberReply");
		
		/*String nickName=request.getParameter("reply_writer");*/
		logger.info("nickName:"+memberReply.getReply_writer());
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String pageNumber=request.getParameter("pageNumber");
		
		
		// 추천에 따른 추천수 증가 .
		// 자바스크립트에서 +1해서 넘겨줌.
		/*if(request.getParameter("board_recom")!=null){
			int board_recom=Integer.parseInt(request.getParameter("board_recom"));
			logger.info("board_recom:"+board_recom);
			
			
			memberBoardDao.recomUpdate(board_num, board_recom);
		}*/
		
			/*int replySize=4;
			int startRow=replySize-4;
			int endRow=(startRow+1)*replySize;
			
			mav.addObject("startRow", startRow);
			mav.addObject("endRow", endRow);*/
		
		// ajax로 보내는거 생각점 해봅세
		/*response.setContentType("application/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		mav.addObject("memberReply", memberReply);*/
		
		
		logger.info("board_num:"+board_num+","+pageNumber);
		
		logger.info(memberReply.getReply_content());
		
		MemberBoardDto memberBoard=memberBoardDao.boardRead(board_num);
		logger.info("memberBoard:"+memberBoard);
		
		/*if(memberBoard.getBoard_fileSize()!=0){
			memberBoard.setBoard_fileRoot(memberBoard.getBoard_fileRoot().substring(dir.length()+1));
		}*/
		
		//해당 board_num의 reply들을 가져오기.
		int count=memberBoardDao.replyCount(board_num);
		logger.info("댓글개수"+count);
		
		
		
		//reply 가져오기.
		if(count>0){
			List<MemberReplyDto> memberReplyList=memberBoardDao.replyList(board_num);
			
			logger.info("사이즈:"+memberReplyList.size());
			mav.addObject("memberReplyList", memberReplyList);
			
		}	
		
		if(memberReply.getReply_content()!=null){
			/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Calendar calendar=Calendar.getInstance();   //자기 자신의 객체를 못 만들어
            int year=calendar.get(Calendar.YEAR);      //Date클래스에서 안되던 2000년이후year이 가능하다.
            int month=calendar.get(Calendar.MONTH)+1;   //그냥 MONTH하면 개월수 반환
            int date=calendar.get(Calendar.DATE);
            //int hour=0;
            
            if (calendar.get(Calendar.AM_PM) == Calendar.PM){
               // Calendar.PM이면 12를 더한다
               hour = calendar.get(Calendar.HOUR)+12;
            }else{
            	hour=calendar.get(Calendar.HOUR);
            }
            int minute = calendar.get(Calendar.MINUTE);
            
            String today=Integer.toString(year)+"-"+Integer.toString(month)+"-"+Integer.toString(date)+" "+Integer.toString(hour)+":"+Integer.toString(minute);
            
            String today=Integer.toString(year)+"-"+Integer.toString(month)+"-"+Integer.toString(date);
            logger.info("today:"+today);

            Date realToday = null;
            
			try {
				realToday=sdf.parse(today);
				logger.info("realToday:"+realToday);
				
				memberReply.setReply_time(realToday);
				logger.info("댓글시간:"+memberReply.getReply_time());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			
			// 댓글 db에 넣기.
			
			
			
			/*memberReply.setReply_time(new Date());
			memberBoardDao.replyInsert(memberReply);*/
			/*mav.addObject("memberReply", memberReply);*/
		}
		
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("memberBoard", memberBoard);
		mav.setViewName("memberboard/read");
	}

	@Override
	public void boardDelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String pageNumber=request.getParameter("pageNumber");
		logger.info("delete --board_num:"+board_num);
		/*mav.addObject("board_num", board_num);*/
		mav.addObject("pageNumber", pageNumber);
		int check=memberBoardDao.deleteBoard(board_num);
	
		mav.addObject("check", check);
		mav.setViewName("memberboard/deleteOk");
		
	}

	@Override
	public void boardSelect(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String pageNumber=request.getParameter("pageNumber");
		logger.info("select--board_num:"+board_num+","+"select--pageNumber:"+pageNumber);
		MemberBoardDto memberBoard=memberBoardDao.selectBoard(board_num);
		
		mav.addObject("memberBoard", memberBoard);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("memberboard/update");
		
	}

	@Override
	public void boardUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberBoardDto memberBoard=(MemberBoardDto)map.get("memberBoard");
		
		int check=memberBoardDao.updateBoard(memberBoard);
		String pageNumber=request.getParameter("pageNumber");
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("memberboard/updateOk");
		
	}

	@Override
	public void recommendBoard(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		RecommendBoardDto recom=(RecommendBoardDto)map.get("recom");
		
		String pageNumber=request.getParameter("pageNumber");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String board_recom=request.getParameter("board_recom");
		String recommend_nickName=request.getParameter("recommend_nickName");
		logger.info("recommendBoard:"+pageNumber+","+board_num+","+board_recom+","+recommend_nickName);
		
		int check=memberBoardDao.selectRecommend(board_num, recommend_nickName);
		logger.info("check:"+check);
		
		//logger.info("띠로리"+recom.getBoard_num()+","+recom.getRecommend_check()+","+recom.getRecommend_code()+","+recom.getRecommend_nickName());
		if(check==0){
			recom.setRecommend_check(1);
			memberBoardDao.insertRecommend(recom);
			memberBoardDao.recomUpdate(board_num);
			
			int boardRecom=memberBoardDao.selectBoardRecom(board_num);
			
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print(boardRecom);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}

