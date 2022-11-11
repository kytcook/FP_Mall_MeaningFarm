<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	out.print("request.getContextPath():"+request.getContextPath());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../../resources/common/common.jsp" %>
<title>에러페이지</title>
<style type="text/css">
*:focus { outline:none; }
body {
	font-family: 'Noto Sans KR';
}
.header-background-area > img {
    position: absolute;
    z-index: -5;
    display: block;
    top: 0;
    width: 1900px;
    align: center;
    object-fit:cover; 
}

#main-title {
    width: 100%;
    height: 278px;
    font-size: 60px;
    font-family: 'Jal_Onuel';
    color: #ffffff;
    text-align: center;
    position: absolute;
	top: 100px;
    line-height: 4.7;
    z-index: -2;
}

.frame {

	width:1440px;
	height:auto;
	margin:0 auto;
}

h4 {
	font-size:20px;
	text-align:center;
	margin-top:20px;
	margin-bottom: 50px;
	font-weight:400;
	color:#333;
	
}

.tab {
	list-style: none;
	margin: 50px auto 0;
	padding: 0;
	overflow: hidden;
	width:624px;
}

#tabcontent {
	display: block;
	padding: 6px 12px;
}

.tabmenu {
	float: left;
	display: inline-block;
	color: #333;
	text-align: center;
	text-decoration: none;
	font-size: 17px;
	width: 208px;
	height: 64px;
	line-height: 64px;
	cursor:pointer;
}

.tabcontent {
	margin : 100px auto 140px;
	width:624px;
	height : auto;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f4f4f4;
}

.content-body {
	margin:48px auto;
	width: 416px;
	height : auto;
}




.form-head {
	color:#333;
	font-size: 14px;
	font-weight: 400;
	margin-bottom: 8px;
	display: flex;
}
.form-head2 {
	margin-top:1.5em;
}
.form-id {
	float: left;
}
.required {
	color:#ff5442;
}

.form-elem {
	color:#333;
	border: 0;
	border-radius: 3px;
	height: 46px;
	width: 370px;
	padding-right: 44px;
	text-indent: 1.25rem;
	font-size: .875rem;
}
.codeelem {
	margin-top: 20px;
}


.form-noti {
	color: #333;
	font-size: .75rem;
	letter-spacing: -.025em;
	display: none; 
	float:left;
}
.submit-btn{
	margin: 0 auto;
	display: block;
	text-align: center;
	margin-top: 30px;
	color:#fff;
	width: 150px;
	height: 46px;
	border: 0;
	border-radius: 3px;
	background-color: #176719;
	font-weight: 700;
    font-size: 1.125rem;
    line-height: 2.5;
    cursor: pointer;
}
.nonclick-btn {
	background-color: #aaa;
}
.submit-btn:hover {
	background-color: #567c32;
}
</style>
</head>
<body>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
	<main>
   		<div id="main-title">에러페이지</div>
   		<div class="frame" >
	   		<div class="tabcontent">
				<h4>${ msg }</h4>
				<a  class="submit-btn"  href="#" onclick="back()">돌아가기</a>
			</div>
		</div>
	</main>
	
	<!-- 
	수업시간에 한 것
		<h1 align="center"><%= msg %></h1>
		<div align="center">
			<button onclick="history.back()">이전페이지</button>
			<button onclick="location.href='/common/errorPage.jsp'">홈으로 돌아가기</button>
		</div>
	
	 -->
	
<!-- ########## footer 시작 ##########-->
<%@ include file="../../../resources/layout/footer.jsp" %>
<!-- ########## footer 끝 ##########-->
</body>
<script>
	function back() {
		history.back();
	}
</script>
</html>










