<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MY RECIPE </title>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
  rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
  integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
  integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
  crossorigin="anonymous"></script>
</head>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
<body>
  <div id="contents-wrapper" class="recipe_detail">
    <div class="xans-element- xans-product xans-product-additional detail_input">
      <div class="detail">
        <h1>MY RECIPE 수정페이지</h1>
        <div class="sort-wrap">
          <ul class="list_type1">
            <li>
              <span class="ico"></span>
              <p class="txt">MY RECIPE 게시판입니다</p>
            </li>
            <li>
              <span class="ico"></span>
              <p class="txt">구매 제품으로 나만의 레시피를 만들어 보세요 :)</p>
            </li>
          </ul>
          <!-- 제목과 게시판설명 -->
        </div>
        <hr >
        <form  method="post" id="writeForm" role="form" action="recipe_modify">
          <input type="hidden" name="recipe_no" value="${modify.recipe_no}" readonly="readonly"/>
          <input type="text" id ="recipe_title" name="recipe_title" value="${modify.recipe_title}" class="form-control mt-4 mb-2" >
          <input type="text" id ="m_id" name="m_id" value="${modify.m_id}" class="form-control mt-4 mb-2"
          placeholder="작성자" required
          >
          <div class="form-group">
            <textarea class="form-control" rows="10" name="recipe_content" id="recipe_content"
             required> <c:out value="${modify.recipe_content}"/></textarea>
          </div>
          
      <input type="text" id ="recipe_pwd" name="recipe_pwd" value="${modify.recipe_pwd}" class="form-control mt-4 mb-2" >
         

          <hr>

          <button type="submit" class="cancel_btn btn-success m-3" style="float:right">취소</button>
          <button type="submit" class="update_btn btn-success m-3" style="float:right">저장</button>
        </form>

      </div>
    </div>

  </div>
</body>

<style>
  body * {
  font-family: 'Noto Sans';
  font-weight: 400;
  letter-spacing: 0;
  }

  hr{
    background-color: #225f2a;
    height:3px;
  }

</style>

</html>