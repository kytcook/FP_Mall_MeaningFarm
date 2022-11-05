package com.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
public class QnaReplyVO {
	
	private int qnareply_no;
	private int qna_no;
	private String qnareply_content;
	private String qnareply_date;
	private int qnareply_like;
	private String admin_name;
	
	public int getQnareply_no() {
		return qnareply_no;
	}
	public void setQnareply_no(int qnareply_no) {
		this.qnareply_no = qnareply_no;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQnareply_content() {
		return qnareply_content;
	}
	public void setQnareply_content(String qnareply_content) {
		this.qnareply_content = qnareply_content;
	}
	public String getQnareply_date() {
		return qnareply_date;
	}
	public void setQnareply_date(String qnareply_date) {
		this.qnareply_date = qnareply_date;
	}
	public int getQnareply_like() {
		return qnareply_like;
	}
	public void setQnareply_like(int qnareply_like) {
		this.qnareply_like = qnareply_like;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

}
