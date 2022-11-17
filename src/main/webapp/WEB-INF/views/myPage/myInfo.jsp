<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = (String)session.getAttribute("m_id"); //인클루드 jsp앞에 넣었을때 변수 선언해야함
	String m_name = (String)session.getAttribute("m_name"); 
	String m_email = (String)session.getAttribute("m_email"); 
%>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<%@ include file="../../../common/common.jsp" %>

<style type="text/css">
.m_title01 cboth {
	color: red;
}

.spanstar {
	color: red;
}

/* ########## 폼 양식 새로운거 CSS 시작 ##########*/
*:focus {
	outline: none;
}
body {
	font-family: 'Noto Sans KR';
}
.header-background-area>img {
	position: absolute;
	z-index: -5;
	display: block;
	top: 0;
	width: 1903px;
	align: center;
	object-fit: cover;
}

.frame {
	border: 1px
	width: 1440px;
	height: auto;
	margin: 0 auto;
	border-layout:pink;
	
}
h4 {
	font-size: 20px;
	text-align: center;
	margin-top: 140px;
	font-weight: 400;
	color: #333;
}
.tab {
	list-style: none;
	margin: 50px auto 0;
	padding: 0;
	overflow: hidden;
	width: 624px;
	
}
#tabcontent {
	display: block;
	padding: 6px 12px;
	
}
.tabmenu {
	float: left;
	display: inline-block;
	color: #1dc0a1;
	text-align: center;
	text-decoration: none;
	font-size: 17px;
	width: 208px;
	height: 64px;
	line-height: 64px;
	cursor: pointer;
}
.tabcontent {
	margin: 40px auto 140px;
	width: 624px;
	height: auto;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #ffffff;
}
.content-body {
	margin: 48px auto;
	width: 416px;
	height: auto;
}
.tab-content {
	display: none;
}
.tab-content.current {
	display: inherit;
}
.form-head {
	color: #333;
	font-size: 14px;
	font-weight: 400;
	margin-bottom: 8px;
	display: flex;
}
.form-head2 {
	margin-top: 1.5em;
}
.form-id {
	float: left;
}
.required {
	color: #1dc0a1;
}
.form-elem {
	color: #333;
	border: 0;
	border-radius: 3px;
	height: 46px;
	width: 370px;
	padding-right: 44px;
	text-indent: 1.25rem;
	font-size: .875rem;
}

.re_pwd {
	margin-top: .75rem;
}

.form-noti {
	color: #333;
	font-size: .75rem;
	letter-spacing: -.025em;
	display: none;
	float: left;
}

.submit-btn {
	margin-top: 50px;
	color: #fff;
	width: 100%;
	height: 46px;
	border: 0;
	border-radius: 3px;
	background-color: #0160ff;
	font-weight: 700;
	font-size: 1.125rem;
	line-height: 1.5;
}

.submit-btn:hover {
	background-color: #0149c0;
}

/* ########## 폼 양식 새로운거 CSS 시작 ##########*/
</style>

