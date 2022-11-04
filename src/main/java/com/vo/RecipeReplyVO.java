package com.vo;

public class RecipeReplyVO {
	private int recipe_re_no = 0;
	private int recipe_no =0;
	private String recipe_re_content="";
	private String recipe_re_pwd="";
	private String recipe_re_date="";
	private String m_id="";
	
	
	public int getRecipe_re_no() {
		return recipe_re_no;
	}
	public void setRecipe_re_no(int recipe_re_no) {
		this.recipe_re_no = recipe_re_no;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getRecipe_re_content() {
		return recipe_re_content;
	}
	public void setRecipe_re_content(String recipe_re_content) {
		this.recipe_re_content = recipe_re_content;
	}
	public String getRecipe_re_pwd() {
		return recipe_re_pwd;
	}
	public void setRecipe_re_pwd(String recipe_re_pwd) {
		this.recipe_re_pwd = recipe_re_pwd;
	}
	public String getRecipe_re_date() {
		return recipe_re_date;
	}
	public void setRecipe_re_date(String recipe_re_date) {
		this.recipe_re_date = recipe_re_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "RecipeReplyVO [recipe_no" + recipe_no + ", recipe_re_no=" + recipe_re_no + 
				               ",recipe_re_content=" + recipe_re_content + ", m_id=" + m_id +
				               ", recipe_re_date=" + recipe_re_date  +"]" ;
	}
}
