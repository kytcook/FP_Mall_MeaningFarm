<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
	상대경로를 가져오기 위한 jstl
	 ${pageContext.request.contextPath} 이 코드를 path로 줄여준다.
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다 미닝팜입니다.</title>
    <!-- jquery.js --> 
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <!-- bootstrap.css 추가하기 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- 맨 위로 버튼.css -->
	<link href="${path}/css/static/moveTopButton.css" rel="stylesheet" type="text/css"/>
	<!-- 맨 위로 버튼.html -->
	<a id="MOVE_TOP_BTN" href="#" class="btn btn-warning">TOP</a>
	<!-- 맨 위로 버튼.js -->
	<link href="${path}/resources/js/moveTopButton.js" rel="stylesheet" type="text/javascript" /> 
	<script src="${path}/resources/js/moveTopButton.js" type="text/javascript"></script>
</head>

