package com.meaningfarm.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { // PageObject의 역할과 같
	
	private int pageNum; // 현재 페이지
	private int amount; // 한 페이지에 표시되는 데이터의 개수 - perPageNum
	
	// 변수 값을 세팅하는 방법 세 가지 - 1.초기화 블록 : {~~}, 2.생성자 : 클래스명(){~~}, setter()
	// 생성자를 이용한 기본 값 세팅을 사용해보자!
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
		
	}
	
	
}
