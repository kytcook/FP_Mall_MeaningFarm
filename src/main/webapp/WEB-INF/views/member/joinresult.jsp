<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료창</title>
<%@ include file="../../../resources/common/common.jsp" %>

<style type="text/css">

.result {
	margin-left:30%;
}
   
#main-title {
    width: 100%;
    height: 278px;
    font-size: 60px;
    font-family: 'Jal_Onuel';
    color: #ffffff;
    text-align: center;
    position: absolute;
	top: 101px;
    line-height: 4.7;
    z-index: -2;
}
.frame {
	width:1258px;
	height:inherit;
	margin:0 auto;
	/* background-color:yellow; */
	margin-left: 400px;
	
}
.height-fixed {
	width: 100%;
	height: 520px;
	margin-top: 100px;
	margin-bottom: 100px;
}
.left-login {
	width:700px;
	height: 100%;
	display:inline-block;
}
.color-frame {
	width: 600px;
	height: 100%;
	margin: auto;
/* 	border:1px solid #fdb504; */
	border:1px solid #50356e;
	display:inline-block;
	float:left;
}
.color-frame.right-frame {
	margin-top: 0px;
}
.color-frame:first-child {
	margin-right: 50px;
}
h2 {
	font-size:38px;
	margin-top:60px;
	text-align:center;
	
}
h4 {
	font-size:20px;
	text-align:center;
	margin-top:30px;
	font-weight:400;
	margin-bottom:50px;
}
.left-inner-box {
	width:300px;
	margin:0 auto;
}
.input-box{ 
	width: 300px;
	height:inherit;
	position:relative; 
	margin:20px auto; 
	display: block;
}
.input-box > input{ 
	background:transparent; 
	border:none; 
	border-bottom: solid 1px #ccc; 
	padding:20px 0px 5px 0px; 
	font-size:14pt; width:100%; 
}
.input-box p {
	text-align: center;
	margin-top: 30px;
	color: #888;
}
input::placeholder{ 
	color:transparent; 
}

input:placeholder-shown + label{ 
	color:#aaa; 
	font-size:14pt; 
	top:15px; 
}
input:focus + label, label{ 
/* 	color:#fdb504;  */
	color:black; 
	font-size:10pt; 
	pointer-events: none; 
	position: absolute; 
	left:0px; top:0px; 
	transition: all 0.2s ease ; 
}
input:focus, input:not(:placeholder-shown){ 
	border-bottom: solid 1px #8aa1a1; 
	outline:none; 
}
.login-bottom-area {
	width: 186px;
	margin: 20px auto 0;
}

/* 자동로그인 */
.auto-login {
	width: 100px;
	float: left;
}
.find-area {
	color: #888;
}
.find-area:last-child {
	margin-left: 10px;
}
.find-area:hover {
	color: #0160ff;
}
.kakao-btn img {
	width:300px;
	height: 45px;
	margin-top: 20px;
	margin-bottom: 200px;
}
#left-login-bt {
	width: 100%;
	height: 40px;
	margin-top: 20px;
	background-color:#568A35;
	color: #fff;
	border:0;
	font-size: 16px;
	font-weight: 600;
	cursor:pointer;
}
</style>
</head>
<body>


<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->

	<div class="container result">
	<br>
		<div class="frame">
			<div class="height-fixed">
			<div class="color-frame"><br><br>
				<h2>회원가입 완료되었습니다.</h2>
				<div class="left-inner-box">
				<br><br><br><br><br><br><br><br>
					<input type="submit" id="left-login-bt" name="login" onclick="location.href='/mall/member/login'" value="로그인으로 이동하기"> 
				</div>
			</div>
			</div>
			</div>
			</div>
			<br><br><br><br><br><br><br><br><br>
   <!-- ########## footer start ##########-->
	<%@ include file="../../../resources/layout/footer.jsp" %>
   <!-- ########## footer end ##########-->
</body>
</html>



