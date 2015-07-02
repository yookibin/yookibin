package com.java.date.reply.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.java.date.member.dto.MemberReplyDto;
import com.java.date.reply.dao.ReplyDao;

@Component
public class ReplyServiceImpl implements ReplyService {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	ReplyDao replyDao;

	@Override
	public void reply(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		response.setCharacterEncoding("utf-8");
		MemberReplyDto memberReply=(MemberReplyDto)map.get("memberReply");
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		logger.info("board_num:"+ board_num);
		
		logger.info(memberReply.getReply_content());
		
		//해당 board_num의 reply들을 가져오기.
		int count=replyDao.replyCount(board_num);
		logger.info("댓글개수"+count);
		
		//reply 가져오기.
		/*if(count>0){
			List<MemberReplyDto> memberReplyList=replyDao.replyList(board_num);
			
			logger.info("사이즈:"+memberReplyList.size());
			mav.addObject("memberReplyList", memberReplyList);
		}	*/
		
		if(memberReply.getReply_content()!=null){
			// 댓글 db에 넣기.
			memberReply.setReply_time(new Date());
			//지금 살짝바꿈 원래 replyDao.replyInsert 걍 void형태였음. 지금 한번 다시해보고 안되면 삭제해야함 if절까지.
			int check=replyDao.replyInsert(memberReply);
			
			if(check>0){
				int reply_bunho=replyDao.replyBunho();
				System.out.println("bunho:"+reply_bunho);
				String str=reply_bunho+","+memberReply.getReply_content()+","+memberReply.getReply_writer()+","+memberReply.getReply_time();
				//간단한건 굳이 json이나 xml을 이용할 필요 없이 걍 ,기준으로 0번지 1번지 나누면 된다.
				
				response.setContentType("application/html;charset=utf-8");
				PrintWriter out;
				try {
					out = response.getWriter();
					out.print(str);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				mav.addObject("memberReply", memberReply);
			}
		}
	}


	@Override
	public void replyDelete(ModelAndView mav) {
		Map<String, Object>map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		int reply_num=Integer.parseInt(request.getParameter("reply_num"));
		//System.out.println("dd"+reply_num);
		logger.info("replyDelete-reply_num:"+reply_num);
		
		int check=replyDao.replyDelete(reply_num);
		
		if(check>0){
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print(reply_num);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	@Override
	public void replyUpdate(ModelAndView mav) {
		Map<String, Object>map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		int reply_num=Integer.parseInt(request.getParameter("reply_num"));
		logger.info("replyUpdate-reply_num:"+reply_num);
		
		MemberReplyDto memberReply=replyDao.selectReply(reply_num);
		logger.info("memberReplyDto:"+memberReply);
		// 댓글 수정 전 값 그대로 뿌려주기.
		
		if(memberReply!=null){
			
			String str=memberReply.getReply_num()+","+memberReply.getReply_content()+","+memberReply.getReply_writer()+","+memberReply.getReply_time();
			//간단한건 굳이 json이나 xml을 이용할 필요 없이 걍 ,기준으로 0번지 1번지 나누면 된다.
			
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print(str);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			mav.addObject("memberReply", memberReply);
		}
	}


	@Override
	public void updateReply(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		int reply_num=Integer.parseInt(request.getParameter("reply_num"));
		String reply_content=request.getParameter("reply_content");
		
		int check=replyDao.updateReply(reply_num, reply_content);
		
		if(check>0){
			String str=reply_num+","+reply_content;
			response.setContentType("application/html;charset=utf-8");
			
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print(str);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
	}
	
}

