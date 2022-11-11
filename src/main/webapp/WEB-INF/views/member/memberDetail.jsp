<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.vo.MemberVO" %>
<%@ page import="java.util.*" %>  

<%
 	String auth_id = null;
	String m_id = null;
	String m_email = null;
	String m_phone = null;
	String m_name = null;
	String m_address = null;
	String m_address2 = null;
	String m_registedate = null;
	String m_type = null;
 	String m_stop="";
 	String m_point="";
 	String m_exitstatus= "";
 	String m_exitdate ="";
	
	
	List<Map<String,Object>> memberList = 
			(List<Map<String,Object>>)request.getAttribute("memberDetail");	
	if(memberList !=null && memberList.size()>0){
		auth_id = memberList.get(0).get("AUTH_ID").toString();
		m_id = memberList.get(0).get("M_ID").toString();
		m_email = memberList.get(0).get("M_EMAIL").toString();
		m_phone = memberList.get(0).get("M_PHONE").toString();
		m_name = memberList.get(0).get("M_NAME").toString();
		m_address = memberList.get(0).get("M_ADDRESS").toString();
		m_address2 = memberList.get(0).get("M_ADDRESS2").toString();
		m_registedate = memberList.get(0).get("M_REGISTEDATE").toString();
		m_type = memberList.get(0).get("M_TYPE").toString();
 		m_stop = memberList.get(0).get("M_STOP").toString();
 		m_point = memberList.get(0).get("M_POINT").toString();
 		m_exitstatus = memberList.get(0).get("M_EXITSTATUS").toString();
// 		m_exitdate = memberList.get(0).get("M_EXITDATE").toString();
	}
		//out.print(memberList);
%>  
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
	.menuButtons{
		padding:0 5px;
	}
	.loginButtons{
		text-align:right;
		width:1080px;
		height:25px;
	}
	#menu{
		width:1080px;
		margin:0 auto;
	}
	#logoImg{
		text-align:center;
		line-height:150px;
		height:150px;
	}
	ul, li{
		list-style-type:none;
		float:left;
	}
	#searchProduct{
		text-align:right;
	}
	#menuBar .section a:active, #menuBar .section a:visited, #menuBar .section a:hover, #menuBar .section a:link, #menuBar span{
		color:white;
	}
	#menuList>ul>li{
		height:40px;
		line-height:40px;
	}
	#menuListUl img{
		height:32px;
		line-height:40px;
		padding:0px;
	}
	#menuListUl>li{
		width:130px;
		text-align:left;
		font-size:16px;
		letter-spacing:1px;
		font-weight:bold;
		padding-left:10px;
	}
	
	#menuListUl>li:nth-child(5){
		padding-left:25px;
		
	}
	#menuListUl>li:last-child{
		width:120px;
		text-align:left;
		font-size:16px;
		letter-spacing:1px;
		font-weight:bold;
	}
	#menuListUl{
		margin:0;
		padding:0;
	}
	#menuListUl>li, #menuListUl{
		position:relative;
	}
	#searchBtn{
		position:absolute;
	}
	#searchInputbox{
		width:350px;
		border:1px solid rgb(252,118,45);	/* rgb(224,102,102) */
		height:32px;
		margin:0px;
		padding:0px;
		border-radius: 5px;
		padding-right:40px;
		padding-left:6px;
		font-size:13px;
	}
	/* 여기서부터내꺼 */
	#kcategoryMainName{
		border-top: 3px solid rgb(252,118,45);
		margin-bottom: 20px;
		padding-top:10px;
		padding-bottom:10px;
	}
	#kcategoryMainName>div{
		font-size: 22px;
	    margin-bottom: 20px;
	    font-weight: bold;
    }
    #kcategoryMain{
        margin-left:20px;
    }
    #kcategoryMain>div:last-child{
    	border-bottom:3px solid rgb(252,118,45);
   	}
    #kcategory{
        margin-bottom: 40px;
	    padding-bottom: 30px;
	    
	    font-size: 21px;
	    font-weight: bold;
    }

    #kCateMain{
        padding-bottom: 20px;
    }

    #kmiddelname{
        font-size: 19px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    #leftMenu a:active, #leftMenu a:link, #leftMenu a:visited, #leftMenu a:hover{
    	text-decoration: none;
		color:black;
	}
    #menuList{
       position:relative;
    }
    
    #leftMenu{
       position: absolute;
       left:-250px;
       top:150px;
       display: none;
       width:180px;
       padding-left:10px;
       padding-right:10px;
    }
    #kareaMenu{
    	padding-left: 30px;
    }
    #menuListName{
    	font-weight:bold;
    	border-top: 3px solid rgb(252,118,45);
    	margin-bottom: 20px;
    	padding-top:20px;
    }
    

    /* 마이페이지 왼쪽 */
    #cMyPageLeft{
    	position: absolute;
    	left:-250px;
    	top:150px;
    	display: none;
    	width:180px;
    	height:520px;
    	color:black;
    	background-color:white;
    	padding-left:10px;
    	padding-right:10px;
    	font-size:21px;
    	line-height: 40px;
    	border-bottom: 3px solid rgb(252,118,45);
    }
    #cMyPageLeft>div{
    	height:50px;
    }
    #cMyPageLeft a:active, #cMyPageLeft a:link, #cMyPageLeft a:visited, #cMyPageLeft a:hover{
		color:black;
		font-size:16px;
	}
	#menuImgs img{
		float:left;
	}
	#menuImg{
		display:none;
	
	}
	#menuImgs {
		line-height:40px;
		position: relative;
	}
	#searchbar{
		position:absolute;
		left:730px;
	}
	#menuListUl img:first-child {
		padding-right:5px;
		margin-top:-5px;
	}
	#searchbar img{
		position:absolute;
		left:320px;
		background-color: #aaa;
		border-radius:5px;
		height:26px;
		width:26px;
		margin-top:8px;
		margin-right:8px;
		opacity:60%;
	}
	
	
	

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
#farmname{
	font-size: 12px;
	margin-bottom: 10px;
}
#profile_box img{
	width: 100px;
	height: 110px;
	margin: 10px auto 0 auto;
}

