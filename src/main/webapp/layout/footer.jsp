<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<style type="text/css">
 /* common.css : header, footer 메인 페이지 */

@charset "utf-8";


/* - */

textarea::placeholder, input::placeholder{
    color:rgb(173, 173, 173);
}

#header, #container, #content {
    position: relative;
}

#main {
    border-bottom: 1px solid #f7f7f7;
}

#content {
    min-width: 1050px;
    padding-bottom: 120px;
}






/* 로그인 클래스 추가 /삭제 */
/* 로그인: #top_event */
#top_event .inner_top_event.login {
    display: none;
}

#top_event.login .inner_top_event.login {
    display: block;
}

#top_event.login .inner_top_event {
    display: none;
}

#top_event.login {
    background-color: transparent;
    position: relative;
    border-bottom: 1px solid #f4f4f4;
    /* 1px로 했는데 2px로 나와서 수정 필요 */
}



#top_event.login .inner_top_event .top_event_bnr.login {
    color: #4c4c4c;
}

#top_event.login .inner_top_event.login .b  {
    color: #5f0080;
}

#top_event.login .top_event_close.login {
    background-image: url("https://res.kurly.com/pc/ico/1908/ico_close_333_42x42.png");
}
/* 로그인; top_event 끝-- */


/* 로그인: sign_menu */
.sign_menu.login {
    min-width: 196px;
    white-space: nowrap;
}

.sign_menu.login .item {
    display: block;
    padding: 0 22px 0 10px;
}

.sign_menu.login .join,
.sign_menu.login .login_none { 
    display: none;
}

.sign_menu .link .login_check{
    display: none;
}

.sign_menu.login .login_check {
    display: block;
    position: relative;
    /* min-width: 120px; */
}

.sign_menu.login .login_check::after {
    position: absolute;
    content: '';
    background-color: rgb(rgb(141, 65, 162), green, blue)
    height: 13px;
    width: 1px;
    top: 11px;
    right: 1px;
}

.sign_menu.login .ico_grade {
    float: left;
    margin-top: 10px;
}

/* sign_menu 로그인: grade 아이콘 설정 */
.grade_comm .ico_grade {
    display: inline-block;
    min-width: 38px;
    height: 16px;
    padding: 0 4px;
    border-radius: 30px;
    font-size: 9px;
    line-height: 14px;
    text-align: center;
}

.grade_comm .grade0 {
    border: 1px solid #5f0080;
    background-color: #fff;
    color: #5f0080;
}

.sign_menu.login .txt {
    float: left;
    padding-left: 4px;
}

.sign_menu.login .login_check ::before {
    position: absolute;
    content: '';
    top: 15px;
    right: 10px;
    content: '';
    background-image: url(https://res.kurly.com/pc/ico/1908/ico_down_8x5.png);
    width: 8px;
    height: 5px;
}

.sign_menu.login .link .service::before {
    position: absolute;
    top: 15px;
    right: 22px;
    content: '';
    background-image: url(https://res.kurly.com/pc/ico/1908/ico_down_8x5.png);
    width: 8px;
    height: 5px;
}

.sign_menu.login .link:nth-child(2) {
    position: relative;
}


.sign_menu.login .sub {
    display: none;
    position: absolute;
    left: auto;
    top: 34px;
    left: 10px;
    width: 102px;
    padding: 3px 9px;
    border: 1px solid #ddd;
    background-color: #fff;
}

.sign_menu .sub {
    display: none;
}


.sign_menu.login .sub .list_item {
    font-size: 12px;
    color: #404040;
    line-height: 24px;
    white-space: nowrap;
}


.sign_menu.login .link:nth-child(2):hover .sub{
    display: block;
    z-index: 200;
}
/* 로그인: sign_menu 끝 */





/* header, footer */
#wrap {
    min-width: 1050px; /*고정 width 값으로 변경할 경우 min-width로 설정했던 모든 코드들이 쓸모없어져버림. >> 다른 방법 찾아야 함!*/
    min-height: 100%;
    /* 임시 height 값 */
    margin: 0 auto;
}

/* header */
#top_event {
    position: relative;
    min-width: 1050px;
    height: 42px;
    background-color: #5f0080;
    z-index: 9999;
}

#top_event .inner_top_event {
    position: relative;
    width: 1050px;
    height: 100%;
    margin: 0 auto;
}

#top_event .inner_top_event .top_event_bnr {
    display: block;
    text-align: center;
    line-height: 42px;
    font-size: 14px;
    color: #fff;
}

