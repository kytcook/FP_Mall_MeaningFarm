package com.vo;

import lombok.ToString;

@ToString
public class QnaVO {

	private int qna_no = 0;
	private String qna_title;
	private String qna_content;
	private String qna_regdate;
	private String qna_state; //답변완료 n,y로 구분
	private String m_id;
	private String qna_pw; // 문의분류여부로 쓸것임.
	private int qna_like; //221031 좋아요 추가
	private int rnum=0;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(String qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public String getQna_state() {
		return qna_state;
	}
	public void setQna_state(String qna_state) {
		this.qna_state = qna_state;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getQna_pw() {
		return qna_pw;
	}
	public void setQna_pw(String qna_pw) {
		this.qna_pw = qna_pw;
	}
	public int getQna_like() {
		return qna_like;
	}
	public void setQna_like(int qna_like) {
		this.qna_like = qna_like;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
}
