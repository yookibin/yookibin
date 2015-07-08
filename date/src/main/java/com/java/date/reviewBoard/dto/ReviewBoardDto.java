package com.java.date.reviewBoard.dto;

import java.util.Date;

public class ReviewBoardDto {
	private int review_code;
	private String place_code;
	private String review_id;
	private String review_content;
	private Date review_date;
	private int review_star;
	
	public int getReview_code() {
		return review_code;
	}
	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}
	public String getPlace_code() {
		return place_code;
	}
	public void setPlace_code(String place_code) {
		this.place_code = place_code;
	}
	
	public String getReview_id() {
		return review_id;
	}
	
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	
	public String getReview_content() {
		return review_content;
	}
	
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public Date getReview_date() {
		return review_date;
	}
	
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	
}