#top_event .inner_top_event .top_event_close {
    background: url(https://res.kurly.com/pc/ico/1908/ico_close_fff_42x42.png);
    position: absolute;
    top: 0;
    right: 0;
}

#top_event .bnr_arr, .top_event_close {
    width: 42px;
    height: 42px;
}

#header {
    position: relative;
}

#header .user_menu {
    position: relative;
    width: 1050px;
    height: 37px;
    top: 0;
    margin: 0 auto;
}

.user_menu .bnr_delivery {
    position: absolute;
    top: 7px;
    left: 17px;
    height: 22px;
}

.user_menu .bnr_delivery .bnr_delivery_img {
    width: 163px;
    height: 22px;
}

.user_menu .sign_menu {
    margin-left: auto;
    font-family: noto sans;
    font-weight: 400;
    letter-spacing: -.3px;
}

.user_menu::after {
    content: '';
    display: block;
    clear: both;
}

.sign_menu {
    height: 100%;
    float: right;
    justify-content: space-around;
}

.sign_menu .join {
    color: #5f0080;
}

.sign_menu .item {
    float: left;
    display: block;
    line-height: 37px;
    height: 100%;
    padding: 0 10px;
}

.sign_menu .after {
    position: relative;
}

.sign_menu .after::after {
    position: absolute;
    content: '';
    background-color: rgb(216, 216, 216);
    height: 13px;
    width: 1px;
    top: 11px;
    right: 2px;
}

.sign_menu .link {
    float: left;
    display: block;
}

.sign_menu .link:last-child{
    position: relative;
    padding-right: 10px;
}

.sign_menu .link .service::before {
    position: absolute;
    top: 15px;
    right: 11px;
    content: '';
    background-image: url(https://res.kurly.com/pc/ico/1908/ico_down_8x5.png);
    width: 8px;
    height: 5px;
}

.sign_menu .link:last-child:hover .sub_menu {
    display: block;
    z-index: 200;
}

.sign_menu .link:last-child .sub_menu {
    display: none;
    position: absolute;
    border: 1px solid #ddd;
    background-color: #fff;
    width: 100px;
    top: 34px;
    right: 0px;
    padding: 8px;
    line-height: 25px;
}






#header .header_logo {
    width: 1050px;
    height: 63px;
    margin: 0 auto;
    position: relative;
}

.header_logo .logo {
    position: absolute;
    left: 50%;
    bottom: 6px;
    width: 200px;
    height: 79px;
    margin-left: -100px;
}

.header_logo .logo_img {
    display: block;
    width: 103px;
    height: 79px;
    margin: 0 auto;
}

#header .gnb {
    min-width: 1050px;
    background-color: #fff;
    position: relative;
    z-index: 100;
}

/* gnb position: fixed 시켜야 함 */

.gnb::after {
    content: '';
    position: absolute;
    top: 56px;
    width: 100%;
    height: 9px;
    background: url(https://res.kurly.com/pc/service/common/1902/bg_1x9.png) repeat-x 0 100%;
}

.gnb .gnb_menu {
    width: 1050px;
    /* overflow: hidden; */
    height: 56px;
    margin: 0 auto;
    position: relative;
}

.gnb .gnb_menu .list {
    float: left;
}

.gnb_menu .list:active .link,
.gnb_menu .list:hover .link {
    color: #5f0080;
}

.gnb_menu .list + .list:active .txt,
.gnb_menu .list + .list:hover .txt{
    border-bottom: 1px solid #5f0080;
}

/* 추후 전체 카테고리 앞 메뉴 아이콘 컬러 변경 */

.gnb_menu .list .link {
    /* overflow: hidden; */
    float: left;
    display: block;
    height: 55px;
    width: 129px;
    line-height: 20px;
    padding: 16px 0 0;
    font-size: 16px;
    text-align: center;
}

.gnb_menu .gnb_main .link{
    width: 168px;
    padding-left: 19px;
}

.gnb_menu .link .ico {
    float: left;
    width: 16px;
    height: 14px;
    margin: 4px 14px 0 0;
    background: url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off.png) no-repeat;
}

.gnb_menu .link .txt {
    font-weight: 700;
}

/* .gnb_main {
    position: relative;
    display: block;
} */

.gnb .gnb_sub {
    display: none;
    position: absolute;
    overflow-x: hidden;
    overflow-y: auto;
    width: 210px;
    height: 380px;
    top: 55px;
    left: 0;
    border: 1px solid #ddd;
    background-color: #fff;
    z-index: 9999;
}

.gnb_sub .main_item .ico.on {
    display: none;
}

.gnb_sub .main_item:active .ico.on,
.gnb_sub .main_item:hover .ico.on {
    display: block;
}

