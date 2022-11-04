package com.meaningfarm.mall.notice.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@AllArgsConstructor
@ToString
@NoArgsConstructor
public class NoticeVO {
	
	
	 private int NOTICE_NO;
	 private String NOTICE_TITLE;
	 private String NOTICE_CONTENT;
	 private String NOTICE_REGDATE;
	 private int NOTICE_HIT;
	 private String NOTICE_YN;
	 private String ADMIN_NAME;
	 
	public int getNOTICE_NO() {
		return NOTICE_NO;
	}
	public void setNOTICE_NO(int nOTICE_NO) {
		NOTICE_NO = nOTICE_NO;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public String getNOTICE_REGDATE() {
		return NOTICE_REGDATE;
	}
	public void setNOTICE_REGDATE(String nOTICE_REGDATE) {
		NOTICE_REGDATE = nOTICE_REGDATE;
	}
	public int getNOTICE_HIT() {
		return NOTICE_HIT;
	}
	public void setNOTICE_HIT(int nOTICE_HIT) {
		NOTICE_HIT = nOTICE_HIT;
	}
	public String getNOTICE_YN() {
		return NOTICE_YN;
	}
	public void setNOTICE_YN(String nOTICE_YN) {
		NOTICE_YN = nOTICE_YN;
	}
	public String getADMIN_NAME() {
		return ADMIN_NAME;
	}
	public void setADMIN_NAME(String aDMIN_NAME) {
		ADMIN_NAME = aDMIN_NAME;
	}
}
