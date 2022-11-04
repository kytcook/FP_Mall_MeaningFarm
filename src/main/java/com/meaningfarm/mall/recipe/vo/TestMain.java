package com.meaningfarm.mall.recipe.vo;

public class TestMain {
	public static void main(String args[]) {
		TestVO tvo = new TestVO();
		tvo.setTest_context("글내용");
		tvo.setTest_no(2);
		tvo.setTest_title("글제목");
		System.out.println(tvo.getTest_context());
	}
}
