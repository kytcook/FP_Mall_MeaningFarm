<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!--========= 헤드 =========-->
<%@include file="../layout/head.jsp"%>
<!--========= 헤드 =========-->



<%
/////////////////////////////////////////////////////
List<Map<String, Object>> cartList = (List<Map<String, Object>>) request.getAttribute("cartList");
/* 데이터를 가져오는지 화면에서 확인해봅시다. */
int size = cartList.size();
out.print(size);
out.print(cartList);
%>
<body>
	<%-- 반복문을 on/off 하는 기능 --%>
	<c:set var="doneLoop" value="false"/>
	<c:choose>
		<%-- if 장바구니가 비어있으면 문구 출력 else 장바구니 리스트 출력 --%>
		<c:when test="${cartList.size() == 0 and not doneLoop}">
			장바구니가 비어있습니다.
		</c:when>
		<c:otherwise>
		<c:set var="doneLoop" value="true"/>
			<form id="f_cartIns" method="post" enctype="multipart/form-data"
				action="./cartInsert.do">
				<table class="table border">
					<thead>
						<tr>
							<td><input class="form-check-input" type="checkbox" name="cb_cartProduct_all" value="${row.cart_no}" /></td>
							<th>이미지</th>
							<th>상품이름</th>
							<th>상품금액</th>
							<th>수량</th>
							<th>총 금액</th>
							<th>배송비</th>
						</tr>
					</thead>
					<c:set var="total" value="0" />
					<c:forEach var="row" items="${cartList}">
						<c:set var="rowSum" value="0" />
						<tr>
							<!-- 상품체크박스 -->
							<td><input class="form-check-input" type="checkbox" name="cb_cartProduct" value="${row.cart_no}" /></td>
							<!-- 상품그림 -->
							<td>이미지.img</td>
							<!-- 상품이름 -->
							<td>${row.PRODUCT_NAME}</td>
							<!-- 상품가격 -->
							<td><fmt:formatNumber value="${row.PRODUCT_PRICE}"/></td>
							<!-- 입력수량 -->
							<td><input style="width: 55px" type="number" min="1"
								max="99" value="${row.CART_AMOUNT}" /></td>
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
					<tr>
						<td>합계 <fmt:formatNumber value="${total}" /> 원</td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
	<div>
	<button type="button" value="selectDelete" class="btn btn-dark" onclick="remove()">삭제</button>
	<button type="button" id="btnList">상품목록</button>
	</div>
	<script type="text/javascript">

// 상품목록 페이지로 이동
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="${path}/product/productList.do"
	});
});

/*--------------- 체크박스 선택 삭제 ---------------*/
//체크박스 선택       
$(document).ready(function(){
	let cb_cartProduct = document.getElementsByName("cb_cartProduct");
	let cb_cartProduct_cnt = cb_cartProduct.length;
		
	// 전체선택 : cb_cartProduct 이름을 가진 체크박스의 개수 만큼 반복하여 전체 체크박스 선택
	$("input[name='cb_cartProduct_all']").click(function(){
		let chk_listArr = $("input[name='cb_cartProduct']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
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

// 장바구니 상품 삭제
function remove() {
	let obj = document.querySelectorAll("input[name='cb_cartProduct']"); //체크 박스 -> class가 check
	let noList = new Array();
	for (let i = 0; i< obj.length; i++) {
		if (obj[i].checked == true) {
			noList.push(obj[i].value);
			console.log(noList);
		}
	}
	$.ajax({
        url: 'cartDelete.do',
		type: 'POST',
		traditional: true,
		dataType: 'text',
		data: {
            'cartProduct_nos': noList
		},
	}).done(function(res) {
		location.reload();
		})
	.fail(function (error) {
		console.log(JSON.stringify(error));
	})
}

</script>
</body>
</html>
