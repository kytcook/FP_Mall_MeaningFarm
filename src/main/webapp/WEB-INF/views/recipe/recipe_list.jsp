<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- forEach와 c:out를 쓰려면 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!--  fmt날짜 포맷을 써주려면 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MY RECIPE</title>
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
<form action ="recipe_write" method="get">
<body>
  <div id="contents-wrapper" class="recipe_list_board">
    <div class="xans-element- xans-product xans-product-additional detail_board">
      <div class="board">
        <form action="" name="recipeList">
        <h1>MY RECIPE</h1>
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
          
          <div class="sort m-1" style="float: right;">
            <select name="" id="" onchange="">
                <option value="1">최근등록순</option>
                <option value="2">좋아요많은순</option>
                <option value="3">조회많은순</option>
            </select>
          </div>
        <!-- 정렬 -->
          <div class="d-grid gap-2">
            <form class="row gap-2 d-grid justify-content-end" >
              <div class="col-auto" >
                <input type="text" style="width : 50%" class="form-search" name="searchText" value="${param.searchText}" 
                placeholder="검색어를 입력해주세요">
                <button type="search" role="button" class="btn btn-success m-1">검색</button>
              </div>
            </form>
          </div> 
        </div>
        
        <table class="table table-hover table-borderless" width="100%" border="0" cellpadding="0" cellspacing="0">
          <thead>
            <tr>
              <th scope="col" >#</th>
              <th scope="col" >제목</th>
              <th scope="col" >작성자</th>
              <th scope="col" >작성일</th>
              <th scope="col" >조회수</th>
              <th scope="col" >LIKE</th>
            </tr>
          </thead>
          <tbody class="table-content">
          <c:forEach items="${list}" var="list">
	            <tr>
	           	<th scope="row">
		              	<c:out value="${list.rnum}" />
		         </th> 
	              <!--  <th scope="row">
		              	<c:out value="${list.recipe_no}" />
		         </th>-->
	              
	              <td>
	              <a href="./recipe_view?recipe_no=${list.recipe_no}">
	              <c:out value="${list.recipe_title}" />
	              </a></td>
	              <td><c:out value="${list.m_id}" /></td>
	              <td><c:out value="${list.recipe_date}" /></td>
	              <td><c:out value="${list.recipe_hit}" /></td>
	              <td><c:out value="${list.recipe_like}" /></td>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
        </form>
        <p class="btnArea">
          <a class="btn btn-success m-3" type ="submit" role="button" href="recipe_write" style="float: right">
            RECIPE 쓰기
          </a>
        </p>
      </div>

    </div>

  </div>

  <div class="board_pg_area">
    <a href="#" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a>
    <a href="#" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
    <a href="#" class="layout-pagination-button layout-pagination-number __active">1</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">2</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">3</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">4</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">5</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">6</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">7</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">8</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">9</a>
    <a href="#" class="layout-pagination-button layout-pagination-number">10</a>

    <a href="#" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
    <a href="#" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
</div>

</body>
</form>
<!-- ########## footer 시작 ##########-->
<%@ include file="../../../resources/layout/footer.jsp" %>
<!-- ########## footer 끝 ##########-->


<style>
  body * {
  font-family: 'Noto Sans';
  font-weight: 400;
  letter-spacing: 0;
  }

  .d-grid gap-2{
    border-left : 3;
  }

  .table {
  border-top: 2px solid #225f2a;
}

  .btnArea {
    border-top: 2px solid #225f2a;
  }

  .button {
  margin-top: 20px;  
  display: inline-block;
  text-align: center;
  background-color: #2f623a;
  border: 1px solid #293824;
  color: #fff;
  font-size: 13px;
}



.board_pg_area {
  clear: both;
  text-align: center;
  padding-bottom: 15px;
  font-size:0px;
}

.layout-pagination-button:first-child {
  border-left: 1px solid #ddd;
}

.layout-pagination-first-page {
  background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-pagination-first.png);
}

.layout-pagination-first-page, .layout-pagination-prev-page, .layout-pagination-next-page, .layout-pagination-last-page {
  background-repeat: no-repeat;
  background-position: 50% 50%;
  text-indent: -9999px;
}

.layout-pagination-button {
  display: inline-block;
  width: 34px;
  height: 34px;
  border: 1px solid #ddd;
  border-left: 0;
  vertical-align: top;
}

.layout-pagination-prev-page {
  background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-pagination-prev.png);
}


.layout-pagination-number:hover, .layout-pagination-number.__active {
  background-color: #f7f7f7;
  color: #5f0080;
}

.layout-pagination-number {
  font-weight: 700;
  color: #333;
  line-height: 34px;
}

.layout-pagination-next-page {
  background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-pagination-next.png);
}

.layout-pagination-last-page {
  background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-pagination-last.png);
}

.board_pg_area a, .board_pg_area strong{
  font-size:12px;
}

.layout-pagination-number {
  font-weight: 700;
  color: #333;
  line-height: 34px;
}
</style>

</html>