.gnb_sub .main_item:active .ico.off,
.gnb_sub .main_item:hover .ico.off {
    display: none;
}

.gnb_sub .tit:hover .txt {
    color: #5f0080;
}

.gnb_main:active .gnb_sub,
.gnb_main:hover .gnb_sub {
    display: block;
}

.gnb_main:active .gnb_sub,
.gnb_main:hover .gnb_sub {
    display: block;
}

.gnb_sub .menu .current {
    background-color: #f7f7f7;
}

.gnb_sub .main_item {
    display: block;
    padding: 10px 14px;
    height: 40px;
    line-height: 32px;
}

.gnb_sub .ico {
    float: left;
    width: 24px;
    height: 24px;
    display: block;
}

.gnb_sub .txt {
    float: left;
    padding: 0 10px 0 24px;
    font-weight: 400;
    font-size: 15px;
    color: #333;
    line-height: 22px;
    white-space: nowrap;
}

.gnb_sub .ico_new {
    background-image: url("https://res.kurly.com/pc/service/common/1908/ico_new_42x42_v2.png");
    background-position: 50% 50%;
    background-size: 14px 14px;
    float: left;
    width: 14px;
    height: 14px;
    overflow: hidden;
    margin-top: 5px;
    /* text-indent: -9999px; */
}

.gnb .gnb_search {
    position: absolute;
    right: 108px;
    top: 10px;
    width: 238px;
}

.gnb_search .inp_search {
    width: 100%;
    height: 36px;
    padding: 0 50px 0 20px;
    border: 1px solid #f7f7f6;
    border-radius: 18px;
    background-color: #f7f7f7;
    font-weight: 400;
    font-size: 12px;
    color: #666;
    line-height: 36px;
    transition: background-color .3s ease-in-out;
}

.gnb_search .btn_search {
    position: absolute;
    right: 10px;
    top: 3px;
    width: 30px;
    height: 30px;
    line-height: 36px;
}

.gnb_search .init {
    position: relative;
}

.gnb_search .init .btn_delete {
    display: none;
    position: absolute;
    overflow: hidden;
    left: 170px;
    top: -36px;
    width: 36px;
    height: 36px;
    border: none;
    background: url(https://res.kurly.com/pc/ico/2010/ico_search_del.svg) no-repeat 50% 50%;
    background-size: 12px 12px;
    font-size: 0;
    line-height: 0;
    /* opacity: 0; */
}

.gnb_search:hover .btn_delete {
    display: block;
}

.gnb .location_login .btn_location.on {
    background-image: url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting.svg?ver=1);
}

.gnb .location_login .btn_location {
    overflow: hidden;
    position: absolute;
    right: 52px;
    top: 10px;
    width: 36px;
    height: 36px;
    border: none;
    font-size: 0;
    line-height: 0;
}

.gnb .location_notice {
    display: none;
    position: absolute;
    right: 41px;
    top: 56px;
    width: 308px;
    padding: 20px 18px 19px 20px;
    border: 1px solid #ddd;
    background-color: #fff;
    z-index: 100;
    font-weight: 700;
    font-size: 16px;
    color: #333;
    line-height: 24px;
}

.gnb .location_notice::after {
    position: absolute;
    content: '';
    top: -50px;
    right: 9px;
    width: 36px;
    height: 50px;
    background: url(https://res.kurly.com/pc/ico/2011/ico_point_up_18x12.svg) no-repeat 50% 100%;
}
/* /* border가 색자체가 돼서 나중에 변경 예정 * */


.gnb .location_login .location_notice.on,
.gnb .location_login:active .location_notice,
.gnb .location_login:hover .location_notice {
    display: block;
}
/* 포인터가 영역을 벗어나면 notice가 바로 사라져버림 
>> z-index 추가해서 수정 완료*/
/* js로 location_login에 3초간 active 붙게 설정*/

.gnb .location_notice .emph {
    color: #5f0080;
}

.gnb .group_button .btn {
    display: block;
    height: 36px;
    margin-top: 17px;
    padding-bottom: 2px;
    border-radius: 3px;
    font-size: 12px;
}

.gnb .group_button .login {
    float: left;
    width: 104px;
    border: 1px solid #5f0080;
    background-color: #fff;
    color: #5f0080;
}

.gnb .group_button .search_address {
    float: right;
    width: 158px;
    border: 1px solid #5f0081;
    background-color: #5f0080;
    color: #fff;
}

.gnb .cart_count {
    position: absolute;
    right: -6px;
    top: 10px;
}

.gnb .cart_count .btn_cart {
    display: block;
    width: 36px;
    height: 36px;
    background: url(https://res.kurly.com/pc/service/common/2011/ico_cart.svg) no-repeat 50% 50%;
}
/* btn_car와 btn_location은 hover 시 보라색으로 변경해야 함. url 못찾는 중 */
/* #header 끝 */


/* footer */
#footer {
    width: 1050px;
    margin: 0 auto;
    padding-bottom: 60px;
    font-weight: 400;
    letter-spacing: -.2px;
}

#footer::after {
    display: block;
    content: '';
    clear: both;
}

