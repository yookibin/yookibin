package com.java.date.memberboard.service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.date.member.dto.MemberBoardDto;
import com.java.date.memberboard.dao.MemberBoardDao;




@Component
public class MemberBoardServiceImpl implements MemberBoardService {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	private String dir="C:\\Users\\KOSTA\\date\\date\\src\\main\\webapp\\resources\\board";
	
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
		/*logger.info(memberBoard.getBoard_content());*/
		
		logger.info("memberBoard:"+memberBoard);
		
		memberBoard.setBoard_date(new Date());
		memberBoard.setBoard_count(0);
		memberBoard.setBoard_recom(0);
		
		
		MultipartFile upFile=request.getFile("file");
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
		}
		
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
		
		int boardSize=3;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=memberBoardDao.getBoardCount();
		logger.info("count"+count);
		
		List<MemberBoardDto> boardList=null;
		if(count>0){
			boardList=memberBoardDao.getBoardList(startRow, endRow);
		}
		
		logger.info("boardList"+boardList.size());
		
		mav.addObject("memberboardList", boardList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.setViewName("memberboard/list");
		
	}

	@Override
	public void boardRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String pageNumber=request.getParameter("pageNumber");
		logger.info("board_num:"+board_num+","+pageNumber);
		
		MemberBoardDto memberBoard=memberBoardDao.boardRead(board_num);
		logger.info("memberBoard:"+memberBoard);
		
		if(memberBoard.getBoard_fileSize()!=0){
			memberBoard.setBoard_fileRoot(memberBoard.getBoard_fileRoot().substring(dir.length()+1));
		}
		
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("memberBoard", memberBoard);
		mav.setViewName("memberboard/read");
	}
}

