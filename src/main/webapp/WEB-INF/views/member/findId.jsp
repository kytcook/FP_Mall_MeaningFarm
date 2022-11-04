<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/user/login.css"> 

<title>아이디 찾기 폼</title>
<%@ include file="../../../common/common.jsp" %>

<style type="text/css">

*:focus { outline:none; }
body {
	font-family: 'Noto Sans KR';
}

.idcheckform {
	/* margin-left:10%; */
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

.tab-content {
	display: none;
}
.tab-content.current{
	display: inherit;
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
	background-color: #176719;
	font-weight: 700;
    font-size: 1.125rem;
    line-height: 1.5;
}
.submit-btn:hover {
	background-color: #567c32;
}


#msg {
    height: 30px;
    text-align:center;
    font-size:16px;
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

<!-- ########## [[ 아이디 찾기 폼 시작 ]] ########## -->


<main>
 	<div class="container  ">
  
    <div class="pb-3 py-12 text-center">
      <br><br><h1 class="pb-5  main-title"><b>아이디 찾기</b></h1>
    
    
		<div class="frame idcheckform">
				<div class="tabcontent">
					<h3><b>회원 정보를 입력해주세요.</b></h3>
					<div class="content-body">
						<form action="findId" method="post" onsubmit="return findId(this);">
							<div class="form-head">
								이름&nbsp;
								<span class="required">*</span>&nbsp;&nbsp;
							</div>
							<div class="form-body">
								<input name="m_name" id="findm_name" class="form-elem m_nameelem" type="text" maxlength="20" placeholder="한글 2자 이상 입력">
							</div>
							<div class="form-head">
								전화번호&nbsp;
								<span class="required">*</span>&nbsp;&nbsp;
							</div>
							<div class="form-body">
								<input name="m_phone" id="findm_phone" class="form-elem m_phoneelem" type="text" maxlength="20" placeholder="한글 2자 이상 입력">
							</div>
							<div class="form-head form-head2">
								이메일&nbsp;
								<span class="required">*</span>&nbsp;&nbsp;
							</div>
							<div class="form-body">
								<input name="m_email" id="findm_email"class="form-elem m_emailelem" type="text" maxlength="50" placeholder="meaningfarm@naver.com">
							</div>
							<!-- 메시지 -->
					        <div id="msg">
							    <c:if test="${not empty param.msg}">
								<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>            
							    </c:if>        
							</div>							
							<!-- 메시지 -->
							<button class="submit-btn" type="submit">아이디 찾기</button>
						</form>
					</div>
				</div>
		</div>
		</div>
		</div>
	</main>

<!-- ########## [[ 아이디 찾기 폼 끝 ]] ########## -->



   <!-- ########## footer start ##########-->
	<%@ include file="../../../layout/footer.jsp" %>
   <!-- ########## footer end ##########-->
    
</body>
<script>

		function findId(fi) {
			let msg ='';
			if (fi.m_name.value == "") {
				alert("이름을 입력해 주세요.", fi_m_id);
				fi.m_name.focus();
				return;
			}
			if (fi.m_phone.value == "") {
				alert("핸드폰번호를 입력해 주세요.");
				fi.m_phone.focus();
				return;
			}
			if (fi.m_email.value == "") {
				alert("이메일 입력해 주세요.");
				fi.m_email.focus();
				return;
			}
			
			var m_name =$("#findm_name").val();
			var m_phone =$("#findm_Phone").val();
			var m_email =$("#findm_email").val();
			
			var sendData="m_name="+m_name+'&m_phone='+m_phone+'&m_email='+m_email;
			
		$.ajax({
			url : "http://localhost/mall/member/findId",
			method : "post",
			data : sendData,
			dataType : "text",
			success : function(text) {
				if (text != null) {
					$("#msg").html("아이디 = "+text);
				} else {
					$("#msg").html("해당정보가 없습니다.");
				}
			},
			error : function(xhr) {
				alert("에러코드 = " + xhr.status);
			}
		});
	}
	
	
	/* 메시지 */
        function setMessage(msg, element){
            document.getElementById("msg").innerHTML = ` ${'${msg}'}`;

            if(element) {
                element.select();
            }
       }

</script>

</html>