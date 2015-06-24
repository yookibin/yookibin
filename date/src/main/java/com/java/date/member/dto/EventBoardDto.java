package com.java.date.member.dto;

public class EventBoardDto {
	private int event_code;
	private String event_period;
	private String event_title;
	private String event_content;
	private String writer;
	private int read_count;
	private String event_fileName;
	private long event_fileSize;
	private String event_filePath;
	
	public int getEvent_code() {
		return event_code;
	}
	public void setEvent_code(int event_code) {
		this.event_code = event_code;
	}
	public String getEvent_period() {
		return event_period;
	}
	public void setEvent_period(String event_period) {
		this.event_period = event_period;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public String getEvent_fileName() {
		return event_fileName;
	}
	public void setEvent_fileName(String event_fileName) {
		this.event_fileName = event_fileName;
	}
	public long getEvent_fileSize() {
		return event_fileSize;
	}
	public void setEvent_fileSize(long event_fileSize) {
		this.event_fileSize = event_fileSize;
	}
	public String getEvent_filePath() {
		return event_filePath;
	}
	public void setEvent_filePath(String event_filePath) {
		this.event_filePath = event_filePath;
	}	
	
}
