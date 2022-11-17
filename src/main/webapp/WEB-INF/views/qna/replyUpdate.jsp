<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../resources/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<title>MEANINGFARM-qna상세보기</title>
</head>
<body>


<a href="list">
<h1>문의게시판 상단바</h1>
</a>
	<!---------------------- 헤더시작 -------------------->
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
	<!---------------------- 헤더끝-------------------- -->

	<!--글쓰기 화면 시작  -->
	<div class="container">
		<div class="row">
		 <section id="section">
		<form name="replyUpdate" role="form" method="post">
				<input type="hidden" id="qna_no" name="qna_no" value="${readReply.qna_no}" /> 
				<input type="hidden" id="qeply_no" name="qna_no" value="${readReply.qnareply_no}" /> 
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			<!-- hidden으로 값 넘겨줌 -->
  <p>
    <label for="content">댓글 수정 내용</label>
    <textarea class="form-control" style=" height: 200px" id="qnareply_content" name="qnareply_content" >${readReply.qnareply_content}</textarea>
   </p>
   
   <p>
    <button class ="btn btn-danger" type="submit" id="update_btn">수정</button>
    <button class ="btn btn-secondary" type="button" id="cancel_btn">취소</button>

<!-- ########## [[ 푸터 시작 ]] ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## [[ 푸터 끝 ]] ########## -->    
    <script>
    // 폼을 변수에 저장
    var formObj = $("form[name='replyUpdate']"); 
    
    $("#update_btn").click(function(){  
     	alert('댓글을 수정하시겠습니까?');
    });
    
    // 취소 버튼 클릭
    $("#cancel_btn").click(function(){   
    	alert('이전으로 돌아가시겠습니까?');
     self.location = "/mall/qna/read?qna_no=${readReply.qna_no}"
     + "&page=${scri.page}"
     + "&perPageNum=${scri.perPageNum}"
     + "&searchType=${scri.searchType}"
     + "&keyword=${scri.keyword}";
    });
    </script>
   </p> 
  </form>
 </section>
</div>
</div>
</body>
</html>
