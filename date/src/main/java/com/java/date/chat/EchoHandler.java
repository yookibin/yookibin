package com.java.date.chat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List; 

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.java.date.chat.dao.ChatDao;
 
public class EchoHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatDao chatDao;
	
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    private HashMap<Object,String> hMap=new HashMap<Object,String>();
    private HashMap<Object,String> hMap2=new HashMap<Object,String>();   
    
   /*
    *  클라이언트 연결 이후에 실행되는 메소드
    */ 
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception{
    	logger.info("=========================afterConnectionEstablished왔다");
    	sessionList.add(session);
    	logger.info("{} conntected", session.getId());
    	logger.info("sessionListSize: "+sessionList.size());
    	
    }
    
    /*
     *  클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
     */    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{    	
    	logger.info("From {}, recieved Message : {} ", session.getId(), message.getPayload());
    	String messages=message.getPayload().split("/")[0];
    	String firstCheck=message.getPayload().split("/")[1];    	
    	logger.info("messages: "+messages);
    	
    	String roomNum=messages.split(",")[0];
    	String chatId=messages.split(",")[1];
    	String realMessage=messages.split(",")[2];
    	logger.info("roomNum: "+roomNum);    	
    	
    	int roomEnterSize=0;
    	
    	if(firstCheck.equals("0")){    
    		
    		hMap.put(session.getRemoteAddress(), chatId);
    		hMap2.put(session.getRemoteAddress(), roomNum);
       
        	logger.info("hMap size: "+hMap.size());
        	logger.info("hMap2 size: "+hMap2.size());        	
        	
        	for(WebSocketSession sess: sessionList){
        		if(hMap2.get(sess.getRemoteAddress()).equals(roomNum)){
        			roomEnterSize++;
        		}
        	}
        	logger.info("roomNumber :"+roomNum+" roomEnterSize: "+roomEnterSize);
        	
        	
    		// 연결되어있는 모든 클라이언트들에게 메시지를 전송한다
        	for(WebSocketSession sess: sessionList){     
        		//logger.info("sess roomNum: "+hMap2.get(sess.getRemoteAddress()));
        		if(hMap2.get(sess.getRemoteAddress()).equals(roomNum)){
        			sess.sendMessage(new TextMessage(chatId+realMessage+"\r\n,"+roomEnterSize));   
        		}
        	}     
        	
    	}else if(firstCheck.equals("1")){        
    		
    		Date date=new Date();
        	SimpleDateFormat sdf=new SimpleDateFormat("hh:mm");
        	String hour=sdf.format(date);   
        	
        	for(WebSocketSession sess: sessionList){
        		if(hMap2.get(sess.getRemoteAddress()).equals(roomNum)){
        			roomEnterSize++;
        		}
        	}
        	logger.info("roomNumber :"+roomNum+" roomEnterSize: "+roomEnterSize);
    		
    		// 연결되어있는 모든 클라이언트들에게 메시지를 전송한다
        	for(WebSocketSession sess: sessionList){  
        		if(hMap2.get(sess.getRemoteAddress()).equals(roomNum)){
        			sess.sendMessage(new TextMessage(chatId+" : "+realMessage+"\t\t"+hour+"\r\n,"+roomEnterSize));
        		}
        	}   
    	}    	 	
    }
    
    /*
     *  클라이언트가 연결을 끊었을 때 실행되는 메소드 
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
    	sessionList.remove(session);
    	logger.info("session ip: "+session.getRemoteAddress());
    	String roomNum=hMap2.get(session.getRemoteAddress());    	
    	
    	// 연결되어있는 모든 클라이언트들에게 메시지를 전송한다
    	for(WebSocketSession sess: sessionList){ 
    		if(hMap2.get(sess.getRemoteAddress()).equals(roomNum)){
    			sess.sendMessage(new TextMessage(hMap.get(session.getRemoteAddress())+"님이 나가셨습니다.\r\n,"+sessionList.size()));
    		}
    	}     	
    	
    	hMap.remove(session.getRemoteAddress());
    	hMap2.remove(session.getRemoteAddress());
    	logger.info("hMap size: "+hMap.size());   
    	logger.info("hMap2 size: "+hMap2.size());   
    	
    	logger.info("{} Connection Closed", session.getId());
    	
    	int roomEnterSize=0;
    	
    	for(WebSocketSession sess: sessionList){
    		if(hMap2.get(sess.getRemoteAddress()).equals(roomNum)){
    			roomEnterSize++;
    		}
    	}
    	logger.info("roomNumber :"+roomNum+" roomEnterSize: "+roomEnterSize);
    	
    	if(roomEnterSize==0){
    		//DB에서 방을 삭제한다.
    		int check=chatDao.deleteRoom(roomNum);
    		logger.info("check: "+check);
    	}
    	
    }    
    
}