<script type="text/javascript">
$(function() {
	// 탭별로 양식 다르게 출력
	$('.tabmenu').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('.tabmenu').css('background-color', '#f4f4f4');
		$('.tabmenu').css('color', '#333');
		$(this).css('background-color', '#0160ff');
		$(this).css('color', '#fff');
		$('.ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		$(this).addClass('current');
		$("#"+activeTab).addClass('current');
	
		/* ########## [[ 아이디 유효성 검사]] ########## */
		var m_id = $(".current .m_idelem");
		var regExp = /^[a-z][a-z0-9]{5,11}$/;
		$('.current .m_idelem').keyup(function() {
			$('.current .m_idnoti').css('display', 'none');
			
			$.ajax({
				url : "http://localhost/mall/member/registerForm2",/* 안먹혀서 뒤에 2 붙여서 막음 */
				data : { "m_id" : m_id.val() },
				success : function(result) {
					//2이미 사용중인 아이디입니다.
					if(result != 0){
						$('.current .m_idnoti').css('display', 'none');
						$('.current .m_id-noti-2').css('color', '#ff5442');
						$('.current .m_id-noti-2').css('display', 'block');
						$('.current .m_idelem').css('border', '1px solid #ff5442');
					} else if (!regExp.test(m_id.val())) {
							$('.current .m_id-noti-1').css('color', '#ff5442');
							$('.current .m_id-noti-1').css('display', 'block');
							$('.current .m_idelem').css('border', '1px solid #ff5442');
					}else{
						$('.current .m_idnoti').css('display', 'none');
						$('.current .m_id_suc').css('display', 'block');
						$('.current .m_id_suc').css('color', '#0160ff');
						$('.current .m_idelem').css('border', '0');
					}//end of else
				}, // end of if
				error : function() {
					console.log("전송실패");
				}//end of success
			});//end of ajax
		});
		$(".current .m_idelem").on("blur", function() {
			if(m_id.val() ==""){ 
				$('.current .m_idnoti').css('display', 'none'); 
				$('.current .m_id-noti-0').css('color', '#ff5442');
				$('.current .m_id-noti-0').css('display', 'block');
				$('.current .m_idelem').css('border', '1px solid #ff5442');
			}
	 });   
		
		/* ########## [[ 비밀번호 유효성 검사]] ########## */
		var m_pw = $(".current .m_pwelem");
		var regExpPw = /^[a-z0-9][a-z0-9]{5,11}$/;
		m_pw.keyup(function() {
			$('.current .m_pwnoti').css('display', 'none');
			if (!regExpPw.test(m_pw.val())) {
				$('.current .m_pw_noti_1').css('color', '#ff5442');
				$('.current .m_pw_noti_1').css('display', 'block');
				$('.current .m_pwelem').css('border', '1px solid #ff5442');
			}else{
				$('.current .m_pwnoti').css('display', 'none');
				$('.current .m_pwelem').css('border', '0');
			}
		});
		$(".current .m_pw2").keyup(function() {
			$('.current .m_pwnoti').css('display', 'none');
			if($(".current .m_pw2").val()!=m_pw.val()){
				$('.current .m_pwnoti').css('display', 'none');
				$('.current .m_pw_noti_2').css('color', '#ff5442');
				$('.current .m_pw_noti_2').css('display', 'block');
				$('.current .m_pw2').css('border', '1px solid #ff5442');
			}else{
				$('.current .m_pwnoti').css('display', 'none');
				$('.current .m_pwelem').css('border', '0');
			}
		});
		
		/////비밀번호 입력해주세요
		m_pw.on("blur", function() {
			$('.current .m_pwnoti').css('display', 'none');
			if (m_pw.val() =="") {
				$('.current .m_pw_noti_0').css('color', '#ff5442');
				$('.current .m_pw_noti_0').css('display', 'block');
				$('.current .m_pwelem').css('border', '1px solid #ff5442');
			}else if(!regExpPw.test(m_pw.val())){
				$('.current .m_pwnoti').css('display', 'none');
				$('.current .m_pw_noti_1').css('color', '#ff5442');
				$('.current .m_pw_noti_1').css('display', 'block');
				$('.current .m_pwelem').css('border', '1px solid #ff5442');
			}else if($(".current .m_pw2").val()==""){
				$('.current .m_pw2').css('border', '1px solid #ff5442');
			}else if($(".current .m_pw2").val()!=m_pw.val()){
				$('.current .m_pwnoti').css('display', 'none');
				$('.current .m_pw_noti_2').css('color', '#ff5442');
				$('.current .m_pw_noti_2').css('display', 'block');
				$('.current .m_pw2').css('border', '1px solid #ff5442');
			}else{
				$('.current .m_pwnoti').css('display', 'none');
				$('.current .m_pwelem').css('border', '0');
			}
		});
		
		/* ########## [[ 이름 유효성 검사]] ########## */
		var m_name = $(".current .m_nameelem");
		var regExpName = /^[가-힣]{2,11}$/;
		m_name.keyup(function() {
			$('.current .m_namenoti').css('display', 'none');
			if (!regExpName.test(m_name.val())) {
				$('.current .m_name_noti_1').css('color', '#ff5442');
				$('.current .m_name_noti_1').css('display', 'block');
				$('.current .m_nameelem').css('border', '1px solid #ff5442');
			}else{
				$('.current .m_namenoti').css('display', 'none');
				$('.current .m_nameelem').css('border', '0');
			}
		});
		m_name.on("blur", function() {
			$('.current .m_namenoti').css('display', 'none');
			if (m_name.val() =="") {
				$('.current .m_name_noti_0').css('color', '#ff5442');
				$('.current .m_name_noti_0').css('display', 'block');
				$('.current .m_nameelem').css('border', '1px solid #ff5442');
			}else if(!regExpName.test(m_name.val())){
				$('.current .m_namenoti').css('display', 'none');
				$('.current .m_name_noti_1').css('color', '#ff5442');
				$('.current .m_name_noti_1').css('display', 'block');
				$('.current .m_nameelem').css('border', '1px solid #ff5442');
			}else{
				$('.current .m_namenoti').css('display', 'none');
				$('.current .m_nameelem').css('border', '0');
			}
		});
	
		 /* #################### [[ classname : joinsubmit 제출버튼 눌렀을때 ]] #################### */
		///////////////제출버튼@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		$('.current .submit-btn').click(function() {
			var rtn = true;
			
			//아이디
			$.ajax({
				url : "http://localhost/mall/member/registerForm",
				data : { "m_id" : m_id.val() },
				async: false,
				success : function(result) {
					if(result != 0){
						alert("사용중인 아이디입니다. 아이디를 다시 입력해주세요.");
						m_id.focus();
						rtn = false;
					}else if(m_id.val() == "") {
						alert("아이디를 입력해주세요.");
						m_id.focus();
						rtn = false;
					}else if (!regExp.test(m_id.val())) {
						alert("아이디가 올바르지 않습니다. 다시 입력해주세요.");
						m_id.focus();
						rtn = false;
					}else {
						rtn = true;
					}
				},
				error : function() {
					console.log("전송실패");
				}
			});

			//비밀번호
			if (userPwd.val() =="") {
				alert("비밀번호를 입력해주세요.");
				userPwd.focus();
				rtn = false;
			}else if (!regExpPw.test(userPwd.val())) {
				alert("비밀번호가 올바르지 않습니다. 다시 입력해주세요.");
				userPwd.focus();
				rtn = false;
			}else if($(".current .re_pwd").val()!=userPwd.val()) {
				alert("비밀번호가 올바르지 않습니다. 다시 입력해주세요.");
				userPwd.focus();
				rtn = false;
			}
			
			
		});
		
	});
	// 
	$('#default').click(); 
});
  
