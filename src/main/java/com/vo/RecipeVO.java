package com.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecipeVO {
   private int recipe_no =0;
   private String recipe_title ="";
   private String recipe_content ="";
   private String recipe_pwd ="";
   private int recipe_hit =0;
   private int recipe_like =0;
   private String recipe_date="" ;
   private String m_id ="";
   private int rnum =0;
   
   // 글쓰기 받아온거
   //public RecipeVO (String recipe_title, String recipe_content, String recipe_pwd) {
   //   this.recipe_title = recipe_title;
   //   this.recipe_content = recipe_content;
   //   this.recipe_pwd= recipe_pwd;
   //}
   
   public RecipeVO() {
      super();
   }
   
   public RecipeVO (int recipe_no, String recipe_title,
         String recipe_content,String recipe_pwd ,
         int recipe_hit,int recipe_like,String recipe_date,
         String m_id) {
      super();
      this.recipe_no = recipe_no;
      this.recipe_title = recipe_title;
      this.recipe_content = recipe_content;
      this.recipe_pwd = recipe_pwd;
      this.recipe_hit = recipe_hit;
      this.recipe_like = recipe_like;
      this.recipe_date = recipe_date;
      this.m_id = m_id;
   }
   
   
   //상세조회시 = detail
   private String gubun     =null;
   public int getRecipe_no() {
      return recipe_no;
   }
   public void setRecipe_no(int recipe_no) {
      this.recipe_no = recipe_no;
   }
   public String getRecipe_title() {
      return recipe_title;
   }
   public void setRecipe_title(String recipe_title) {
      this.recipe_title = recipe_title;
   }
   public String getRecipe_content() {
      return recipe_content;
   }
   public void setRecipe_content(String recipe_content) {
      this.recipe_content = recipe_content;
   }
   public String getRecipe_pwd() {
      return recipe_pwd;
   }
   public void setRecipe_pwd(String recipe_pwd) {
      this.recipe_pwd = recipe_pwd;
   }
   public int getRecipe_hit() {
      return recipe_hit;
   }
   public void setRecipe_hit(int recipe_hit) {
      this.recipe_hit = recipe_hit;
   }
   
   public int getRecipe_like() {
      return recipe_like;
   }
   public void setRecipe_like(int recipe_like) {
      this.recipe_like = recipe_like;
   }

   public String getRecipe_date() {
      return recipe_date;
   }
   public void setRecipe_date(String recipe_date) {
      this.recipe_date = recipe_date;
   }

   public String getM_id() {
      return m_id;
   }
   public void setM_id(String m_id) {
      this.m_id = m_id;
   }
   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }

      
}