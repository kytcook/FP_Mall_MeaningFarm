<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원가입 -- 원본!!!!!!!!!!!!!!!!! </title>
<%@ include file="../../../common/common.jsp" %>
<style type="text/css">

 .m_title01 cboth {
 	color:red;
 }

	.spanstar{
		color:red;
	}
/* ########## 부트스트랩 - 카드 CSS 시작 ########## */
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
/* ########## 부트스트랩 - 카드 CSS 끝 ########## */

/* ########## 부트스트랩 - 회원가입 양식부분 CSS 시작 ##########*/
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      <!-- 생년월일 -->
	  .bir_yy,.bir_mm,.bir_dd {
		width:160px;
		display:table-cell;
	  }
	  .bir_mm+.bir_dd, .bir_yy+.bir_mm {
		padding-left:10px;
 	  }      
/* ########## 부트스트랩 - 회원가입 양식부분 CSS 끝 ##########*/
</style>

<script type="text/javascript">
	
	
	$(document).ready(function(){
	
	/*
    // 회원가입 버튼 눌렀을 때 빈값 체크
	$('.join').click(function(){
		if($("#m_id").val()==""){
			alert("ID를 입력해주세요.");
			$("#m_id").focus();
			return false;
		})//endof if
	});//endof join
	*/
	
	/* ########## [[ Id 유효성 검사 ]] ########## */
	let m_id =$(".vm_id")
	var regExp = '/^[a-z][a-z0-9]{5,11}$/';
	$('.con .vm_id').keyup(function() {
		$('.con .idnoti').css('display', 'none');
		
		$.ajax({
			url : "/dupId",
			data : {"m_id" : m_id.val()},
			success : function(result){
				// 이미 사용중인 아이디 
				if(result != 0){
					$('.con .idnoti').css('display', 'none');
					$('.con .m_id-noti-2').css('color', '#ff5442');
					$('.con .m_id-noti-2').css('display', 'block');
					$('.con .vm_id').css('border', '1px solid #ff5442');
				} else if (!regExp.test(m_id.val())){
					$('.con .m_id-noti-1').css('color', '#ff5442');
					$('.con .m_id-noti-1').css('display', 'block');
					$('.con .vm_id').css('border', '1px solid #ff5442');
				} else {
					$('.con .idnoti').css('display', 'none');
					$('.con .m_id_suc').css('display', 'block');
					$('.con .m_id_suc').css('color', '#0160ff');
					$('.con .vm_id').css('border', '0');
				} // end of else
			}, // end of if
			error : function() {
				console.log("전송실패함");
			} // end of success
		}) // end of ajax
	};
	
	
  
  }) 
  
  
  
  
</script>


</head>
<body>


<!-- ########## 헤더 시작 ########## -->
<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/nav.jsp" %>
<!-- ########## 헤더 끝 ########## -->

<!-- ########## 회원가입 폼 시작 ########## -->
<div class="section">
<!--  
 <div class="container px-4 py-5" id="featured-3">
	<h1 class="pb-2 border-bottom"><b>회원가입</b></h1>
	<h4><span class="spanstar">*</span> 표시는 필수입력항목입니다.</h4>
 </div>
 
 <div class="section"id="regiclass">
	<div id="register" style="position: relative;">
		<h2>회원가입</h2><span class="spanstar">*</span>표시는 필수입력항목입니다
		<hr/>
 
-->

    
<div class="container">
  <main>
  
    <div class="py-5 text-center">
      <h1 class="pb-3 border-bottom"><b>회원가입</b></h1>
      <h4><span class="spanstar">*</span> 표시는 필수입력항목입니다.</h4>
    </div>


      
      <div class="col-md-7 col-lg-8">
       
<!-- ########## 카드형식 시작 ########## -->
    <div class="container h-200">
      <div class="card">
        <div class="card-body con">
          <b><h2 class="card-title">기본 정보</h2></b><hr>
          
        <!-- ########## 회원가입 양식 시작 ########## -->
        
		<!-- ########## form 태그 시작 action="/member/memberList"########## -->
 		<!-- <form id="register" name="memberForm" method="POST" class="needs-validation" novalidate  action="" onsubmit="return signUp()"> -->
 		 <form id="register" name="memberForm" method="POST" class="needs-validation" novalidate  action="" >
          <div class="row">
          	<!-- ## hidden ## -->
              <input type="hidden" class="form-control" id="m_type" name="m_type" placeholder="" value="씨앗" required="">
          	  <input type="hidden" class="form-control" id="m_stop" name="m_stop" placeholder="" value="" required="">
          	  <input type="hidden" class="form-control" id="m_point" name="m_point" placeholder="" value="0" required="">
          	  <input type="hidden" class="form-control" id="m_exitstatus" name="m_exitstatus" placeholder="" value="" required="">
         	  <input type="hidden" class="form-control" id="m_status" name="m_status" placeholder="" value="" required="">
        <!--  <input type="hidden" class="form-control" id="auth_id" name="auth_id" placeholder="" value="User" required="">  -->
          <!--  <input type="hidden" class="form-control" id="auth_id" name="auth_id" placeholder="" value="Seller" required=""> -->
          	
    		<!-- ## 회원 구분 => auth_type ## -->
            <div class="container ">  
            <div class="auth_type pb-4 ">  
            
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" id="auth_id_User" name="auth_id" value="User">
				<label class="form-check-label" for="inlineRadio1">일반 회원</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" id="auth_id_Seller" name="auth_id" value="Seller">
				<label class="form-check-label" for="inlineRadio2">판매자 회원</label>
				<div id="authid_Seller" style="display:none;">
<!-- 사업자등록번호/상호명/대표자/승인여부/승인날짜/사업장우편번호/사업장주소/사업장상세주소/사업장이메일/  -->
				</div>
			<!--  </div> -->
<!--  			
			<div id="auth_id_User1" style="display:none;">
			 사업자등록번호
			<input type="text" id="SELLER_REGINO" name="SELLER_REGINO"  value=""> 원
			
			
			 <div class="col-sm-6 pb-4">
              <label for="m_pw" class="form-label"><span class="spanstar">*</span> 비밀번호</label>
              <input type="text" class="form-control" id="m_pw" name="m_pw" placeholder="영문 대소문자/숫자 조합 10~16자" value="" required="" minlength="10">
              <div class="invalid-feedback">
                비밀번호 10자리 이상 입력해야 합니다.
              </div>
              
			</div>
			</div>
-->			
			
			
			
			
			</div>
			</div>
			
          	<!-- 아이디 -->
   			<div class="row ">
             <div class="col-sm-4 pb-4 "> 
             
              <!-- ########## 나중에 삭제할 수도 ..  시작 !!!! ########## -->
		    <!-- 화면에 msg가 안보일떄 : 인코딩한 것을 다시 디코딩해줘야함 / 그리고 import해줘야함 -->
		    <div id="msg" class="msg"> ${URLDecoder.decode(param.msg, "utf-8")}</div>  
              <!-- ########## 나중에 삭제할 수도 ..   끝 !!!! ########## -->
             
        
             <!-- Id -->
              <label for="m_id" class="form-label vm_id"><span class="spanstar">*</span> 아이디</label>
              <input type="text" class="form-control idelem" id="m_id" name="m_id" placeholder="영문소문자/숫자 6~10자리" autofocus value="" required="" minlength="6" maxlength="10">
			</div> 
		 	<div class="row col-sm-2 mb-5 mt-4 ">
              <button type="button" id="idCheck" name="idCheck" onclick="idCheck()" class="form-control btn btn-outline-secondary">중복확인</button>
              <!--     <a href="javascript:idCheck()">중복체크</a> 
                 중복체크
               --> 
            </div> 
            <div class="invalid-feedback">Please fill out this field.</div>               
			<div class="valid-feedback idnoti m_id-noti-0">아이디를 입력해 주세요.</div>
				<div class="valid-feedback idnoti m_id-noti-1">영문소문자로 시작, 영문소문자, 숫자 포함 6~20자</div>
				<div class="valid-feedback idnoti m_id-noti-2">이미 사용중인 아이디입니다.</div>
				<div class="valid-feedback idnoti m_id_suc">사용가능한 아이디입니다.</div>          	  
			</div> 
        	   
			
			<!-- 비밀번호 -->
			<div class="row">
            <div class="col-sm-6 pb-4">
              <label for="m_pw" class="form-label"><span class="spanstar">*</span> 비밀번호</label>
              <input type="text" class="form-control" id="m_pw" name="m_pw" placeholder="영문 대소문자/숫자 조합 10~16자" value="" required minlength="10" maxlength="16">
              <div class="invalid-feedback">
                비밀번호 10자리 이상 입력해야 합니다.
              </div>
            </div>
            </div>
            
            <!-- 비밀번호 확인 -->
            <div class="row">
            <div class="col-sm-6 pb-4">
              <label for="m_pw2" class="form-label">비밀번호 확인</label>
              <input type="text" class="form-control" id="m_pw2" "m_pw2" placeholder="" value="" required>
              <div class="invalid-feedback">
                Valid last name is required.
              </div>
            </div>
            </div>
            
            <!-- 이름 -->
            <div class="row">
            <div class="col-sm-3 pb-4">
              <label for="m_name" class="form-label"><span class="spanstar">*</span> 이름</label>
              <input type="text" class="form-control" id="m_name" name="m_name" placeholder="성명을 입력해주세요" value="" required>
              <div class="invalid-feedback">
                한글로 시작하는 2~5자리 이내로 입력하세요.
              </div>
            </div>
            </div>

			<!-- 전화번호 --> 
            <div class="col-6 pb-4">
              <label for="tel" class="form-label"><span class="spanstar">*</span> 전화번호 ('-'없이 번호만 입력해주세요)</label>
              <input type="tel" class="form-control" id="m_phone" name="m_phone" placeholder="">
              <div class="invalid-feedback">
                전화번호 형식으로 입력하세요.
              </div>
            </div>
          
            <!-- 이메일  -->
            <div class="col-6 pb-4">
              <label for="m_email" class="form-label"><span class="spanstar">*</span> 이메일 <span class="text-muted"></span></label>
              <input type="email" class="form-control" id="m_email" name="m_email" placeholder="you@example.com">
              <div class="invalid-feedback">
                이메일 형식으로 입력하세요.
              </div>
            </div>
   
            <!-- 생일 --> 
            <div class="col-6 pb-4">
              <label for="m_birth" class="form-label"><span class="spanstar">*</span> 생년월일 <span class="text-muted"></span></label>
              <input type="m_birth" class="form-control" id="m_birth" name="m_birth" placeholder="ex)19940201">
              <small class="text-muted">생년월일 8자리</small>
              <div class="invalid-feedback">
                이메일 형식으로 입력하세요.
              </div>
            </div>

            <!-- 우편번호 -->
            <div class="row">
            <div class="col-4 pb-4">
              <label for="m_zipcode" class="form-label">우편번호</label>
              <input type="text" class="form-control" id="m_zipcode" name="m_zipcode" placeholder="우편번호를 입력해주세요." required>
              <div class="invalid-feedback">
                우편번호
              </div>
            </div>
              <div class="col-md-3 mt-3">
                <div style="margin: 20px"></div>
                <input type="button" id="btn_zipcode" onclick="findZipcode()" class="form-control" value="우편번호 검색"/>
              </div>
            </div>
            
			<!-- 기본 주소 -->
			<div class=" pb-4">
         	<div class="row gy-3">
            <div class="col-md-6">
              <label for="cc-name" class="form-label">기본 주소</label>
              <input type="text" class="form-control" id="m_address" name="m_address" placeholder="기본주소 입력해주세요." required>
              <small class="text-muted">정확한 주소를 입력해주세요</small>
              <div class="invalid-feedback">
                 Please enter your shipping address.
              </div>
            </div>
			<!-- 상세 주소 -->
            <div class="col-md-6">
              <label for="cc-number" class="form-label">상세 주소</label>
              <input type="text" class="form-control" id="m_address2" name="m_address2" placeholder="상세주소 입력해주세요." required>
              <div class="invalid-feedback">
                Credit card number is required
              </div>
            </div>
            </div>
            </div>
			
			

		  <br>
          <hr class="my-4">

		<!-- 추가 정보 : 환불 계좌번호 입력 추가 -->
		  <div class="row">
         <h5 class="mb-3"><b>[ 추가 정보 ] </b></h5>
		  <h6 class="mb-3"><b> - 환불계좌 정보 - </b></h6>
<!--           
          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">Credit card</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">Debit card</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">PayPal</label>
            </div>
          </div>
 -->
 
			 <div class="row">
            <div class="col-md-3">
              <label for="cc-expiration" class="form-label">예금주</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                Expiration date required
              </div>
            </div>

            <div class="col-md-3">
              <label for="bank_name" name="bank_name" class="form-label">은행명</label>
              
              <select class="form-select" id="" required>
                <option value="- 은행선택 -">- 은행선택 -</option>
                <option value="우리은행">우리은행</option>
                <option value="국민은행">국민은행</option>
                <option value="신한은행">신한은행</option>
                <option value="농협">농협</option>
                <option value="기업은행">기업은행</option>
                <option value="하나은행">하나은행</option>
              </select id="m_bank" name="m_bank">
              <div class="invalid-feedback">
                '-'와 숫자만 입력해주세요.
              </div>
                            
              
              
            </div>
            
            <div class="col-md-3">
              <label for="cc-expiration" class="form-label">계좌번호</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                Expiration date required
              </div>
            </div>
            </div>
            
          </div>
          </div>
<!-- 동그라미 체크 -->

          
<!-- ########## 전체약관 체크박스 시작 ########## -->
<%@ include file="../member/agreementCheck.jsp" %>
<!-- ########## 전체약관 체크박스 끝 ########## -->
         <!--  <button id ="btn_join" class="w-70 btn btn-outline-secondary" type="submit">회원가입</button> -->
    	  <div colspan="3" align=center>
	          <button class="w-70 btn btn-outline-secondary" name="cancel" type="cancel" href="">취소</button>
	          <button class="w-70 btn btn-outline-secondary" type="reset">다시작성</button>
	          <button class="w-70 btn btn-outline-secondary" type="submit" name="join">회원가입</button>
          </div>
        </form>		
		<!-- ########## form 태그 끝 ########## -->
    
          
          
          <!-- ########## 회원가입 양식 끝 ##########-->
        </div>
      </div>
    </div>
<!-- ########## 카드형식 끝 ########## -->        
  </div>
        
        

    <br><br><br>    
      </div>
    </div>
  </main>
</div>
 
</div>
  
  



<!-- ########## 회원가입 폼 끝 ########## -->

   <!-- ########## footer start ########## -->
	<%@ include file="../../../layout/footer.jsp" %>
   <!-- ########## footer end ########## -->
</body>
<script>
	
	
	

</script>
</html>