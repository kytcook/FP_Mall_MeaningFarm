<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="../../../common/common.jsp" %>
<style type="text/css">
 #reg_btn {
	colors : $indigo-100
 
 }
 
</style>

</head>
<body>

<!-- ########## 헤더 시작 ########## -->
<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/nav.jsp" %>
<!-- ########## 헤더 끝 ########## -->

<!-- ########## 회원가입 폼 시작 ########## -->
<div class="section">
	<h1><b>회원가입</b></h1>
	<hr/>
	<h3 style="text-align:center">비트몰에 오신것을 환영합니다.</h3>
	<h4 style="text-align:center;margin-bottom:50px;">회원가입하신 후 비트몰의 다양한 서비스를 이용해보세요.</h4>
	<div id="what_Type">
		<div id="costomer">
			<img src="/sshj/img/dconsumer.png" style="height:300px;width:300px" class="regiImg"/>
			<div class="regiLink"><div id="costomerbutton"class="radiusClass">구매자 회원가입</div></div>
		</div>
		<div id="seller">
			<img src="/sshj/img/dentrepreneur.png" style="height:300px;width:300px" class="regiImg"/>
			<div class="regiLink"><div id="sellerbutton"class="radiusClass">판매자 회원가입</div></div>
		</div>
	</div>
	
</div>

 <div class="container px-4 py-5" id="featured-3">
    <h1 class="pb-2 border-bottom"><b>회원가입</b></h1>
    <div class="m_title01 cboth">
    <h4>Meaning Farm에 오신 것을 환영합니다.<br>
    회원가입 후 다양한 서비스를 이용해보세요.</h4>
    </div>
  </div>
  
  
  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4 border border-info rounded">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
		<br>
        <h2 class="fw-normal">판매자</h2>
        <br><br>
        <p><a id="reg_btn" class="btn " href="#">회원가입 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-4 border border-info rounded">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
		<br>
        <h2 class="fw-normal">일반회원</h2>
        <br><br>
        <p><a id="reg_btn" class="btn btn-secondary" href="#">회원가입 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


<!-- ########## 회원가입 폼 끝 ########## -->

   <!-- ########## footer start ##########-->
	<%@ include file="../../../layout/footer.jsp" %>
    <!-- footer end -->
</body>
</html>