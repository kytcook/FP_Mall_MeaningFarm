package com.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class LikeVO {
	
	
	/*
	 * private int like_no; 
	 * private int board_no;
	 *  private String user_no; 
	 *  private int freeboard_like; 
	 *  private int like_type;
	 */

	private int qnalike_no;
	private int qna_no;
	private String m_id;
	private int qna_like;
	private int likenum;
	
}
