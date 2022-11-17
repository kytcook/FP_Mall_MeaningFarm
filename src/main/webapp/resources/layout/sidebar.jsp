<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<style type="text/css">
#menuContainer {
	margin: 0 auto;
}

.menu {
	margin: 50px 20px 0px 0px;
	padding: 0;
	width: 180px;
	heith: 1000px;
	font-size: 15px;
}

.menu ul a {
	display: block;
	padding: 10px;
	color: gray;
	line-height: 1;
	text-align: center;
}

.menu>label {
	color: dimgray;
	display: block;
	margin: 0;
	padding: 20px 0px;
	line-height: 1;
	font-size: 20px;
	cursor: pointer;
	text-align: center;
	height: 60px;
	font-size: 15px;
}

label {
	background-color: rgb(240, 240, 240);
}

label:hover, label:active, lable>span:hover, lable>span:active {
	font-weight: bold;
}

label:visited, label>span:visited {
	font-weight: normal;
}

.menu input {
	display: none;
}

.menu ul {
	margin: 0;
	padding: 0;
	background: #f2f2f2;
	list-style: none;
}

.menu ul>li>a:active, .menu ul>li>a:link, .menu ul>li>a:visited {
	color: gray;
	text-decoration: none;
}

.menu ul>li {
	color: gray;
	font-size: 15px;
	max-height: 0;
	overflow-y: hidden;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
	background-color: white;
}

.menu li>a {
	padding-left: 0;
}

.menu ul>li>a:hover {
	background-color: #EAEAEF;
	color: black;
}

#menu_bar01:checked ~ #links01 li, #menu_bar02:checked ~ #links02 li,
	#menu_bar03:checked ~ #links03 li, #menu_bar04:checked ~ #links04 li,
	#menu_bar05:checked ~ #links05 li, #menu_bar06:checked ~ #links06 li,
	#menu_bar07:checked ~ #links07 li {
	max-height: 46px;
	opacity: 1;
}

.menu span {
	font-size: 13px;
	color: white;
	position: relative;
	top: -2px;
}

#tri {
	position: relative;
	left: 0px;
}

#tri>img {
	width: 15px;
	height: 15px;
	position: relative;
	left: 60px;
	top: -16px;
}
</style>
<script>
$(function(){	  
	 
	//클릭시 메뉴바 색깔, 폰트 두께 변경
	$(".menu>label").click(function(){
		$(".menu>label").css('color','gray').css('background-color','rgb(240,240,240)').css('border-bottom','none');   
		$(this).css('color','black').css('font-weight','bold').css('test-align','center').css('border-bottom','1px solid lightgray').css('background-color','lightgray');  
		$(".menu span").css('color','white');  
		$("#more").attr('src',"<%=request.getContextPath()%>/img/y_more_gray.png");
		$(this).children("#more").attr('src',"<%=request.getContextPath()%>/img/y_more.png");
	}); 
	$(".menu>ul>li").click(function(){  
		$(".menu>ul>li").css('color','gray');   
		$(this).css('color','rgb(40,40,100)').css('font-weight','bold');      
	}); 
	 
});
</script>
<body>

<!-- ########## [[ SideBar 시작 ]] ########## -->
	<div class="scontainer">
	<div id="menuContainer col-md-3">
		<div class="menu">
			<label for="menu_bar01">회원 관리
				<div id="tri">
				</div>
			</label> <input type="checkbox" id="menu_bar01" class="accordion" />
			<ul id="links01">
				<li><a href="/mall/member/memberList">일반 회원</a></li>
				<li><a href="customerLeaveList">탈퇴 회원</a></li>
				<li><a href="customerBlackList">정지 회원</a></li>
			</ul>
			<label for="menu_bar02">상품 관리
				<div id="tri">
				</div>
			</label> <input type="checkbox" id="menu_bar02" class="accordion" />
			<ul id="links02">
				<li><a href="/mall/product/productlisttest">상품 목록</a></li>
			</ul>
			<label for="menu_bar03">매출 관리
				<div id="tri">
				</div>
			</label> <input type="checkbox" id="menu_bar03" class="accordion" />
			<ul id="links03">
				<li><a href="salesAnalasysA">수익 매출분석</a></li>
				<li><a href="salesCateAnalasysA">카테고리별 매출분석</a></li>
				<li><a href="salesListA">판매내역</a></li>
			</ul>
			<label for="menu_bar04">정산 관리
				<div id="tri">
				</div>
			</label> <input type="checkbox" id="menu_bar04" class="accordion" />
			<ul id="links04">
				<li><a href="settleMng">정산관리</a></li>
			</ul>
			<label for="menu_bar05">게시글 관리
				<div id="tri">
				</div>
			</label> <input type="checkbox" id="menu_bar05" class="accordion" />
			<ul id="links05">
				<li><a href="noticeBoardList">공지사항 관리</a></li>
				<li><a href="noticeBoardList">문의게시판 관리</a></li>
				<li><a href="myRecipe">마이레시피 리뷰</a></li>
				<li><a href="comment">후기 리뷰</a></li>
			</ul>
			<label for="menu_bar06">고객센터
				<div id="tri">
				</div>
			</label> <input type="checkbox" id="menu_bar06" class="accordion" />
			<ul id="links06">
				<li><a href="csQuestionA">고객 문의</a></li>
				<li><a href="csQBrowse">상품 문의</a></li>
				<li><a href="csFAQ">자주 묻는 질문</a></li>
				<li><a href="csreportListA">신고 관리</a></li>
				<li><a href="csReportChat">채팅 관리</a></li>
			</ul> 
		</div>
	</div>
 </div> 



  </header>
<!-- ########## [[ SideBar 끝 ]] ########## -->



</body>
</html>