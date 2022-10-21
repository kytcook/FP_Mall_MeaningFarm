<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옵션 리스트</title>
<%@ include file="../../../common/common.jsp" %>
</head>
<body>
  <table id="t_optionList" border="1">
    <th>옵션명</th>
    <th>옵션값</th>
    <th>옵션가</th>
    <th>재고수량</th>
    <c:forEach items="${optionSelectAll}" var="list">
  <tr>
      <td><c:out value="${list.option_name}" /></td>
      <td><c:out value="${list.option_value}" /></td>
      <td><c:out value="${list.option_price}" /></td>
      <td><c:out value="${list.option_stock}" /></td>
    </tr>
    </c:forEach>
  </table>
</body>
</html>