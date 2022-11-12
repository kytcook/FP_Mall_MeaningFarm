<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ page import="java.util.*, com.meaningfarm.util.PageBar" %>  
<%@ page import="java.util.Map" %>
<%
	//Map<String, Object> pMap = (Map)request.getAttribute("pMap");
//	String member_content = null;
//	member_content = (String)pMap.get("member_content");
	List<Map<String,Object>> memberList = 
	(List<Map<String,Object>>)request.getAttribute("memberListAll");
	
			
			
   String m_name = (String)session.getAttribute("m_name");
   String m_id = (String)session.getAttribute("m_id");
   String m_phone = (String)session.getAttribute("m_phone");
   String m_email = (String)session.getAttribute("m_email");
   String m_birth = (String)session.getAttribute("m_birth");
   String m_adress = (String)session.getAttribute("m_adress");
   String m_adress2 = (String)session.getAttribute("m_adress2");
   String m_bank = (String)session.getAttribute("m_bank");
   String m_banknum = (String)session.getAttribute("m_banknum");
   String m_bankowner = (String)session.getAttribute("m_bankowner");
   
   
   //String m_id="test";
   //String m_pw = (String)session.getAttribute("m_pw");
   
   //session = request.getSession();
   //out.println("m_id: "+session.getAttribute("m_id"));
    // m_id가 있니? 화면 보여주고 ,,, null이면 로그인을 하세요..
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main 페이지</title>
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
	.wordcut{
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.section{
		width:1080px;
		margin:0 auto;
	}
	
	.scontainer {
		float: left;
		margin-top: -40px;
		margin-left: 180px;
		margin-bottom: 50px;
	}
	
	#ffooter {
		clear: both;
	}


/**/
/*---------- 본문 컨테이너 -----------*/
#cMyPageLeft{
	display: block;
}
.seller_title{
	margin-top: 30px;
	width: 100%;
	height: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 50px;
}
#info_container{
	width: 100%;
	margin: 0 auto 30px auto;
}
#info_container>div{
	margin-bottom: 30px;
}
/* 프로필 이미지*/
#profile_box{
	width: 100%;
	height: 200px;
	text-align: center;
	margin: 0px auto 30px auto;
	border: 1px solid #ddd;
	background-color: #fff;
}
#farmname{
	font-size: 12px;
	margin-bottom: 10px;
}
#profile_box img{
	width: 100px;
	height: 110px;
	margin: 10px auto 0 auto;
}

/*  소개 */
#farm_info>div,#farm_contact>div:nth-child(1),#farm_repMenu>div:nth-child(2){
	width: 150px;
	font-size: 20px;
	font-family: 나눔고딕;
	font-weight: bold;
}
#farm_info,#farm_contact,#farm_repMenu{
	display: flex;
}
#contact_content{
	width: 90%;
	border: 1px solid #ddd;
	padding: 10px;
}
#contact_content div{
	overflow: auto;
	margin-top: 5px;
}
#contact_content span{
	width: 130px;
	float: left;
}
#contact_content p{
	float: left;
	margin: 0;
}

</style>
<script>


	
</script>
</head>
<body>
<!-- ########## 헤더 시작 ########## -->
<%@ include file="/resources/layout/header.jsp" %>
<%@ include file="/resources/layout/nav.jsp" %>
<%@ include file="/resources/layout/msidebar.jsp" %>
<!-- ########## 헤더 끝 ########## -->

<div class="section">

	<div class="seller_title">마이 페이지</div>
			<input type="hidden" name="storenum" value="${member.m_id}"/>
			<!-- info 컨테이너 묶기 width:700px 고정 -->
			<div id="info_container">
				<hr/>
				<div id="farm_info">
					<div>INFO</div>
					<p name="farmintro">${result.farmintro }</p>
				</div><!-- farm_info 종료 -->
				<div id="farm_contact">
					<div>CONTACT</div>
					<div id="member_content">
						<h3><b>내 정보</b></h3>
						<!--  <div><span>ID :</span><p name="m_id">${member.m_id}</p></div> -->
						<div><span>ID :</span><p name="m_id"><%=m_id %></p></div>
						<div><span>이름 :</span><p name="m_name"><%=m_name %></p></div>
						<div><span>전화번호 :</span><p name="m_phone"><%=m_phone %></p></div>
						<div><span>E-Mail</span><p name="m_email"><%=m_email %></p></div>
						<div><span>생일 :</span><p name="m_birth"></p><%=m_birth%></div>
						<div><span>주소 :</span><p name="m_adress"><%=m_adress %> <%=m_adress2 %></p></div>
						<div><span>은행명</span><p name="m_bank"><%=m_bank %></p></div>
						<div><span>계좌번호</span><p name="m_banknum"><%=m_banknum %></p></div>
						<div><span>예금주</span><p name="m_bankowner"><%=m_bankowner %></p></div>
					</div>
				</div><!-- member_content 종료 -->
				<!-- 대표메뉴 -->
				<div id="farm_repMenu">
					<input type="hidden" name="productnum" value="${result.productnum }"/> 
					<div>장바구니</div>
					<div id="repMenu_content">
						<img src="/sshj/resources/sellerProductImgs/${result.thumbimg}" name="thumbimg"/>
						<div>
							<div>${result.productname }</div>
							<div>
								<div>
									<div>${ result1.saleprice }</div>
									<div>${ result.productprice- result1.saleprice }</div>
								</div>
								<div>${ result.productprice }</div>
							</div>
						</div>
					</div>
				</div>
			</div><!-- info_container 종료 -->
</div>
</body>
</html>  