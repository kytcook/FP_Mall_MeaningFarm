<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<%@ include file="../../../common/common.jsp" %>
</head>
<body>
게시판 목록
  <table id="t_productList" border="1">
    <th>상품명</th>
    <th>상품값</th>
    <th>상품상세</th>
    <th>배송비</th>
    <c:forEach items="${productSelectAll}" var="list">
  <tr>
      <td><a href="/product/productdetail?product_no=${list.product_no}"><c:out value="${list.product_name}" /></a></td>
      <td><c:out value="${list.product_price}" /></td>
      <td><c:out value="${list.product_detail}" /></td>
      <td><c:out value="${list.product_dlvyfee}" /></td>
    </tr>
    </c:forEach>
  </table>
</body>
</html>