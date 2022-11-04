package com.meaningfarm.mall.recipe.dao;



import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vo.RecipeVO;

@Service
public class RecipeDaoImpl implements RecipeDao {

   private Logger logger = LoggerFactory.getLogger(RecipeDaoImpl.class);   
   
   private static final String NAMESPACE ="com.mybatis.mapper.recipeMapper";
   @Autowired
   private SqlSessionTemplate sql = null;
   
   /*
    * // 매퍼 private static String namespace = "com.mybatis.mapper.RecipeMapper";
    */

	@Override
	public List<RecipeVO> list() throws Exception {
	   logger.info("daoList 호출 성공");
	   // TODO Auto-generated method stub
	   return sql.selectList("list");
	}
	

	//게시글작성
	@Override
	public void write(RecipeVO recipeVO) throws Exception {
		// TODO Auto-generated method stub
		 sql.insert("write", recipeVO);
	}
	
	//게시글 조회 
	@Override
	public RecipeVO read(int recipe_no) throws Exception {
		return sql.selectOne("read", recipe_no);
	}

	//게시글 수정
	@Override
	public void modify(RecipeVO recipeVO) throws Exception {
		// TODO Auto-generated method stub
		sql.update("modify", recipeVO);
	}
	
	//게시글 삭제
	@Override
	public void delete(int recipe_no) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("delete", recipe_no);
	}
	
	//게시글 조회수
	@Override
	public void hit(int recipe_no) throws Exception {
		// TODO Auto-generated method stub
		sql.update("recipe_hit", recipe_no);
	}
	
	//게시글 추천
	@Override
	public void recommend(int recipe_no) throws Exception {
		// TODO Auto-generated method stub
		sql.update("recommend", recipe_no);
	}
	
	// 첨부파일 업로드

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("insertFile", map);
	}





	
  


}