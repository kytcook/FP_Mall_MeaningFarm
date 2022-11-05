package com.meaningfarm.mall.recipe.service;

import java.util.List;

import com.vo.RecipeReplyVO;

public interface ReplyService {

	//댓글 조회 
	public List<RecipeReplyVO> readReply(int recipe_no) throws Exception;

	//댓글 작성
	public void writeReply(RecipeReplyVO rrVO) throws Exception;
}
