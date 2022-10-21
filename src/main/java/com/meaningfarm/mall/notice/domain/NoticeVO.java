package com.meaningfarm.mall.notice.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class NoticeVO {
	
	
	 private int NOTICE_NO;
	 private String NOTICE_TITLE;
	 private String NOTICE_CONTENT;
	 private Date NOTICE_REGDATE;
	 private int NOTICE_HIT;
	 private String NOTICE_YN;
	 private String ADMIN_NAME;
}
