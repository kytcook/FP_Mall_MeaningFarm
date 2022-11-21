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

import com.vo.Criteria;
import com.vo.RecipeVO;
import com.vo.SearchCriteria;

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
      
     // logger.info("list 출력되나요?"+list);
      // TODO Auto-generated method stub
      return sql.selectList(NAMESPACE + ".recipelist");
   }
   

   //게시글작성
   @Override
   public void write(RecipeVO recipeVO) throws Exception {
      // TODO Auto-generated method stub
       sql.insert(NAMESPACE +".recipewrite", recipeVO);
   }
   
   //게시글 조회 
   @Override
   public RecipeVO read(int recipe_no) throws Exception {
      return sql.selectOne(NAMESPACE +".reciperead", recipe_no);
   }

   //게시글 수정
   @Override
   public void modify(RecipeVO recipeVO) throws Exception {
      // TODO Auto-generated method stub
      sql.update(NAMESPACE +".recipemodify", recipeVO);
   }
   
   //게시글 삭제
   @Override
   public void delete(int recipe_no) throws Exception {
      // TODO Auto-generated method stub
      sql.delete(NAMESPACE +".recipedelete", recipe_no);
   }
   
   //게시글 조회수
   @Override
   public void hit(int recipe_no) throws Exception {
      // TODO Auto-generated method stub
      sql.update(NAMESPACE +".recipe_hit", recipe_no);
   }
   
   //게시글 추천
   @Override
   public void recommend(int recipe_no) throws Exception {
      // TODO Auto-generated method stub
      sql.update(NAMESPACE +".reciperecommend", recipe_no);
   }
   
   // 첨부파일 업로드

   @Override
   public void insertFile(Map<String, Object> map) throws Exception {
      // TODO Auto-generated method stub
      sql.insert(NAMESPACE +".recipeinsertFile", map);
   }


   //게시물 목록 + 페이징
   @Override
   public List<RecipeVO> listPage(SearchCriteria scri) throws Exception {
      // TODO Auto-generated method stub
      
      return sql.selectList(NAMESPACE + ".recipelistPage", scri);
      
   }

   //게시물 총 갯수
   @Override
   public int listCount(SearchCriteria scri) throws Exception {
      // TODO Auto-generated method stub
      return sql.selectOne(NAMESPACE+".recipelistCount", scri);
   }

   //검색 결과갯수
   //@Override
   //public int countSearch(SearchCriteria scri) throws Exception {
      // TODO Auto-generated method stub
   //   return sql.selectOne(NAMESPACE + ".recipe_countSearch", scri);
   //}





   
  


}