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
	
<!----------------------- FOOTER START ---------------------->
<%@include file="/resources/layout/footer.jsp"%>
<!------------------------ FOOTER END ----------------------->
  
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
<script>
/*------------------------- 수량수정 START -------------------------*/
/* 수량증감버튼 */
$(document).ready(function () {
	// 증가버튼
	$(".plus_btn").on("click", function(){
		let cart_amount = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++cart_amount);
	});
	
	// 감소버튼
	$(".minus_btn").on("click", function(){
		let cart_amount = $(this).parent("div").find("input").val();
		if(cart_amount > 1){
			$(this).parent("div").find("input").val(--cart_amount);		
		}
	});
	
/* 수량 변경 버튼 */
	// 장바구니 번호와 수량을 구해와서 <form>태그 내부에 작성된 <input>태그에 저장한 후, <form>태그를 서버로 전송/제출
	$(".cart_amount_update_btn").on("click", function(){
			let cart_no = $(this).data("cart_no");
			let cart_amount = $(this).parent("td").find("input").val();
			$(".cart_no_update").val(cart_no);
			$(".cart_amount").val(cart_amount);
			$(".cart_amount_update_form").submit();
// 			alert("장바구니 번호 : "+cart_no +" / 장바구니 수량 : "+ cart_amount);
		});
		
});// end of (document).ready
/*-------------------------- 수량수정 END -------------------------*/

/*------------------------- 체크박스 START-------------------------*/
/* 체크박스 선택 */
$(document).ready(function(){
	// 체크박스의 name을 가져와서 체크박스와 체크된 박스 개수만큼 dom을 구성
	let cb_cartProduct = document.getElementsByName("cb_cartProduct");
	let cb_cartProduct_cnt = cb_cartProduct.length;
		
	// 전체선택 : cb_cartProduct 이름을 가진 체크박스의 개수 만큼 반복하여 전체 체크박스 선택
	$("input[name='cb_cartProduct_all']").click(function(){
		let chk_listArr = $("input[name='cb_cartProduct']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	
	// 체크박스가 만약 모두 클릭됐다면 전체체크박스 활성화/비활성화
	$("input[name='cb_cartProduct']").click(function(){
		console.log("클릭됐슴다");
		if($("input[name='cb_cartProduct']:checked").length == cb_cartProduct_cnt){
			$("input[name='cb_cartProduct_all']")[0].checked = true;
		}
		else{
			$("input[name='cb_cartProduct_all']")[0].checked = false;
		}
	});
});
/*-------------------------- 체크박스 END--------------------------*/

/*--------------------- 장바구니 상품 삭제 START ---------------------*/
/* 삭제버튼 클릭 이벤트 */
function remove() {
	// 장바구니상품 체크박스에 쿼리를 모두 담아옴
	let obj = document.querySelectorAll("input[name='cb_cartProduct']"); //체크 박스 -> class가 check
	console.log(obj);
	let noList = new Array();
	for (let i = 0; i< obj.length; i++) {
		if (obj[i].checked) {
			noList.push(obj[i].value);
			console.log(noList);
		}
	}
	$.ajax({
		type: 'POST',
        url: 'cartDelete.do',
		traditional: true,
		dataType: 'text',
		data: {
            'cartProduct_nos': noList
		},
	}).done(function(res) {
		location.reload();
		})
	  .fail(function (error) {
		console.log("에러발생:" + JSON.stringify(error));
	})
}
/*---------------------- 장바구니 상품 삭제 END ----------------------*/

/*-------------------- 상품목록 페이지로 이동 START--------------------*/
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="/mall/product/productList"
	});
});
/*--------------------- 상품목록 페이지로 이동 END --------------------*/
</script>