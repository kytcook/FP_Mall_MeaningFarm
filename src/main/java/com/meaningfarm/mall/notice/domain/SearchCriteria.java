package com.meaningfarm.mall.notice.domain;

public class SearchCriteria extends Criteria{ //크리테리아 상속

   private String searchType ="";
   private String keyword = "";
   
   //게터세터
   public String getSearchType() {
    return searchType;
   }
   
   public void setSearchType(String searchType) {
    this.searchType = searchType;
   }
   
   public String getKeyword() {
    return keyword;
   }
   
   public void setKeyword(String keyword) {
    this.keyword = keyword;
   }
   
   @Override
   public String toString() {
    return super.toString() + " SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
   }
}
