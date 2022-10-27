package com.meaningfarm.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; // 현재 페이지
	private int amount; // 한 페이지에 표시되는 데이터의 개수 - perPageNum
}