#footer .inner_footer {
    /* overflow: hidden; */
    padding-bottom: 20px;
}

#footer .inner_footer::after {
    content: '';
    clear: both;
    display: block;
}

.inner_footer .cc_footer {
    float: left;
    width: 534px;
}

.inner_footer .cc_tit {
    padding: 29px 0 2px;
    font-weight: 700;
    font-size: 30px;
    color: #333;
    line-height: 24px;
}

.inner_footer .cc_view {
    /* overflow: hidden; */
    padding-top: 16px;
}

.inner_footer .cc_view .tit {
    float: left;
    width: 140px;
    margin-right: 16px;
}

.inner_footer .cc_call {
    padding-top: 20px;
}

.inner_footer .cc_call .tit {
    padding-top: 4px;
    font-weight: 800;
    font-size: 18px;
    color: #333;
    line-height: 36px;
    letter-spacing: -.5px;
    white-space: nowrap;
}

.cc_footer .list {
    font-size: 14px;
    color: #333;
    line-height: 22px;
    letter-spacing: -.2px;
}

.cc_footer .cc_kakao .tit,
.cc_footer .cc_qna .tit {
    height: 40px;
    padding-top: 7px;
    margin-top: 3px;
    border: 1px solid #e3e3e3;
    border-radius: 3px;
    font-weight: 700;
    font-size: 14px;
    color: #333;
    line-height: 22px;
    text-align: center;
}

.cc_footer .list dd {
    color: #999;
}

/* #footer right */
#footer .company_info {
    float: right;
    padding-top: 29px;
    font-size: 12px;
    color: #999;
    line-height: 20px;
}

.company_info .list {
    padding-bottom: 29px;
    display: inline-block;
}

.company_info .list li {
    float: left;
    padding-right: 16px;
}

.company_info .list .link {
    font-size: 14px;
    color: #333;
    line-height: 18px;
}

.company_info .spec_info .bar {
    padding: 0 4px 0 3px;
}

.company_info .spec_info .link {
    color: #5f0080;
}

.company_info .spec_info .copy {
    display: block;
    font-size: 10px;
    color: #949296;
    line-height: 22px;
    letter-spacing: 0;
}

.spec_info .sns {
    float: left;
    padding-top: 16px;
}

.sns li {
    float: left;
}

.sns .link_sns {
    display: inline-block;
    width: 30px;
    height: 30px;
    margin-right: 10px;
    
}

#footer .link_footer {
    width: 100%;
    height: auto;
    padding-top: 19px;
    letter-spacing: 0;
    border-top: 1px solid #eee;
}

.link_footer::after {
    display: block;
    content: '';
    clear: both;
}

.link_footer .authentication {
    float: left;
    padding-top: 3px;
}

.link_footer .authentication .mark {
    float: left;
    width: 267px;
}

.link_footer .mark .logo {
    float: left;
    width: 34px;
    height: 34px;
    margin-right: 10px;
}

.link_footer .mark .txt {
    float: left;
    padding-top: 1px;
    font-size: 10px;
    color: #999;
    line-height: 16px;
    letter-spacing: -.5px;
    white-space: nowrap;
}

#footer .lguplus {
    width: 428px;
    display: inline-block;
}

.link_footer .lguplus .logo {
    width: 102px;
    height: 34px;
}



/* 공통 클래스 */
.blind {
    position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: 1px;
    overflow: hidden;
} 
</style>
<body>

<!-- ########## FOOTER 시작 ########## -->
<footer class="py-3 border-top border-secondary col-12">
  <ul class="nav justify-content-center mb-2">

