<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 폼</title>
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
	font-size: 20x;
	font-weight: 400;
	margin-bottom: 8px;
	display: flex;
}
.form-head2 {
	margin-top:1.5em;
}
.form-id {
	float: left;
	margin-top:10px;
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
	/* margin-top:.75rem; */
	margin-top:10px;
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
	background-color: #176719;
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

<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->

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
							<br>
							<div class="form-head form-head2">
								이메일&nbsp;
								<span class="required">*</span>&nbsp;&nbsp;
							</div>
							<div class="form-body">
								<input name="m_email" id="findm_email"class="form-elem m_emailelem" type="text" maxlength="50" placeholder="meaningfarm@naver.com">
							</div>
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
	<%@ include file="../../../resources/layout/footer.jsp" %>
   <!-- ########## footer end ##########-->
    
</body>
<script>
$(function() {
	$('.submit-btn').click(function() {
		var rtn = true;
		var m_name = $(".m_nameelem");
		var m_email = $(".m_emailelem");
		$.ajax({
			url : "dupfindId",
			data : { "m_name" : m_name.val(), "m_email" : m_email.val() },
			async: false,
			success : function(result) {
				if(m_name.val() == "") {
					alert("이름을 입력해주세요")
					rtn = false;
				}else if(m_email.val() == ""){
					alert("이메일을 입력해주세요")
					rtn = false;
				}else if(result == 0){
					alert("이름 또는 이메일이 일치하지 않습니다. 다시 입력해주세요.");
					rtn = false;
				}
			},
			error : function() {
				console.log("전송실패");
			}
		});
		return rtn;
	});
});


</script>

</html>