</script>
</head>
<body>
<!-- ########## 헤더 시작 ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## 헤더 끝 ########## -->
<!-- ########## 회원 정보 폼 시작 ########## -->

<div class="container" >
  
    <div class="py-5 text-center">
      <h3 class="pb-3 border-bottom"><b>회원 정보</b></h1>
    </div>

      <div class="col-md-7 col-lg-8" style="margin-top:-90px">
		<div class="frame" border="3" borderColor="pink" width="100%" height="100%" >
			
			<div class="tabcontent">
				<div class="content-body">
					<div id="dreamEnrollView" class="tab-content current">
				
					<form id="register"  name="memberForm" method="post">
				    <div colspan="2" >
			          <span   type="text" href=""><b>아이디 :&nbsp; </b></span>
			          <span name="m_id" class="form-elem m_idelem" type="text"><%=m_id %></span>
		            </div>
			          <br>
					<!-- 이름  -->
				    <div colspan="2" >
			          <span   type="text" href=""><b>이  름 :&nbsp; </b></span>
			          <span name="m_name" class="form-elem m_nameelem" type="text" readonly ><%=m_name %></span>
		            </div>
					 <!-- 비밀번호  -->
					<div class="form-head form-head2">
						비밀번호&nbsp;
						<span class="required">*</span>&nbsp;&nbsp;
							<div class="form-noti m_pwnoti m_pw_noti_0" >비밀번호를 입력해 주세요.</div>
							<div class="form-noti m_pwnoti m_pw_noti_1">영문 대소문자/숫자 조합 10~16자</div>
							<div class="form-noti m_pwnoti m_pw_noti_2">비밀번호가 일치하지 않습니다.</div>
					</div>
					<div class="form-body">
						<input name="m_pw" class="form-elem m_pwelem" type="password" minlength="6" maxlength="20" placeholder="영문, 숫자 또는 혼합 6~20자">
						<input name="m_pw2" class="form-elem m_pwelem m_pw2" type="password" maxlength="20" placeholder="비밀번호 재입력">
					</div>
					<!-- 이름  -->
					<div class="form-head form-head2">
						이름&nbsp;
						<span class="required">*</span>&nbsp;&nbsp;
						<div class="form-noti m_namenoti m_name_noti_0">이름을 입력해 주세요.</div>
						<div class="form-noti m_namenoti m_name_noti_1">한글 2자 이상 입력</div>
					</div>
					<div class="form-body">
						<input name="m_name" class="form-elem m_nameelem" type="text" value=<%=m_name %> readonly>
					</div>
					<!-- 이메일  -->
					<div class="form-head form-head2">
						이메일&nbsp;
						<span class="required">*</span>&nbsp;&nbsp;
						<div class="form-noti m_emailnoti m_email_noti_0">이메일을 입력해 주세요.</div>
						<div class="form-noti m_emailnoti m_email_noti_1">이메일 형식이 올바르지 않습니다.</div>
						<div class="form-noti m_emailnoti m_email_noti_2">이미 사용중인 이메일입니다.</div>
					</div>
					<div class="form-body">
						<input name="m_email" class="form-elem m_emailelem" type="text" maxlength="50" value=<%=m_email %> readonly>
					</div>
					
					<!-- 전화번호  -->
					<div class="form-head form-head2">
						휴대폰번호&nbsp;
						<span class="required">*</span>&nbsp;&nbsp;
						<div class="form-noti m_phonenoti m_phone_noti_0">휴대폰번호를 입력해 주세요.</div>
						<div class="form-noti m_phonenoti m_phone_noti_2">이미 등록된 번호입니다.</div>
					</div>
					<div class="form-body">
						<input name="m_phone" id="mzphoneelem" class="form-elem m_phoneelem" type="text" maxlength="13" placeholder="숫자만 입력해주세요.">
					</div>
					
					
					<!-- 우편번호  <ㅁㄹ ㅇ리;ㅏ머이;라ㅓㅁ;ㅇ ㅣ라ㅓㅁ;ㅣ아ㅓ리마어 리마ㅓㅇ리ㅏ머이라ㅓㅁ;ㅣ앎;ㅣ아 ㅓㄹ;미ㅏ000-->
					
					<div class="form-head form-head2">
						우편번호&nbsp;
						<span class="required"></span>&nbsp;&nbsp;
						<div class="form-noti m_zipcodenoti m_zipcode_noti_0">우편번호를 입력해 주세요.</div>
						<div class="form-noti m_zipcodenoti m_zipcode_noti_2">숫자로 입력해주세요.</div>
					</div>
					<div class="form-body">
						<input name="m_zipcode" id="m_zipcode" class="form-elem m_zipcodeelem" type="text" minlength="5" maxlength="8" placeholder="우편번호를 입력해 주세요">
					</div>
					
					<!-- 기본 주소  -->
					<div class="form-head form-head2">
						기본 주소&nbsp;
						<span class="required"></span>&nbsp;&nbsp;
						<div class="form-noti m_addressnoti m_address_noti_0">기본주소 입력해주세요.</div>
						<div class="form-noti m_addressnoti m_address_noti_2">.</div>
					</div>
					<div class="form-body">
						<input name="m_address" id="m_address" class="form-elem m_addresselem" type="text" minlength="" maxlength="" placeholder="기본 주소를 입력해주세요.">
					</div>
					
					<!-- 상세주소  -->
					<div class="form-head form-head2">
						상세주소&nbsp;
						<span class="required"></span>&nbsp;&nbsp;
						<div class="form-noti m_address2noti m_address2_noti_0">나머지 주소를 입력해주세요.</div>
						<div class="form-noti m_address2noti m_address2_noti_2">.</div>
					</div>
					<div class="form-body">
						<input name="m_address2" id="m_address2" class="form-elem m_address2elem" type="text" minlength="" maxlength="" placeholder="나머지 주소를 입력해주세요.">
					</div>
					
					<!-- [[ 추가 정보 입력하기 - 은행, 계좌번호, 예금주 ]] -->
					</hr>
					
					<div class="inline"> 
					<!-- 은행  -->
					<div class="form-head form-head2">
						은행&nbsp;
						<span class="required">*</span>&nbsp;&nbsp;
						<div class="form-noti m_bankenoti m_bank_noti_0">은행을 입력해 주세요.</div>
						<div class="form-noti m_banknoti m_bank_noti_1">한글 2자 이상 입력</div>
					</div>
					<div class="form-body">
						<input name="m_bank" class="form-elem m_bankelem" type="text" minlength="2 "maxlength="5" placeholder=" **은행">
					</div>		
							
							
					<!-- 계좌번호  -->
					<div class="form-head form-head2">
						계좌 번호&nbsp;
						<span class="required">*</span>&nbsp;&nbsp;
						<div class="form-noti m_banknumnoti m_banknum_noti_0">계좌번호 입력해 주세요.</div>
						<div class="form-noti m_banknumnoti m_banknum_noti_1">한글 2자 이상 입력</div>
					</div>
					<div class="form-body">
						<input name="m_banknum" class="form-elem m_banknumelem" type="text" minlength="11 "maxlength="20" placeholder="계좌번호">
					</div>			
					
						
					<!-- 예금주 -->
					<div class="form-head form-head2">
						예금주&nbsp;
						<span class="required">*</span>&nbsp;&nbsp;
						<div class="form-noti m_banknownernoti m_banknowner_noti_0">예금주를 입력해 주세요.</div>
						<div class="form-noti m_banknowneroti m_banknowner_noti_1">한글 2자 이상 입력</div>
					</div>
					<div class="form-body">
						<input name="m_banknowner" class="form-elem m_banknownerelem" type="text" minlength="2 "maxlength="5" placeholder="예금주 성함">
					</div>				
					</div>
					<button class="submit-btn" type="submit">가입하기</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		
			</div>
		</div>
	</div>
</div>
</div>
 
   <!-- ########## footer start ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
   <!-- ########## footer end ########## -->
</body>
</html>