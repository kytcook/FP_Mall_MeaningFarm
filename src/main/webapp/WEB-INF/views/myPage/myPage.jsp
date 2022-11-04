<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼 페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<%@ include file="../../../common/common.jsp" %>
<style type="text/css">

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

#left-login-bt {
	width: 100%;
	height: 40px;
	margin-top: 20px;
	background-color:#1dc0a1;
	color: #fff;
	border:0;
	font-size: 16px;
	font-weight: 600;
	cursor:pointer;
}


#msg {
    height: 30px;
    text-align:center;
    font-size:18px;
    color:red;
    margin-bottom: 20px;
}
</style>

</head>
<body>

<!-- ########## 헤더 시작 ########## -->
<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/nav.jsp" %>
<!-- ########## 헤더 끝 ########## -->

<!-- ########## [[ 로그인폼 시작 ]] ########## -->
 	<div class="container ">
  
    <div class="pb-3 py-12 text-center">
      <h1 class="pb-5 border-bottom main-title"><b>로그인</b></h1>
    </div>
      
		<div class="frame">
			<div class="height-fixed">
			<div class="color-frame">
				<h2>일반회원 로그인</h2> <br>
		    	<div id="msg">
				 	<c:if test="${not empty msg}">
                  		<p class="text mb-5" style="color:red; font-size:20px;">
    					 <i class="fa fa-exclamation-circle me-2"></i>${URLDecoder.decode(msg)}         	    
	                 	</p>
				    </c:if>
			    </div>
				<div class="left-inner-box">
	
				<!--
					<form id="login-form" "name="login" action="/mall/meaningfarm.jsp" method="POST"> 
					<form id="login-form" "name="login" action="/mall/meaningfarm.jsp" method="POST">
				 -->
	
				    <!-- ########## [[ Form 태그 시작 ]] ########## -->
				    <form id="login-form" action="<c:url value='/member/login'/>" method="post" onsubmit="return">
						<div class="input-box"> 
							<input id="m_id" type="text" name="m_id" placeholder="아이디"> 
							<label for="m_id">아이디</label> 
						</div> 
						<div class="input-box"> 
							<input id="m_pw" type="password" name="m_pw" placeholder="비밀번호"> 
							<label for="m_pw">비밀번호</label> 
						</div> 
						<!-- id="loginBtn"  -->
						<input type="submit" id="left-login-bt" name="login" value="로그인"> 
						
						
						<!-- 이전 URL 정보 심어주기 -->
						<%--  <input type="text" name="toURL" value="${param.toURL}"> --%>
						<!-- csrf 보안을 위한 코드 -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="login-bottom-area">
							<!-- <div class="auto-login">
								<input id = "remember_me" name ="remember-me" type = "checkbox"/>&nbsp;로그인유지<br>
							</div> -->
							<div class="inline find" style="width:400px; margin-left:-50px;">
							<a class="find-area" href="findIdView.dz">아이디 찾기</a> |
							<a class="find-area" href="findPwView.dz">비밀번호 찾기</a> |
							<a class="find-area" href="/mall/member/join">회원가입</a>
							</div>
							
						</div>
					</form>
					
					
				</div>
			</div>
			</div>

		</div>
	</div>
<!-- ########## [[ 로그인폼 끝 ]] ########## -->



   <!-- ########## footer start ##########-->
	<%@ include file="../../../layout/footer.jsp" %>
   <!-- ########## footer end ##########-->
    
</body>

<script>
/*
 
 $(function() {
    $('#left-login-bt').click(function() {

	function formCheck(frm){
		let mst = '';
		let id = $("#m_id");
		let pw = $("#m_pw");
		
		if(frm.id.value.length==0) {
			setMessage('id를 입력해주세요', frm.id);
			aret("id입력")
			return false;
		} else   if(frm.pwd.value.length==0) {
			setMessage('pw를 입력해주세요', frm.pw);
			return false;
		}
		console.log(id, pw);
		return true;
	};
	
    })
});
 
 */
	$(function() {
		$('#left-login-bt').click(function() {
			let rtn = true;
			let mst = '';
			let m_id = $("#m_id");
			let m_pw = $("#m_pw");
			
			if(m_id.val() == "") {
				setMessage('id를 입력해주세요', m_id);
				//alert("아이디를 입력해주세요");
				return false;
				
			}else if(m_pw.val() == ""){
				setMessage('pw를 입력해주세요', m_pw);
				//alert("비밀번호를 입력해주세요");
				return false;
			} // end of else if
			console.log(data)
			return rtn;
		}); // end of click event
	});//end of function 

	
    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = ` ${'${msg}'}`;

        if(element) {
            element.select();
        }
   }	
 
</script>

</html>