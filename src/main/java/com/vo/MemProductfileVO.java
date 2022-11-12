package com.vo;

import lombok.Data;

@Data
public class MemProductfileVO {

	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 상품 id */
	private int product_no;	
	
}
