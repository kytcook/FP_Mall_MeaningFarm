package com.meaningfarm.mall.recipe.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vo.Criteria;
import com.vo.RecipeVO;

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



}