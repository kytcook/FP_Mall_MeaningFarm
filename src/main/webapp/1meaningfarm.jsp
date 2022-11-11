<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String m_name = (String)session.getAttribute("m_name");
   String m_id = (String)session.getAttribute("m_id");
   //String m_id="test";
   String m_pw = (String)session.getAttribute("m_pw");
   
   //session = request.getSession();
   //out.println("m_id: "+session.getAttribute("m_id"));
    // m_id가 있니? 화면 보여주고 ,,, null이면 로그인을 하세요..
   out.print(m_id);
   out.print(m_name);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main 페이지</title>
<script>
	const logout = () => {
		window.location="./common/logout.jsp";
	}

</script>

<%@ include file="../common/common.jsp" %>

</head>
<body>

<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->




<!-- ########## Main  시작 ########## -->
<%@ include file="../../../layout/main.jsp" %>
<!-- ########## Main  끝 ########## -->


   

<!-- ########## footer 시작 ##########-->
<%@ include file="../../../resources/layout/footer.jsp" %>
<!-- ########## footer 끝 ##########-->


<script>
	//alert("로그인 해야 합니다.");
	//location.href="/mall/member/login";
</script> 

</body>
</html>  