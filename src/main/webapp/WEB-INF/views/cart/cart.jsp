<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
/////////////////////////////////////////////////////
// List<Map<String, Object>> cartList = (List<Map<String, Object>>) request.getAttribute("cartList");
/* 데이터를 가져오는지 화면에서 확인해봅시다. */
// out.print(cartList);
// int size = cartList.size();
// out.print(size);
%>
<html>
<head>
<%@ include file="/resources/common/common.jsp" %>

<style>
</style>

</head>
<title>내 장바구니</title>
<body>

<!--========= 헤더 =========-->
<%@include file="/resources/layout/header.jsp"%>
<%@include file="/resources/layout/nav.jsp"%>
<!--========= 헤더 =========-->
<%out.print(m_id2); %>
<section class="container">
<div class="h3">
<b><%=m_id2%></b> 님의 장바구니
</div>
	<c:choose>
		<%-- if 장바구니가 비어있으면 문구 출력 else 장바구니 리스트 출력 --%>
		<c:when test="${cartList.size() == 0 and not doneLoop}">
			장바구니가 비어있습니다.
		</c:when>
		<c:otherwise>
			<table class="table border">
				<colgroup>
					<col width=3%><!-- 체크박스 -->
					<col width=15%><!-- 이미지 -->
					<col width=12%><!-- 상품이름 -->
					<col width=12%><!-- 상품금액 -->
					<col width=12%><!-- 수량 -->
					<col width=12%><!-- 합계 -->
					<col width=12%><!-- 배송비 -->
				</colgroup>
				<thead>
					<tr>
						<th><input class="form-check-input" type="checkbox" name="cb_cartProduct_all" value="${row.cart_no}"/></th>
						<th>이미지</th>
						<th>상품이름</th>
						<th>상품금액</th>
						<th>수량</th>
						<th>합계</th>
						<th>배송비</th>
					</tr>
				</thead>
				<c:set var="total" value="0" />
				<c:forEach var="row" items="${cartList}" varStatus="status">
					<c:set var="rowSum" value="0" />
					<tr>
						<!-- 상품체크박스 -->
						<td><input class="form-check-input" type="checkbox" name="cb_cartProduct" value="${row.CART_NO}" /></td>
						<!-- 상품그림 -->
						<td>이미지.img</td>
						<!-- 상품이름 -->
						<td>${row.PRODUCT_NAME}</td>
						<!-- 상품가격 -->
						<td><fmt:formatNumber value="${row.PRODUCT_PRICE}"/></td>
						<!-- 입력수량 -->
						<td>
							<div class = "amount_div">
							<input class="cart_amount_input" type="text" style="width:55px" value="${row.CART_AMOUNT}" >개<!-- 상품수량 입력 -->
                        			<button class="cart_amount plus_btn">+</button>
                        			<button class="cart_amount minus_btn">-</button>
                        		</div>	
                        		<a class="cart_amount_update_btn" data-cart_no="${row.CART_NO}">변경</a>
						</td>
						<!-- 상품합계 : 입력수량 * 상품합계 -->
						<c:set var="rowSum"
							value="${row.PRODUCT_PRICE * row.CART_AMOUNT}" />
						<td><fmt:formatNumber value="${rowSum}" /></td>
						<!-- 배송비 -->
						<td><fmt:formatNumber value="${row.PRODUCT_DLVYFEE}" /></td>
						<!-- 총 합계 : 총 상품합계 + 배송비 -->
						<c:set var="total"
							value="${total + rowSum + row.PRODUCT_DLVYFEE}" />
					</tr>
				</c:forEach>
			</table>
					<div class="alien">
						총 금액 : <fmt:formatNumber value="${total}" /> 원
					</div>

		</c:otherwise>
	</c:choose>
</section>
	<div>
	<button type="button" value="selectDelete" class="btn btn-dark" onclick="remove()">삭제</button>
	<button type="button" id="btnList">상품목록</button>
	</div>
	
<!-------------------- 장바구니 수량수정 : FORM START-------------------->
<form action="cartUpdate.do" method="post" class="cart_amount_update_form">
	<input type="hidden" name="cart_no" class="cart_no_update">
	<input type="hidden" name="cart_amount" class="cart_amount">
	<input type="hidden" name="m_id" value=<%=m_id2%>><!-- 여기여기 세션값 담아주기 -->
</form>
<!-------------------- 장바구니 수량수정 : FORM END-------------------->

</body>
</html>
<!-- productContents.js 추가 -->    
<script src="${path}/js/cart.js" type="text/javascript"></script>