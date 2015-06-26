package com.java.date.member.dto;

import java.util.Date;

/**
 * @name : MemberBoardDto
 * @date : 2015. 6. 23.
 * @author : 유기빈
 * @description : 회원 게시판 DB 
 */
public class MemberBoardDto {
	private int board_num;
	private String board_content;
	private Date board_date;
	private int board_count;
	private String board_title;
	private int board_recom;
	private long board_fileSize;
	private String board_fileName;
	private String board_fileRoot;
	private String board_writer;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public int getBoard_recom() {
		return board_recom;
	}
	public void setBoard_recom(int board_recom) {
		this.board_recom = board_recom;
	}
	public long getBoard_fileSize() {
		return board_fileSize;
	}
	public void setBoard_fileSize(long board_fileSize) {
		this.board_fileSize = board_fileSize;
	}
	public String getBoard_fileName() {
		return board_fileName;
	}
	public void setBoard_fileName(String board_fileName) {
		this.board_fileName = board_fileName;
	}
	public String getBoard_fileRoot() {
		return board_fileRoot;
	}
	public void setBoard_fileRoot(String board_fileRoot) {
		this.board_fileRoot = board_fileRoot;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	
}
