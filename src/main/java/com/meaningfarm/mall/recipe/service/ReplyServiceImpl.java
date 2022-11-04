package com.meaningfarm.mall.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meaningfarm.mall.recipe.dao.ReplyDao;
import com.vo.RecipeReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDao dao;
	
	//댓글 조회
	@Override
	public List<RecipeReplyVO> readReply(int recipe_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(recipe_no);
	}
	
	//댓글 작성
	@Override
	public void writeReply(RecipeReplyVO rrVO) throws Exception {
		// TODO Auto-generated method stub
		dao.writeReply(rrVO);
	}

}
