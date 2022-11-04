package com.meaningfarm.mall.recipe.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meaningfarm.mall.recipe.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject 
	private ReplyService service;
	
	
	//댓글 조회
	
	//댓글 작성
	
	//댓글 수정
	
	//댓글 삭제
}
