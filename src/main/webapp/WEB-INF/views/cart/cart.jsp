<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!--========= 헤드 =========-->
<%@include file="../layout/head.jsp"%>
<!--========= 헤드 =========-->

<script>
// $(document).ready(function(){
// 	// 상품 한번 클릭시 상품번호 출력 : 나중에 페이지이동을 한번 클릭으로 옮기고 더블클릭 삭제할것.
// 	$(".productDelete").click(function() {
// 		let product_no = $(this).find(".CART_NO").text();
// 		console.log(product_no);
// 	});
	
	// 상품 두 번 클릭시 페이지 이동
// 	$(".productDelet").dblclick(function() {
// 		alert("상품눌리임");
// 		let product_no = $(this).find(".CART_NO").text();
// 		location.href = "cartDelete.do?cart_no="+cart_no
// 	});
// })
</script>

<%
/////////////////////////////////////////////////////
List<Map<String, Object>> cartList = (List<Map<String, Object>>) request.getAttribute("cartList");
/* 데이터를 가져오는지 화면에서 확인해봅시다. */
int size = cartList.size();
out.print(size);
%>
<body>
	<c:choose>
		<!-- if 장바구니가 비어있으면 문구 출력 else 장바구니 리스트 출력 -->
		<c:when test="${cartList.size() == 0}">
			장바구니 페이지입니다.
		</c:when>
		<c:otherwise>
			<form id="f_cartIns" method="post" enctype="multipart/form-data"
				action="./cartInsert.do">
				<table class="table border">
					<thead>
						<tr>
							<th><input type="checkbox" /></th>
							<th>이미지</th>
							<th>상품이름</th>
							<th>상품금액</th>
							<th>수량</th>
							<th>총 금액</th>
							<th>배송비</th>
							<th>취 소</th>
						</tr>
					</thead>
					<c:set var="total" value="0" />
					<c:forEach var="row" items="${cartList}">
						<c:set var="rowSum" value="0" />
						<tr>
							<!-- 상품체크박스 -->
							<td><input type="checkbox" /></td>
							<!-- 상품그림 -->
							<td>이미지.img</td>
							<!-- 상품이름 -->
							<td>${row.PRODUCT_NAME}</td>
							<!-- 상품가격 -->
							<td>${row.PRODUCT_PRICE}</td>
							<!-- 입력수량 -->
							<td><input style="width: 55px" type="number" min="1"
								max="99" value="${row.CART_AMOUNT}" /></td>
							<!-- 상품합계 : 입력수량 * 상품합계 -->
							<c:set var="rowSum"
								value="${row.PRODUCT_PRICE * row.CART_AMOUNT}" />
							<td><fmt:formatNumber value="${rowSum}" /></td>
							<!-- 배송비 -->
							<td><fmt:formatNumber value="${row.PRODUCT_DLVYFEE}" /></td>
							<!-- 삭제 -->
							<td class="productDelete">
								<a href="cartDelete.do?cart_no=${row.CART_NO}"></a>삭제
							</td>
							<!-- 총 합계 : 총 상품합계 + 배송비 -->
							<c:set var="total"
								value="${total + rowSum + row.PRODUCT_DLVYFEE}" />
						</tr>
					</c:forEach>
					<tr>
						<td>합계 <fmt:formatNumber value="${total}" /> 원</td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>
