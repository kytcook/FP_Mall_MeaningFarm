package com.meaningfarm.mall.recipe.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vo.Criteria;
import com.vo.RecipeVO;
import com.vo.SearchCriteria;

public interface RecipeDao {
   // 목록조회
   public List<RecipeVO> list() throws Exception;


   //게시글 작성
   public void write(RecipeVO recipeVO) throws Exception;

   //게시글 조회
   public RecipeVO read(int recipe_no) throws Exception;

   //게시글 수정
   public void modify (RecipeVO recipeVO) throws Exception;
   
   // 게시글 삭제
   public void delete (int recipe_no) throws Exception;
   
   //게시글 조회
   public void hit(int recipe_no) throws Exception;

   //게시글 좋아요
   public void recommend(int recipe_no) throws Exception;

   //첨부파일 업로드
   public void insertFile(Map<String,Object> map) throws Exception;

   //게시물 총 갯수
   public int listCount(SearchCriteria scri) throws Exception;

   //게시물 목록 + 페이징
   public List<RecipeVO> listPage(SearchCriteria scri) throws Exception;

   // 검색결과 갯수
   //public int countSearch(SearchCriteria scri) throws Exception;
}