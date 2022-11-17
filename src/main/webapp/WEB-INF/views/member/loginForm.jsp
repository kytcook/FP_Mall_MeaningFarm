<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name ="google-signin-client_id" content="804660487448-0nvqsmf9e6gs38u4m61f5kd5cuvtb994.apps.googleusercontent.com"> -->
<meta name ="google-signin-client_id" content="804660487448-dsdtvcune7f5tigo16j98hrmf64fqfdc.apps.googleusercontent.com">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>로그인 폼 페이지</title>
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
	font-size:20px;
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


/* 구글로그인 */
#GgCustomLogin {
	margin-top: 60px;
	margin-left: -30px;
	
}
.google-login {
	display: inline-block;
	border-radius: 3px;
	border: 1px solid #e3e4e5;
	cursor: pointer;
	height: 40px;
	margin-top: 20px;
	margin-left: 80px;
	z-index: -1;
	opacity: 0%;
}
.fake-glogin {
	width: 300px;
	height: 45px;
	display: block;
	border: 1px solid #e3e4e5;
	border-radius: 5px;
	z-index: 1;
	margin-top: -40px;
	line-height: 45px;
}
.fake-glogin img {
	width: 26px;
	margin: 10px 0 0 8px;
	
}
.fake-glogin p {
	display: block;
	width: 100%;
	height: 20px;
	line-height: 48px;
	text-align: center;
	margin-top: -54px;
	margin-left: 5px;
	font-family: 'Noto Sans KR', sans-serif;
	--letter-spacing: -1.2px;
	font-size: 14px;
	font-weight: 600;
	color: #333;
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
<%@ include file="../../../resources/common/common.jsp" %>
<%@ include file="../../../resources/layout/header.jsp" %>
<%@ include file="../../../resources/layout/nav.jsp" %>
<!-- ########## 헤더 끝 ########## -->

<!-- ########## [[ 로그인폼 시작 ]] ########## -->
 	<div class="container ">
  
    <div class="pb-3 py-12 text-center">
      <h1 class="pb-5 border-bottom main-title"><b>로그인</b></h1>
    </div>
      
		<div class="frame">
			<div class="height-fixed">
			
			
			<div class="color-frame" name="auth_id" value="User">
				<br><br><h2><b>일반회원 로그인</b></h2> <br>
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
							
							<input id="m_id" type="text" name="m_id" placeholder="아이디" > 
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
							<a class="find-area" href="findId">아이디 찾기</a> |
							<a class="find-area" href="findPw">비밀번호 찾기</a> |
							<a class="find-area" href="/mall/member/join">회원가입</a>
							</div>
							
						</div>
					</form>
				</div>
			</div>
			<div class="color-frame right-frame">
				<br><br><h2><b>간편 로그인</b></h2>
				<br><br><h4>일반회원 전용</h4>
				<div class="left-inner-box">
					<div class="input-box"> 
						<a href="javascript:kakaoLogin();">
							<img alt="카카오 회원가입" src="${pageContext.request.contextPath}/resources/img/main/kakaologin-btn.png" >
						</a>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<p id="token-result"></p>
								<ul id="GgCustomLogin">
									<a href="javascript:void(0)">
										<div class="fake-glogin">
										<img alt="구글로그인" src="${pageContext.request.contextPath}/resources/img/main/g-logo.png" style="height:30px;width:30px;margin-top:-10px;">
										<p>구글 로그인</p></div>
									</a>
								</ul>
							<p>판매자는 일반회원 로그인을 이용해주세요.</p>
					</div>
				</div>
				</div>
			</div>

		</div>
	</div>
<!-- ########## [[ 로그인폼 끝 ]] ########## -->



   <!-- ########## footer start ##########-->
<%@ include file="../../../resources/layout/footer.jsp" %>
   <!-- ########## footer end ##########-->
    
</body>

<script>
 
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
 
	/* 카카오 로그인 */
	window.Kakao.init('ac0919ac9d1466243218cd8d0c427416'); //발급받은 키 중 javascript키를 사용해
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
 	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile_nickname, account_email, birthday',
			success: function(response) {
				console.log(response);
				window.Kakao.API.request({ 
					url: '/v2/user/me',//현재 로그인한 사용자 정보 가져오기
					success : result => {
						const kakao_account = result.kakao_account;
						console.log("로그인되었나요?"+kakao_account);
						console.log(result);
					
						var kakaoId = result.id;
		        	    var kakaoNickname = result.properties.nickname;
		        	    
		        	    
		        	    
		        	    
					} //success
				})//window.Kakao.Auth.login({
			} //success
		})//window.Kakao.Auth.login
	}//function
	 
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
	
	
	
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  } 
	
	
	
	//처음 실행하는 함수
	function init() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
			options = new gapi.auth2.SigninOptionsBuilder();
			options.setPrompt('select_account');
	        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
			options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
	        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
	        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
			gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
		})
	}	
	
	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
	    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
			url: 'https://people.googleapis.com/v1/people/me'
	        // key에 자신의 API 키를 넣습니다.
			, data: {personFields:'birthdays', key:'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', 'access_token': access_token}
			, method:'GET'
		})
		.done(function(e){
	        //프로필을 가져온다.
			var profile = googleUser.getBasicProfile();
			console.log(profile)
		})
		.fail(function(e){
			console.log(e);
		})
	}
	function onSignInFailure(t){		
		console.log(t);
	}	
	
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</html>