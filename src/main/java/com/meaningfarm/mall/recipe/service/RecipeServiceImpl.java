package com.meaningfarm.mall.recipe.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.meaningfarm.mall.recipe.dao.RecipeDao;
import com.vo.Criteria;
import com.vo.RecipeVO;
import com.vo.SearchCriteria;

@Service
public class RecipeServiceImpl implements RecipeService {
   

   
   @Inject
   private RecipeDao dao;

   //글쓰기
   @Override
   public void write(RecipeVO recipeVO) throws Exception {
      // TODO Auto-generated method stub
      dao.write(recipeVO);
      
   }

   //글목록
   @Override
   public List<RecipeVO> list( ) throws Exception {
      return dao.list();
   }
   

   //게시글 조회
   @Transactional(isolation = Isolation.READ_COMMITTED)
   @Override
   public RecipeVO read(int recipe_no) throws Exception {
      // TODO Auto-generated method stub
         dao.hit(recipe_no);
      return dao.read(recipe_no);
   }
   //게시글 수정
   @Override
   public void modify(RecipeVO recipeVO) throws Exception {
      // TODO Auto-generated method stub
      dao.modify(recipeVO);
   }
   //게시글 삭제
   @Override
   public void delete(int recipe_no) throws Exception {
      // TODO Auto-generated method stub
      dao.delete(recipe_no);
   }

   //게시글 좋아요
   @Override
   public void recommend(int recipe_no) throws Exception {
      // TODO Auto-generated method stub
      dao.recommend(recipe_no);
   }
   
   // 게시물 총 갯수
   @Override
   public int listCount() throws Exception {
      // TODO Auto-generated method stub
      return dao.listCount();
   }   

   //게시물 목록 + 페이징
   @Override
   public List<RecipeVO> listPage(Criteria cri) throws Exception {
      // TODO Auto-generated method stub
      return dao.listPage(cri);
   }

   // 검색 결과 갯수
   //@Override
   //public int countSearch(SearchCriteria scri) throws Exception {
      // TODO Auto-generated method stub
   //   return dao.countSearch(scri);
   //}

   

   

}