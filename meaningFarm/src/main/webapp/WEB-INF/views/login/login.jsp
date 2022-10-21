<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="../../../common/common.jsp" %>
<style>

</style>

</head>
<body>

<!-- ########## 헤더 시작 ########## -->
<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/nav.jsp" %>
<!-- ########## 헤더 끝 ########## -->

<!-- ########## 로그인폼 시작 ########## -->
	<div class="container">
  
    <div class="py-5 text-center">
      <h1 class="pb-3 border-bottom"><b>로그인</b></h1>
    </div>

      
      <div class="col-md-7 col-lg-8">
      
<div class="section" id="loginDiv">
	<h2>로그인</h2>
	<div id="loginCenter">
		<form method="post" action="loginOk">
			<input type="text" name="userid" placeholder="아이디를 입력해주세요" id="idInput"/><br/>
			<input type="password" name="userpwd" placeholder="비밀번호를 입력해주세요" id="pwdInput"/><br/>
			<input type="submit" value="로그인" id="loginBtn"/>
			<div id="logStatus">

<!-- ########## 로그인폼 끝 ########## -->

   <!-- ########## footer start ##########-->
	<%@ include file="../../../layout/footer.jsp" %>
    <!-- footer end -->
</body>
</html>