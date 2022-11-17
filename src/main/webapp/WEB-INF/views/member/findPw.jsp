<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
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
	font-size: 17px;
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
}

.underline {
	width: auto;
	height: auto;
	border-bottom: 5px solid #fff;
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
.submit-btn, .code-submit-btn {
	margin-top: 30px;
	color:#fff;
	width: 100%;
	height: 46px;
	border: 0;
	border-radius: 3px;
	background-color: #567c32;
	font-weight: 700;
    font-size: 1.125rem;
    line-height: 1.5;
    cursor: pointer;
}
.nonclick-btn {
	background-color: #aaa;
}
.submit-btn:hover {
	background-color: #176719;
}
</style>


</head>
<body>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->

<!-- ########## [[ 비밀번호 찾기 폼 끝 ]] ########## -->
	
	<main>
		<div id="main-title">비밀번호 찾기</div>
		<div class="frame">
			<h4>아이디, 이메일을 입력하세요</h4>
			<div class="tabcontent">
				<div class="underline">
					<div class="content-body">
						<form action="sendEmail" method="post">
							<c:if test="${ !empty m_id }">
								<div class="form-head">
									아이디&nbsp;
									<span class="required">*</span>&nbsp;&nbsp;
								</div>
								<div class="form-body">
									<input name="m_id" class="form-elem idelem" type="text" maxlength="20" placeholder="영문소문자, 숫자 포함 6~20자" value="${m_id}">
								</div>
								<div class="form-head form-head2">
									이메일&nbsp;
									<span class="required">*</span>&nbsp;&nbsp;
								</div>
								<div class="form-body">
									<input name="m_email" class="form-elem emailelem" type="text" maxlength="50" placeholder="meaning@naver.com" value="${m_email}">
								</div>
							</c:if>
							<c:if test="${ empty m_id }">
								<div class="form-head">
									아이디&nbsp;
									<span class="required">*</span>&nbsp;&nbsp;
								</div>
								<div class="form-body">
									<input name="m_id" class="form-elem idelem" type="text" maxlength="20" placeholder="영문소문자, 숫자 포함 6~20자">
								</div>
								<div class="form-head form-head2">
									이메일&nbsp;
									<span class="required">*</span>&nbsp;&nbsp;
								</div>
								<div class="form-body">
									<input name="m_email" class="form-elem emailelem" type="text" maxlength="50" placeholder="meaning@naver.com">
								</div>
							</c:if>
								<button class="submit-btn" type="submit">인증코드 보내기</button>
						</form>
					</div>
				</div>
					<c:if test="${ !empty randomCode }">
						<form action="resetPw" method="post">
							<div class="content-body">
								<input name="userCode" class="form-elem codeelem" type="text" maxlength="50" placeholder="인증 코드 입력">
								<input type="hidden" class="check-code" value="${ randomCode }">
								<input type="hidden" class="m_id" name="m_id" value="${ m_id }">
								<input type="hidden" class="m_email" name="m_email" value="${ m_email }">
								<button class="code-submit-btn click-submit-btn" type="submit">새 비밀번호 입력</button>
							</div>
						</form>
					</c:if>
					<c:if test="${ empty randomCode }">
						<div class="content-body">
							<input name="userCode" class="form-elem codeelem" type="text" maxlength="50" placeholder="인증 코드 입력" readonly>
							<button class="code-submit-btn nonclick-btn" type="submit">새 비밀번호 입력</button>
						</div>
					</c:if>
				</div>
		</div>
	</main>
<!-- ########## [[ 비밀번호 찾기 폼 끝 ]] ########## -->
	
   <!-- ########## footer start ##########-->
	<%@ include file="../../../resources/layout/footer.jsp" %>
   <!-- ########## footer end ##########-->
</body>
<script>
	$(function() {
		$('.submit-btn').click(function() {
			var rtn = true;
			var m_id = $(".idelem");
			var m_email = $(".emailelem");
			
			$.ajax({
				url : "dupfindPw",
				data : { "m_id" : m_id.val(), "m_email" : m_email.val() },
				async: false,
				success : function(result) {
					if(m_id.val() == "") {
						alert("아이디를 입력해주세요")
						rtn = false;
					}else if(m_email.val() == ""){
						alert("이메일을 입력해주세요")
						rtn = false;
					}else if(result == 0){
						alert("아이디 또는 이메일이 일치하지 않습니다. 다시 입력해주세요.");
						rtn = false;
					}else {
						alert("인증코드를 발송하였습니다. 이메일을 확인해주세요.");
						rtn = true;
					}
				},
				error : function() {
					console.log("전송실패");
				}
			});
			return rtn;
		});
		$('.click-submit-btn').click(function() {
			var checkCode = $(".check-code");
			var inputCode = $(".codeelem");
			if(inputCode.val() =="") {
				alert("코드를 입력해주세요")
				return false;
			}else if(checkCode.val() != inputCode.val()) {
				alert("코드가 불일치합니다. 다시 입력해주세요.")
				return false;
			}
		});
	});
</script>
</html>