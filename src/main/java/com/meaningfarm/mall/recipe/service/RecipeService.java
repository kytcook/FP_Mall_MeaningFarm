package com.meaningfarm.mall.recipe.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vo.Criteria;
import com.vo.RecipeVO;
import com.vo.SearchCriteria;

public interface RecipeService {
   //게시물 작성
   public void write(RecipeVO recipeVO, MultipartHttpServletRequest mpRequest) throws Exception;
   //게시물 목록
   public List<RecipeVO> list() throws Exception;

   // 게시글 조회
   public RecipeVO read(int recipe_no) throws Exception;
   // 게시글 수정
   public void modify (RecipeVO recipeVO) throws Exception;
   // 게시글 삭제
   public void delete(int recipe_no) throws Exception;
   
   //게시글 좋아요
   public void recommend(int recipe_no) throws Exception;

   //게시물 총 갯수
   public int listCount(SearchCriteria scri) throws Exception;

   //게시물 목록 + 페이징
   public List<RecipeVO> listPage(SearchCriteria scri) throws Exception;

   // 검색 결과 갯수
   //public int countSearch(SearchCriteria scri) throws Exception;
   
   
}