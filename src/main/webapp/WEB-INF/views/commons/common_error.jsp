<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="content container-fluid">
		<h3><i class="fa fa-warning text-red"></i> ${exception.getMessage() }</h3>
		<ul>
			<c:forEach items="${exception.getStackTrace()}" var="stack">
			<li> ${stack.toString() }</li>
			</c:forEach>
		</ul>
	</section>
</body>
</html>