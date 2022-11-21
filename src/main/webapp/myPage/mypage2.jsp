<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common/common.jsp" %>
<%@ page import="com.vo.MemberVO" %>
<%@ page import="java.util.Map , java.util.List" %>
<%

//String m_id = (String) session.getAttribute("m_id");
//if(m_id == null) response.sendRedirect("/member/login");
	List<Map<String,Object>> myinfo
		= (List<Map<String,Object>>)request.getAttribute("myinfo");

//	String m_bank = (String)request.getAttribute("m_bank");
	
//	out.print(myinfo);
	
	Map<String,Object> rmap = null;
	
	for(int i=0;i<myinfo.size();i++){
		rmap = myinfo.get(i);
//		out.print(rmap.get("M_BANKNUM"));
//		m_bank = rmap.get("M_BANKNUM").toString();
	}
	
	
//	out.print("값은???"+m_bank);
//	Map<String, Object> pMap = (Map)request.getAttribute("myInfo");
//	String member_content = null;
//	member_content = (String)pMap.get("member_content");
			

// 		m_exitdate = memberList.get(0).get("M_EXITDATE").toString();
   
   
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
#farm_content{
	width: 90%;
	border: 1px solid #black;
	padding: 10px;
}
#contact_content div{
	overflow: auto;
	margin-top: 25px;
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
<!-- ########## 헤더 시작 ########## -->
<%@ include file="../../../resources/layout/header.jsp" %>
<%@ include file="../../../resources/layout/nav.jsp" %>
<%@ include file="../../../resources/layout/msidebar.jsp" %>
<!-- ########## 헤더 끝 ########## -->

<!--  
<script>
Map<String,Object> rMap = myinfo.get(i);
</script>
-->

<div class="section">

	<div class="seller_title">마이 페이지</div>
			<input type="hidden" name="" value=""/>
			<!-- info 컨테이너 묶기 width:700px 고정 -->
			<div id="info_container">
				<hr/>
				<div id="farm_info">
					<div>INFO</div>
					<p name="intro"></p>
				</div><!-- farm_info 종료 -->
				<div id="farm_contact" >
					<div>CONTACT</div>
					<div id="member_content">
						<h3><b>내 정보</b></h3>
						
						
						
						<!--  <div><span>ID :</span><p name="m_id">${member.m_id}</p></div> -->
						
						
						<%-- <div><span>ID :</span><p name="m_id"><%=m_id %></p></div>
						<div><span>이름 :</span><p name="m_name"><%=m_name %></p></div> --%>
						
						
					<!-- 	<div><span>ID :</span><p name="m_id">${m_id}</p></div>
						<div><span>이름 :</span><p name="m_name">${m_name}</p></div>    -->
						 
						<!-- <div><span>전화번호 :</span><p name="m_phone"><%=rmap.get("M_PHONE")%></p></div>  -->
						<div><span><b>아이디 :</b> &nbsp;<%=rmap.get("M_ID")%></span></div>
						<div><span><b>전화번호 :</b> &nbsp;<%=rmap.get("M_PHONE")%></span></div>
						<%-- <div><span>전화번호 :</span><p name="m_phone"><%=m_phone %></p></div> --%>
						<div><span><b>E-Mail :</b>&nbsp;<%=rmap.get("M_EMAIL")%></span></div>
					 	<div><span><b>생일 :</b>&nbsp; <%=rmap.get("M_BIRTH")%></span></div> 
						<div><span><b>주소 :</b>&nbsp; <%=rmap.get("M_ADDRESS")%></span></div>
						<div><span><b></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<%=rmap.get("M_ADDRESS2")%></span></div>
					 	<div><span><b>은행명 :</b>&nbsp; <%=rmap.get("M_BANK")%></span></div> 
						<div><span><b>계좌번호 :</b>&nbsp; <%=rmap.get("M_BANKNUM")%></span></div>
						<div><span><b>회원등급 :</b>&nbsp; </span><%=rmap.get("M_TYPE")%></div>
						<%-- <div><span>테스트</span><p name="m_type"><%=(String)session.getAttribute("m_type")%></p></div> --%>
					</div>
				</div><!-- member_content 종료 -->
				
				<!-- 대표메뉴 -->
				<div id="farm_repMenu">
					<input type="hidden" name="productnum"/> 
					<div>..</div>
					<div id="repMenu_content">
						<img src="" name="thumbimg"/>
<%-- 						<div>
							<div>${result.productname }ㅇㅇ</div>
							<div>
								<div>
									<div>${ result1.saleprice }원 할인</div>
									<div>${ result.productprice- result1.saleprice }원</div>
								</div>
								<div>${  }원</div>
							</div>
						</div> --%>
					</div>
				</div>
			</div><!-- info_container 종료 -->
			
			
<%-- <!-- 관리자일때만 메뉴확인가능
<% 
if(id != null){
 if(id.equals("admin")){ %>
  <input type="button" value="회원전체목록(관리자용)" class="btn" onclick="location.href='/member/memberList'">
  <input type="button" value="상품전체목록(관리자용)" class="btn" onclick="location.href='/member/adminGoodsList'">
  <input type="button" value="주문전체목록(관리자용)" class="btn" onclick="location.href='/member/adminOrderList'">  
<%
 }
}
%> 
--> --%>
</div>
</html>  