package com.java.date.recommandPlace.dto;

import java.util.Date;

public class LoadCourseDto {
	private int num;
	private String cid;
	private PlaceDto save_cplace1;
	private PlaceDto save_cplace2;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public PlaceDto getSave_cplace1() {
		return save_cplace1;
	}
	public void setSave_cplace1(PlaceDto save_cplace1) {
		this.save_cplace1 = save_cplace1;
	}
	public PlaceDto getSave_cplace2() {
		return save_cplace2;
	}
	public void setSave_cplace2(PlaceDto save_cplace2) {
		this.save_cplace2 = save_cplace2;
	}
	public Date getSave_date() {
		return save_date;
	}
	public void setSave_date(Date save_date) {
		this.save_date = save_date;
	}
	private Date save_date;
}
