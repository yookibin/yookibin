package com.java.date.member.dto;

/**
 * @name : EventMemberDto
 * @date : 2015. 6. 25.
 * @author : JeongSuhyun
 * @description : event테이블의 필드와 같은 이름의 변수들을 생성. get함수와 set함수를 통해 데이터 값을 가져오고 변경한다.
 */
public class EventMemberDto {
	private int join_code;
	private int event_code;
	private String id;
	private String join_title;
	private String join_writer;
	private String join_content;
	private String join_fileName;
	private long join_fileSize;
	private String join_filePath;
	
	public int getJoin_code() {
		return join_code;
	}
	public void setJoin_code(int join_code) {
		this.join_code = join_code;
	}
	public int getEvent_code() {
		return event_code;
	}
	public void setEvent_code(int event_code) {
		this.event_code = event_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJoin_title() {
		return join_title;
	}
	public void setJoin_title(String join_title) {
		this.join_title = join_title;
	}
	public String getJoin_writer() {
		return join_writer;
	}
	public void setJoin_writer(String join_writer) {
		this.join_writer = join_writer;
	}
	public String getJoin_content() {
		return join_content;
	}
	public void setJoin_content(String join_content) {
		this.join_content = join_content;
	}
	public String getJoin_fileName() {
		return join_fileName;
	}
	public void setJoin_fileName(String join_fileName) {
		this.join_fileName = join_fileName;
	}
	public long getJoin_fileSize() {
		return join_fileSize;
	}
	public void setJoin_fileSize(long join_fileSize) {
		this.join_fileSize = join_fileSize;
	}
	public String getJoin_filePath() {
		return join_filePath;
	}
	public void setJoin_filePath(String join_filePath) {
		this.join_filePath = join_filePath;
	}	
	
}
