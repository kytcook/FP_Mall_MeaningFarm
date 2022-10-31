<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>	
<%@ include file="../../../common/common.jsp" %>
<h1>게시판 목록</h1>
<div width="1000">
<table id="t_productList" class="table">
	<th><input class="form-check-input" type="checkbox" name="cb_product_all"></th>
	<th>상품명</th>
	<th>카테고리-종류</th>
	<th>카테고리-지역</th>
	<th>상품가격</th>
	<th>배송비</th>
	<c:set var="doneLoop" value="false"/>
	<c:forEach items="${productSelectAll}" var="list" varStatus="status">
		<c:choose>
			<c:when test="${m_id eq null and not doneLoop}">
				<h1>판매자 권한 필요</h1>
				<c:set var="doneLoop" value="true"/>
			</c:when>
			<c:when test="${m_id eq list.m_id}">
				<tr>
					<td><input class="form-check-input" type="checkbox" name="cb_product" value="${list.product_no}" ></td>
					<td><a href="/mall/product/productdetail?product_no=${list.product_no}"><c:out value="${list.product_name}" /></a></td>
					<td><c:out value="${list.category_type_name}" /></td>
					<td><c:out value="${list.category_local_name}" /></td>
					<td><c:out value="${list.product_price}" /></td>
					<td><c:out value="${list.product_dlvyfee}" /></td>
				</tr>
			</c:when>
		</c:choose>
	</c:forEach>
</table>
</div>
<div id="b_productList">
	<button type="button" class="btn btn-warning" onclick="location.href='./productinsert'">등록</button>
	<button type="button" class="btn btn-dark" onclick="remove()">삭제</button>
</div>
<script>
// 체크박스 선택       
jQuery(document).ready((function($){
	let doneLoop = '${doneLoop}';
	console.log(typeof(doneLoop));
	if(doneLoop === "true") {
		console.log("if문 거침");
//		$("#t_productList").html("");
		$("#t_productList").remove();
		$("#b_productList").html("");
	}
	
	let cb_product = document.getElementsByName("cb_product");
	let cb_product_cnt = cb_product.length;
		
	$("input[name='cb_product_all']").click(function(){
		var chk_listArr = $("input[name='cb_product']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='cb_product']").click(function(){
		if($("input[name='cb_product']:checked").length == cb_product_cnt){
			$("input[name='cb_product_all']")[0].checked = true;
		}
		else{
			$("input[name='cb_product_all']")[0].checked = false;
		}
	});
}));
function remove() {
	let obj = document.querySelectorAll("input[name='cb_product']"); //체크 박스 -> class가 check
	let noList = new Array();
	for (let i = 0; i< obj.length; i++) {
		if (obj[i].checked == true) {
			noList.push(obj[i].value);
			console.log(noList);
		}
	}
	$.ajax({
		type: 'POST',
        url: 'productcheckdelete',
		traditional: true,
		dataType: 'text',
		// contentType: 'application/json; charset=utf-8',
		data: {
            'product_nos': noList
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