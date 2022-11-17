<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/user/findidresult.css">
<title>ID 찾기 - 결과</title>
<style type="text/css">

*:focus { outline:none; }
body {
	font-family: 'Noto Sans KR';
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
	width:1440px;
	height:auto;
	margin:0 auto;
}

h4 {
	font-size:20px;
	text-align:center;
	margin-top:100px;
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
	font-size: 20px;
	width: 208px;
	height: 64px;
	line-height: 64px;
	cursor:pointer;
}

.tabcontent {
	margin : 40px auto 140px;
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
	text-align: center;
}
.content-body p {
	font-size: 18px;
	line-height: 2.0;
}
.content-body span {
	font-size: 24px;
}

.btn-frame {
	width: 100%;
	height: inherit;
	margin-top: 50px;
}
.btn-frame a {
	display: inline-block;
	width: 40%;
	height: 40px;
	background-color: #567c32;
	line-height: 40px;
	color: #fff;
	font-size: 16px;
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

.re_pwd {
	margin-top:.75rem;
}
.form-noti {
	color: #333;
	font-size: .75rem;
	letter-spacing: -.025em;
	display: none; 
	float:left;
}

.submit-btn {
	margin-top: 50px;
	color:#fff;
	width: 100%;
	height: 46px;
	border: 0;
	border-radius: 3px;
	background-color: #567c32;
	font-weight: 700;
    font-size: 1.125rem;
    line-height: 1.5;
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


<!-- ########## [[ 아이디 찾기 시작 ]] ########## -->
	<main>
		<div id="main-title">아이디 찾기</div>
		<div class="frame">
			<h4><b>${m_name}</b>님의 아이디 조회 결과</h4>
			<div class="tabcontent">
				<div class="content-body">
					<p>회원님의 아이디는</p>
					<p><span><b>${m_id }</b></span>&nbsp입니다.</p>
					<div class ="btn-frame">
						<a href="login">로그인</a>
						<a href="findPw">비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	
<!-- ########## [[ 아이디 찾기 끝 ]] ########## -->	
	
   <!-- ########## footer start ##########-->
	<%@ include file="../../../resources/layout/footer.jsp" %>
   <!-- ########## footer end ##########-->
</body>
</html>