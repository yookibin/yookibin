package com.java.date.member.dto;

/**
 * @name : EventBoardDto
 * @date : 2015. 6. 22.
 * @author : JeongSuhyun
 * @description : event_board테이블의 필드와 같은 이름의 변수들을 생성. get함수와 set함수를 통해 데이터 값을 가져오고 변경한다.
 */
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
	private String event_progress;
	private int event_point;
	private String event_giveaway;
	
	private int group_number;
	private int sequence_number;
	private int sequence_level;
	
	
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
	public String getEvent_progress() {
		return event_progress;
	}
	public void setEvent_progress(String event_progress) {
		this.event_progress = event_progress;
	}
	public int getEvent_point() {
		return event_point;
	}
	public void setEvent_point(int event_point) {
		this.event_point = event_point;
	}
	public String getEvent_giveaway() {
		return event_giveaway;
	}
	public void setEvent_giveaway(String event_giveaway) {
		this.event_giveaway = event_giveaway;
	}
	public int getGroup_number() {
		return group_number;
	}
	public void setGroup_number(int group_number) {
		this.group_number = group_number;
	}
	public int getSequence_number() {
		return sequence_number;
	}
	public void setSequence_number(int sequence_number) {
		this.sequence_number = sequence_number;
	}
	public int getSequence_level() {
		return sequence_level;
	}
	public void setSequence_level(int sequence_level) {
		this.sequence_level = sequence_level;
	}	
}
