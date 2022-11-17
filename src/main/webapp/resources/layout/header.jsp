<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	String m_id2 = (String)session.getAttribute("m_id");
	String m_name2 = (String)session.getAttribute("m_name");
	//out.print(m_id2);
%>




<!-- Login을 로그인되어있으면 LogOut으로, 로그인이 안되어있으면 Login으로 변경 
<c:set var="logout" value="${sessionScope.m_id==null ? '' : '로그아웃'}"/>-->
<!-- 맵핑된 주소를 로그아웃은 '/member/logout', 로그인은 '/member/login' 
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/member/login' : '/member/logout'}"/>-->


<%-- <c:set var="loginLink" value="${sessionScope.id==null ? '/member/login' : '/member/login'}"/> --%>


<!--   살릴 수 있는 코드
<c:set var="review" value="${sessionScope.m_id==null ?'javascript:needLogin()' :'/review'}"/>
<c:set var="board" value="${sessionScope.m_id==null ?'javascript:needLogin()' :'/member/board'}"/>
<c:set var="myrecipe" value="${sessionScope.m_id==null ?'javascript:needLogin()' :'/member/myrecipe'}"/>
-->


<script>
	const logout = () => {
		window.location="../common/logout.jsp";
	}

</script>
<html>
<style type="text/css">
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
</style>
<body>

<!-- ########## HEADER 시작 ########## -->
<div class="container">
  <header class="blog-header lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
<!--         <a class="link-secondary" href="/mall"> -->
        <a class="link-secondary" href="/mall/home">
      		<img alt="" src="${pageContext.request.contextPath}/resources/img/main/meaningfarm2.png" width="300" height="200" left="20px">  
        </a>
      </div>
      <div class="col-4 text-center">
        <h1><a class="blog-header-logo text-dark" id="home" href="javascript:window.relaod();">
        	<img alt="" src="${pageContext.request.contextPath}/resources/img/main/meaningfarm_title.png" width="550" height="150" left="20px">  
        </a></h1>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24">
          <title>Search</title>
          <circle cx="10.5" cy="10.5" r="7.5"/>
          <path d="M21 21l-5.2-5.2"/>
          </svg>
        </a>
        <!-- <a class="btn btn-sm btn-light  bg-white text-dark" href="/mall/member/join">회원가입</a> -->
         
         
       
<%
	if(m_id2==null){
%>
         <a class="btn btn-sm btn-light  bg-white text-dark"  href="/mall/member/join">회원가입</a>
      	 <a class="btn btn-sm btn-light  bg-white text-dark" onclick="login()">로그인</a>
<%
} else {
%>      

     
        <div type ="text" class="  bg-white text-dark" href="">
            <br><p><b><%=m_name2%></b>님</p >
      </div>   
       
      	 <a class="btn btn-sm btn-light bg-white text-dark" onclick="logout()" >로그아웃</a>
<%
}
%>         
         
        <a class="btn btn-light dropdown-toggle  bg-white text-dark" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">고객센터</a>
       
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/mall/mypage/myinfo">My Page</a></li>
          <li><a class="dropdown-item" href="/mall/notice/list">공지사항</a></li>
          <li><a class="dropdown-item" href="/mall/qna/list">1:1문의게시판</a></li>
          <li><a class="dropdown-item" href="${review}">후기</a></li>
          <li><a class="dropdown-item" href="/mall/recipe/recipe_listPage">마이레시피</a></li>
        </ul>
      </div>
    </div>
    </div>
    
 </header>
<!-- ########## HEADER 끝 ########## -->



</body>
<script>
   function needLogin(){
      alert("로그인 후 이용가능합니다.");
      location.href="/mall/member/login";
   }
   
   function join(){
      location.href="/mall/member/join";
   }
   
   function login(){
	   location.href="/mall/member/login"
   }
   

 
</script>
</html>