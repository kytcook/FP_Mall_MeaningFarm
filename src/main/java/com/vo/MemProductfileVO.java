package com.vo;

import lombok.Data;

@Data
public class MemProductfileVO {

	/* 상품 id */
	private int productfile_no;
	
	/* 파일 이름 */
	private String productfile_name;
	
	/* 경로 */
	private String productfile_path;
	
	/* uuid */
	private String uuid;
	
	
}
