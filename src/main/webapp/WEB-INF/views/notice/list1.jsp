<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>kuzuro 게시판</title>


	<!-- 제이쿼리 -->
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<!-- <div id="root"> -->
<div class="container">

	<header>
		<%@include file="../include/header.jsp" %>
	</header>

	<!-- <section id="container"> -->
	<section>
		<h2>글 목록</h2>
		
		<table class="table table-hover">
		<thead>
			<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>

			</tr>
		</thead>	
			<!-- 목록 시작 -->
			<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.NOTICE_NO}</td>
				<td>${list.NOTICE_TITLE}</td>
				<%-- <td><a href="/board/read?bno=${list.bno}">${list.title}</a></td> --%>
				<td>${list.USER_ID}</td>
				<td>${list.NOTICE_REGDATE}</td>
				<td>${list.NOTICE_YN}</td>
				<td>${list.NOTICE_HIT}</td>
		
			</tr>
			</c:forEach>
			<!-- 목록 끝 -->
		</table>

		
		
	</section>
	
	<footer>
		<%@include file="../include/footer.jsp" %>		
	</footer>
</div>
</body>
</html>
