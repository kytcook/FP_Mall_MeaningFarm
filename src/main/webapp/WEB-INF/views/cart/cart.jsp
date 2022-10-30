<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!--========= 헤드 =========-->
<%@include file="../layout/head.jsp"%>
<!--========= 헤드 =========-->

<!-- productList.css 추가하기 -->
<%
/////////////////////////////////////////////////////
List<Map<String,Object>> cartList =
	(List<Map<String,Object>>)request.getAttribute("cartList");
/* 데이터를 가져오는지 화면에서 확인해봅시다. */
	out.print(cartList);
%>
<body>
	장바구니 페이지입니다.
	<form id="f_cartIns" method="post" enctype="multipart/form-data" action="./cartInsert.do">
		<table class="table border">
			<thead>
				<tr>
					<th><input type="checkbox"/></th>
					<th>이미지</th>
					<th>상품이름</th>
					<th>상품금액</th>
					<th>수량</th>
					<th>총 금액</th>
				</tr>
			</thead>
				<c:set var = "total" value = "0"/>
				<c:forEach var="list" items="${cartList}">
				<c:set var = "rowSum" value = "0"/>
				<tr>
					<td><input type="checkbox"/></td>
					<!-- 상품그림 --><td>이미지.img</td>
					<!-- 상품이름 --><td><c:out value="${list.PRODUCT_NAME}"/></td>
					<!-- 상품가격 --><td><c:out value="${list.PRODUCT_PRICE}"/></td>
					<!-- 입력수량 --><td><input style="width:55px" type="number" min="1" max="99" value="${list.CART_AMOUNT}" /></td>
					<!-- 상품합계 -->
					<c:set var="rowSum" value="${list.PRODUCT_PRICE * 20}"/>
					<td><fmt:formatNumber value="${rowSum}"/></td>
					<!-- 총 합계 : 입력수량 * 상품합계 -->
					<c:set var="total" value="${total + rowSum}"/>
				</tr>
				</c:forEach>
				<tr>
					<td>합계 <fmt:formatNumber value="${total}"/></td>
				</tr>
		</table>
	</form>
</body>
</html>
