<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/common/common.jsp" %>
 <%
	String m_id = (String)session.getAttribute("m_id");
	String m_pw = (String)session.getAttribute("m_pw");
 
	//out.print(m_id);
%>
<style>
	.scontainer {
		float: left;
		margin-top: -40px;
		margin-left: 100px;
		margin-bottom: 50px;
	}
	
	#ffooter {
		clear: both;
	}
	.writepw {
		margin-top:-20px;
	}
	#cMyPageLeft{
		display: block;
	}
	.wordcut{
		overflow:hidden;
		white-space: nowrap;v
		text-overflow: ellipsis;
	}
	.leavepopupDiv{
		position:absolute;
		top:500px;
		background-color: white;
	}
	.leavepopupDiv, .leavepopupBar, .leavepopupContent{
		width:680px;
	}
	.leavepopupBar{		
		height:50px;
		background-color: rgb(252,118,45);
		position:absolute;
		color:white;
		text-align: center;
		line-height: 50px;
	}
	.leaveListBarClose{
		height:50px;
		width:50px;
		background-color: white;
		position:absolute;
		font-size:40px;
		line-height:40px;
		text-align:center;
		border:1px solid rgb(252,118,45);
		left:630px;
	}
	.leavepopupContent{
		height:700px;
		border:1px solid rgb(252,118,45);
	}
	
	#leaveDiv{
		padding-top:20px;
		padding-left:20px;
		height:670px;
		width:1080px;
	}
	#leaveDiv>div{
		margin-top:200px;
	}
	#leaveDiv>div>form{
		margin-top:40px;
		text-align:center;
	}
	#leaveDiv>div>h3{
		text-align:center;
	}
	#pwInput{
		width:300px;
		height:40px;
		margin-left:280px;
	}
	#leaveCheck{
		margin-top:20px;
		margin-left:420px;
		background-color:#568A35;
		font-size: 16px;
		color: #fff;
		font-weight: 600;
		cursor:pointer;
	}
	#leaveCancel{
	
		margin-top:20px;
		background-color:#568A35;
		font-size: 16px;
		color: #fff;
		font-weight: 600;
		cursor:pointer;
	}
	
	#buyCancelRollBack{
		display:none;
		left:650px;
	}
	#leaveBtn{
		width:100px;
		margin-top:20px;
	    height: 30px;
	    background: white;
	    border: 1px solid black;
	    border-radius: 3px;
	}
	#modal{
		background-color: gray;
		opacity: 0.6;
		position: fixed;
		left:0px;
		top:0px;
		width:100%;
		height:100%;
		display:none;
		margin-top:0px;
	}
</style>
<script>
	$(function(){
		$(".leaveBtn").click(function(){
			$(this).parent().parent().css('display',"none");
			$("#leavepopupContent").css("display","none");
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		})
		$("#leaveBtn").click(function(){
			$(this).parent().parent().css('display',"none");
			$("#leavepopupContent").css("display","none");
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		})
		$(".leaveListBarClose").click(function(){
			$(this).parent().css("display","none");
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		})
		$("#leaveCancel").click(function(){
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
			location.href="/sshj";
		})
		
		
		$("#leaveCheck").click(function(){
			const user_pw = $("#pwInput").val();
			alert("사용자가 입력한 비번:"+user_pw);
			let data = {
				    "m_id":"<%=m_id%>"
			}
			if(user_pw === "<%=m_pw%>"){
				//alert("삭제진행");
				$.ajax({
					type: 'POST',
					url : '/mall/member/memberDelete',
					data : JSON.stringify(data),
					contentType:"application/json;charset=UTF-8",
					success: function(result){
						console.log("result = "+result);
					}, error: function(){
						alert("111")
						console.log("에러")
					} // error
				});//ajax				
			}
			else{
				alert("비번이 틀립니다.");
			}

		});//function
	});
</script>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<%@ include file="../../../resources/layout/msidebar.jsp" %>
<!-- ########## [[ 헤더 끝 ]] ########## -->
<div class="containter">

<div class="section" id="leaveDiv">
	<div id="modal" style="margin-top:0px;"></div>
	<h2>회원 탈퇴</h2>
	<h4>정말로 탈퇴하시겠습니까?</h4>
	<hr>
	<div class="writepw" style="margin-top:40px;">

		<%-- <input type="text" value="<%=m_id%>">		
		<input type="text" value="<%=m_pw%>">		 --%>
		
		<h3>비밀번호를 입력해주세요</h3>
		<!-- <form aciton="/member/memberDelete" method="post" id="delForm" onsubmit="memDel()"> -->
		
			<input type="password" placeholder="비밀번호를 입력해주세요" id="pwInput" name="m_pw"/><br/>
			<input type="button" value="탈퇴" id="leaveCheck" class="btn"/>
			<input type="button" value="취소" id="leaveCancel" class="btn"/>
	
	</div>
	<div class="leavepopupDiv" id="buyCancelRollBack">
		<div class="leavepopupBar" style="font-size:21px;">탈퇴 실패</div><div class="leaveListBarClose">&times;</div>
		<div class="leavepopupContent" style="text-align: center;padding-top:100px; height:340px;">
			<h2>현재 등록중/배송중인 상품이 있습니다.</h2>
			<h2>회원탈퇴가 불가능합니다.</h2>
			<input type="button" value="확인" class="leavebtn" id="leaveBtn"  style="top:240px"/>
		</div>
	</div>	
</div>
</div>

<!-- ########## 푸터 시작 ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## 푸터 끝 ########## -->