<div id="footer">
	<div class="inner_footer">
	
	
		<div class="cc_footer">
			<!-- cc = company calls -->
		<h2 class="cc_tit">고객행복센터</h2>
		<div class="cc_view cc_call">
			<h3>
				<span class="tit">1577-1004</span>
			</h3>
			<dl class="list">
				<dt>365고객센터</dt>
				<dd>오전 7시 - 오후 7시</dd>
			</dl>
		</div>
		
		<div class="cc_view cc_kakao">
			<h3>
				<a href="#" class="tit">카카오톡 문의</a>
			</h3>
			<dl class="list">
				<dt>365고객센터</dt>
				<dd>오전 7시 - 오후 7시</dd>
			</dl>
		</div>
		<div class="cc_view cc_qna">
			<h3>
				<a href="#" class="tit">1:1 문의</a>
			</h3>
		<dlv class="list">
			<dt>24시간 접수 가능</dt>
			<dd>순차적으로 답변해드리겠습니다.</dd>
		</dlv>
		</div>
		</div>



	   <div class="company_info">
        <ul class="list">
         <li>
             <a href="#" class="link">미닝팜소개</a>
         </li>
         <li>
             <a href="#" class="link">미니팜소개영상</a>
         </li>
         <li>
             <a href="#" class="link">이용약관</a>
         </li>
         <li>
             <a href="#" class="link">개인정보처리방침</a>
         </li>
         <li>
             <a href="#" class="link">이용안내</a>
         </li>
        </ul>
        
        <div class="spec_info">
          법인명 (상호) : 주식회사 미닝팜
          <span class="bar">I</span>
          사업자등록번호 : 2022-11-0023 
          <a href="#" class="link">사업자정보확인</a><br>
          통신판매업 : 제 2018-서울강남-1004 호
          <span class="bar">I</span>
          개인정보보호책임자 : MeaningFarm <br>
          주소 : 서울시 강남구 테헤란로14길 6 남도빌딩 2F
          <span class="bar">I</span>
          대표이사 : MeaningFarm <br>
          김지연 : <a href="#" class="link">kimgy44@naver.com</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          김민지 : <a href="#" class="link">lcly311@gmail.com</a><br>
          임은택 : <a href="#" class="link">kytcook@gmail.com</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          장혜지 : <a href="#" class="link">a0an0n@naver.com</a><br>
          주연진 : <a href="#" class="link">yeonjin1103@gmail.com</a>
          &nbsp;&nbsp;&nbsp;&nbsp;
          한아름 : <a href="#" class="link">rumi418@naver.com</a><br>
          팩스 : 123 - 4567 - 1234
          <span class="bar">I</span>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          이메일 : <a href="#" class="link">meaningfarm@naver.com</a><br>
          <br>
          <strong class="copy">© KURLY CORP. ALL RIGHTS RESERVED</strong>
          <ul class="sns">
            <li>
              <a href="#" class="link_sns insta" target="_blank">
                  <img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="미닝팜 인스타그램 바로가기">
              </a>
                <!-- bg url 넣기 -->
            </li>
            <li>
              <a href="#" class="link_sns fb" target="_blank">
                  <img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="미닝팜 페이스북 바로가기">
              </a>
            </li>
            <li>
              <a href="#" class="link_sns naver_blog" target="_blank">
                  <img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt="미닝팜 네이버블로그 바로가기">
              </a>
            </li>
            <li>
              <a href="#" class="link_sns naver_post" target="_blank">
                  <img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="미닝팜 포스트 바로가기">
              </a>
            </li>
            <li>
              <a href="#" class="link_sns yt" target="_blank">
                  <img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="마켓컬리 유튜브 바로가기">
              </a>
            </li>
   	      </ul>
   	   </div>
  </ul>
	
	
 <!--       <div class="link_footer">
         <div class="authentication">
           <a href="#" class="mark" target="_blank">
               <img src="https://res.kurly.com/pc/ico/2001/logo_isms.png" alt="isms 로고" class="logo">
               <p class="txt">
                   [인증범위] 미닝팜 쇼핑몰 서비스 개발 · 운영<br>
                   [유효기간] 2022.10.03 ~ 2022.11.16
               </p>
           </a>
            <a href="#" class="mark" target="_blank">
             <img src="https://res.kurly.com/pc/ico/2001/logo_eprivacyplus.png" alt="eprivacy plus 로고" class="logo">
             <p class="txt">
                 개인정보보호 우수 웹사이트 ·<br>
                 개인정보처리시스템 인증 (ePRIVACY PLUS)
             </p>
            </a>
            <a href="#" class="lguplus mark" target="_blank">
             <img src="https://res.kurly.com/pc/service/main/2009/logo_payments.png" alt="payments 로고" class="logo">
             <p class="txt">
                 고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
                 토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
             </p>
            </a>
       	 </div>
		</div> -->
</div>
	
  <h4 class="text-center text-muted">&copy; 2022 MeaningFarm</h4>
</footer>


		<!-- ########## FOOTER 끝 ########## -->
</body>
</html>