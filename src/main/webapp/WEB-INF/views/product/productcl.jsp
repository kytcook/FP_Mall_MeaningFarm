<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리-LOCAL</title>
<%@ include file="../../../resources/common/common.jsp" %>
</head>
<body>
<table border="1">
	<th>상품명</th>
	<th>상품가격</th>
	<c:forEach items="${ListCategoryLocal}" var="list" varStatus="status">
		<tr>
			<td><c:out value="${list.product_name}" /></td>
			<td><c:out value="${list.product_price}" /></td>
		</tr>
	</c:forEach>
</table>

</body>
</html>