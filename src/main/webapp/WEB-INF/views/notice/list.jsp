<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- forEach와 c:out를 쓰려면 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  fmt날짜 포맷을 써주려면 -->
<!DOCTYPE html>
<html lang="en">

  <head>
    <title></title>
<style type="text/css">
.scontainer {
	float: left;
	margin-top:  -40px;
	margin-left: 150px;
	margin-bottom: 50px;
}
#productListContainer {
	width: 70%;
	:A
	margin: 0 auto;
	float: right;
	margin-right: 100px;
	margin-bottom: 50px;
}
#ffooter {
	clear: both;
}
</style>
    <meta charset="UTF-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="css/style.css" rel="stylesheet" />
<!-- 
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
-->
  </head>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<%@include file="../../../resources/layout/sidebar.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->

<br>
<br>
<br>
<br>
<br>
<!-- 바디시작 -->
  <body>
    <div class="container row">
      <div class="page-hearder col-md-offset-3" style="padding-bottom: 30px">
        <h1>공지사항</h1>
      </div>
      
 <!-- 검색창 시작 -->
   <div class="col-md-9 col-md-offset-4 search">
    <select name="searchType" >
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>
	

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
    <button id="searchBtn"  class="btn btn-default" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
    
  </div>   
  
 <!--검색창 끝  -->     
      
<!--리스트 뿌려주는곳 시작  -->
      <div class="col-md-9 col-md-offset-4">
       <table class="table table-hover">
		<thead>
			<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>

			</tr>
		</thead>	
			
			<!-- 목록 시작 -->
			  <tbody>
			<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.notice_no}</td>
				<td>
				<%-- <a href="/notice/read?notice_no=${list.notice_no}"><c:out value="${list.notice_title}" /></a> --%>
				<a href="/mall/notice/read?notice_no=${list.notice_no}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.notice_title}" /></a>
				</td>
				<td>${list.admin_name}</td>
				<td>${list.notice_regdate}</td>
			<%-- 	<td>${list.notice_yn}</td> --%>
				<td>${list.notice_hit}</td>
			</tr>
			</c:forEach>
			<!-- 목록 끝 -->
			</tbody>
		</table>

      </div>

      <div class="btn-group col-md-offset-12">
        <a href="#" id="writeBtn" class="btn btn-md btn-default">글쓰기</a>
      </div>


	<!--페이지네이션 부분  -->
	
	<div class='col-md-offset-6'>
	  <ul class="pagination">
	    <c:if test="${pageMaker.prev}">
	    	<li >
	    	<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
	    	</li>
	    </c:if> 
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li >
	    	<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
	    	</li>
	    </c:forEach>
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li>
	    	<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
	    	</li>
	    </c:if> 
	  </ul>
	</div>
	
    <!--페이지네이션 부분끝  -->
    
 
       </div>
<br>
<br>
<br>
<br>
<br>
<!-- ########## 푸터 시작 ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## 푸터 끝 ########## -->
<!-------------------------------------- 스크립트------------------------->
<script type="text/javascript">
    document.getElementById("writeBtn").onclick = function () {
    	console.log("글쓰기폼으로 이동");
        location.href = 'writeForm';
    };
</script>


  </body>
</html>
