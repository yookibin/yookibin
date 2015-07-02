package com.java.date.member.dto;

import java.util.Date;

public class MemberReplyDto {
	private int reply_num;
	private int board_num;
	private Date reply_time;
	private String reply_content;
	private String reply_writer;
	
	public String getReply_writer() {
		return reply_writer;
	}
	
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	
	
}