/* 소개 */
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


#info_container{
	margin-bottom: 200px;
}
	
/* 버튼 */
.button {
	margin-top: 20px;
	display: inline-block;
	text-align: center;
	background-color: #2f623a;
	border: 1px solid #293824;
	color: #fff;
	font-size: 13px;
}
</style>
<script>

	
</script>
<!-- ########## 헤더 시작 ########## -->
<%@ include file="../../../resources/layout/header.jsp" %>
<%@ include file="../../../resources/layout/nav.jsp" %>
<!-- ########## 헤더 끝 ########## -->
<div class="section">
<%@ include file="../../../resources/layout/msidebar.jsp" %>

	<div class="seller_title">회원 상세</div>
		<%-- 	<input type="hidden" name="storenum" value="${memberDetail.mVO}"/> --%>
			<!-- info 컨테이너 묶기 width:700px 고정 -->
			<div id="info_container">
				<hr/>
				<div id="farm_info">
				<div>INFO</div>
				<p name="farmintro" var="member" items="${memberListAll}"></p>
				</div><!-- farm_info 종료 -->
				<div id="farm_contact">
				<div>CONTACT</div>
					<div id="contact_content">
<%-- 						<b>회원 정보</b>
						<div><span>아이디</span><p name="m_id">${member.m_id }</p></div>
						<div><span>이름</span><p name="m_name">${member.m_name}</p></div>
						<div><span>휴대폰</span><p name="m_phone">${member.m_phone }</p></div>
						<div><span>이메일</span><p name="m_email">${member.m_email} </p></div>
						<div><span>주소</span><p name="m_address">${member.m_address}</p></div>
						<div><span>상세주소</span><p name="m_address2">${member.m_address2 }</p></div>
						<div><span>가입일</span><p name="m_registedate">${member.m_registedate }</p></div>
						<div><span>회원타입</span><p name="m_type">${member.m_type }</p></div>
						<div><span>정지유무</span><p name="m_stop">${member.m_stop }</p></div>
						<div><span>적립금</span><p name="m_point">${member.m_point }</p></div>
						<div><span>회원탈퇴여부</span><p name="m_exitstatus">${member.m_exitstatus }</p></div>
						<div><span>회원탈퇴일</span><p name="m_exitdate">${member.m_exitdate }</p></div>
						<div><span>회원타입</span><p name="auth_id">${member.auth_id }</p></div> --%>
						<b>회원 정보</b>
					<!--  	<div><span>아이디</span><p name="m_id">${member.M_ID }</p></div> -->
						<div><span>아이디</span><p name="m_id"><%=m_id %></p></div>
						<!--  이 름 : <input type="text" name="m_name" value="<%=m_name %>"> <br />
						휴대폰 : <input type="text" name="m_phone" value="<%=m_phone %>"> <br />-->
						<div><span>이름</span><p name="m_name"><%=m_name %></p></div>
						<div><span>휴대폰</span><p name="m_phone"><%=m_phone %></p></div>
						<div><span>이메일</span><p name="m_email"><%=m_email %></p></div>
						<div><span>주소</span><p name="m_address"><%=m_address %></p></div>
						<div><span>상세주소</span><p name="m_address2"><%=m_address2 %></p></div>
						<div><span>가입일</span><p name="m_registedate"><%=m_registedate %></p></div>
						<div><span>회원타입</span><p name="m_type"><%=m_type %></p></div>
						<div><span>정지유무</span><p name="m_stop"><%=m_stop %></p></div>
						<div><span>적립금</span><p name="m_point"><%=m_point %></p></div>
						<div><span>회원탈퇴여부</span><p name="m_exitstatus"><%=m_exitstatus %></p></div>
						<div><span>회원탈퇴일</span><p name="m_exitdate"><%=m_exitdate %></p></div>
						<div><span>회원타입</span><p name="auth_id"><%=auth_id %></p></div>
					</div>
				</div><!-- farm_contact 종료 -->
				<button type="search" role="button" class="btn btn-success m-1">취소</button>
				<button type="search" role="button" class="btn btn-success m-1">수정</button>
				<button type="search" role="button" class="btn btn-success m-1">삭제</button>
			</div><!-- info_container 종료 -->
</div>