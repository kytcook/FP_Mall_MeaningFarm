<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cMyPageLeft{
		display: block;
	}
	.wordcut{
		overflow:hidden;
		white-space: nowrap;
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
	#pwdInput{
		width:300px;
		height:40px;
	}
	#leaveCheck, #leaveCancel{
		margin-top:30px;		
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
			if(confirm('정말로 회원탈퇴 하시겠습니까?')){
				$.ajax({
					url : 'memberDelete',
					data : 'm_id='+$("#pwdInput").val(),
					success: function(result){
						console.log("result = "+result);
						if(result == 0){
							alert('잘못 입력하였습니다.');
						}else if(result == -1){
							$("#buyCancelRollBack").css("display","block");
							$("#modal").css("display","block");
							$(document.body).css("overflow","hidden");
						}else if(result == -2){
							alert("회원탈퇴에 실패하였습니다.")
						}else if(result == 1){
							alert("회원탈퇴에 성공하였습니다. \n 이용해주셔서 감사합니다.");
							location.href="logout";
						}
					}, error: function(){
						console.log("에러")
					}
				});
			};
		});
	});
</script>
<div class="section" id="leaveDiv">
	<div id="modal" style="margin-top:0px;"></div>
	<h2>회원 탈퇴</h2>
	<h4>정말로 탈퇴하시겠습니까?</h4>
	<div>
		<h3>비밀번호를 입력해주세요</h3>
		<form method="post">
			<input type="password" placeholder="비밀번호를 입력해주세요" id="pwdInput" name="m_pw"/><br/>
			<input type="button" value="탈퇴" id="leaveCheck" class="btn"/>
			<input type="button" value="취소" id="leaveCancel" class="btn"/>
		</form>
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