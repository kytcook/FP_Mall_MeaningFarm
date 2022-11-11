<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style type="text/css">
 #reg_btn {
	colors : $indigo-100
 
 }
 
 .sesction {
 	height: 300px;
 }
 
 /* 몰*/
 .regiImg{
		position:absolute;
		left:50px;
		top:40px;
	}
	.regiLink{
		position:absolute;
		width:400px;
		text-align:center;
		top:400px;
	}
	#costomer, #seller{
		height:500px;
		width:400px;
		float:left;
		margin:0 60px;
		text-align:center;
		position:relative;
	}

	div a:active, div a:visited, div a:hover, div a:link {
		color:white;
		font-size:13pt; 
		text-decoration: none;
	}
	#costomerbutton, #sellerbutton{
		width:150px;
		height:50px;
		line-height:50px;
		background-color:#568A35;
		color:#fff;
		margin:auto;
		cursor:pointer;
	}
	#user_type{
		overflow: auto;
		margin-left: 20%;
	}
	.radiusClass{
		border-radius:5px;
		 
	}
</style>
<script>




</script>
</head>
<body>

<!-- ########## 헤더 시작 ########## -->
<%@ include file="../../../resources/layout/header.jsp" %>
<%@ include file="../../../resources/layout/nav.jsp" %>
<!-- ########## 헤더 끝 ########## -->

<!-- ########## 회원가입 폼 시작 ########## -->
<div class="section" >
 <div class="container px-2 py-5" id="featured-3">
     <h1 class="pb-2 border-bottom" style="text-align:center;"><b>회원가입</b></h1>
    <div class="m_title01 cboth" style="text-align:center; margin-bottom:50px; " >
    <h3 style="text-align:center; margin-bottom:50px; ">
	    Meaning Farm에 오신 것을 환영합니다.<br>
	    회원가입 후 다양한 서비스를 이용해보세요.
	</h3>
    </div>
  </div>

	<div id="user_type">
		<div id="costomer">
			<img  src="${pageContext.request.contextPath}/resources/img/member/user.png"  style="height:300px;width:300px" class="regiImg"/>
			<div class="regiLink">
			<div id="costomerbutton"class="radiusClass" >
				<a href="/mall/member/registerForm">일반회원 가입</a>
			</div>
			</div>
		</div>
		<div id="seller">
		<!--	<img src="../../../img/member/dentrepreneur.png" style="height:300px;width:300px" class="regiImg"/>  -->
			<img src="${pageContext.request.contextPath}/resources/img/member/seller.png"  style="height:300px;width:300px" class="regiImg"/>
			<div class="regiLink">
			<!-- <div id="sellerbutton"class="radiusClass" href="#">판매자 회원가입</div></div> -->
			<div id="sellerbutton"class="radiusClass">
				<a href="/mall/member/sregisterForm">판매자 회원가입</a>
			</div>
			</div>
		</div>
	</div>
	
</div>


  

<!-- ########## 회원가입 폼 끝 ########## -->

   <!-- ########## footer start ##########-->
<%@ include file="../../../resources/layout/footer.jsp" %>
    <!-- footer end -->
</body>
</html>