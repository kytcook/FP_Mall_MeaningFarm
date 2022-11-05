package com.meaningfarm.mall.recipe.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vo.RecipeReplyVO;


@Repository
public class ReplyDaoImpl implements ReplyDao {

	
	@Inject
	private SqlSession sql;
	
	private static String namespace="com.mybatis.mapper.recipeReplyMapper";
	
	//댓글 조회
	@Override
	public List<RecipeReplyVO> readReply(int recipe_no) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("readReply", recipe_no);
	}
	
	//댓글 작성
	@Override
	public void writeReply(RecipeReplyVO rrVO) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("writeReply", rrVO);
	}

}
