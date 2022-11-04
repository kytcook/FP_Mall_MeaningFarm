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

<style>
.scontainer {
	float: left;
	margin-top: -40px;
	margin-left: 100px;
	margin-bottom: 50px;
}
#productListContainer {
	width: 70%;
	margin: 0 auto;
	float: right;
	margin-right: 120px;
	margin-bottom: 50px;
}
#ffooter {
	clear: both;
}
a {
	text-decoration: none;
	color: black;
}
table {
	text-align: center;
}
.pageDIV {
	text-align: center;
}
.pageUL li {
	list-style: none;
	float: left;
	padding: 6px;
}
.searchDIV {
	text-align: center;
}
</style>

<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/nav.jsp" %>
<div id="spController">
<%@ include file="../../../layout/sidebar.jsp" %>
<div id="productListContainer">
<h1>게시판 목록</h1>

<table id="t_productList" class="table table-hover">
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
				<tr onClick="location.href='/mall/product/productdetail?product_no=${list.product_no}'">
					<td><input class="form-check-input" type="checkbox" name="cb_product" value="${list.product_no}" ></td>
					<td><c:out value="${list.product_name}" /></td>
					<td><c:out value="${list.category_type_name}" /></td>
					<td><c:out value="${list.category_local_name}" /></td>
					<td><c:out value="${list.product_price}" /></td>
					<td><c:out value="${list.product_dlvyfee}" /></td>
				</tr>
			</c:when>
		</c:choose>
	</c:forEach>
</table>
<div id="b_productList">
	<button type="button" class="btn btn-warning" onclick="location.href='./productinsert'">등록</button>
	<button type="button" class="btn btn-dark" onclick="remove()">삭제</button>
</div>

<!-- start of page -->
<div class="pageDIV">
  <ul class="pageUL">
    <c:if test="${pageVO.prev}">
    	<li><a href="productlisttest${pageVO.makeSearch(pageVO.startPage - 1)}">&#60;</a></li>
    </c:if> 
    <c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
    	<li><a href="productlisttest${pageVO.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>
    <c:if test="${pageVO.next && pageVO.endPage > 0}">
    	<li><a href="productlisttest${pageVO.makeSearch(pageVO.endPage + 1)}">&#62;</a></li>
    </c:if> 
  </ul>
</div>
<!-- end of page -->
	
<!-- start of search -->
<div class="search">
	<select name="searchType" class="form-select">
		<option value="n"<c:out value="${searchVO.searchType == null ? 'selected' : ''}"/>>-----</option>
		<option value="t"<c:out value="${searchVO.searchType eq 't' ? 'selected' : ''}"/>>상품명</option>
		<option value="c"<c:out value="${searchVO.searchType eq 'c' ? 'selected' : ''}"/>>상품상세</option>
		<option value="tc"<c:out value="${searchVO.searchType eq 'tc' ? 'selected' : ''}"/>>상품명+상품상세</option>
	</select>
	<input type="text" class="form-select" name="keyword" id="keywordInput" value="${searchVO.keyword}"/>
	<button id="searchBtn" type="button" class="btn btn-warning">검색</button>
<script>
	$(function(){
		$('#searchBtn').click(function(e) {
			e.preventDefault();
			console.log("searchType 다음 " + $("select option:selected").val())
			console.log("keyword 다음 "+encodeURIComponent($('#keywordInput').val()))
	//		console.log("makeSearch " + ${pageVO.makeQuery(1)})
			self.location = "productlisttest" + '${pageVO.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
	});   
</script>
</div>
<!-- end of search -->

</div>
</div>

<%@ include file="../../../layout/footer.jsp" %>

<script type="text/javascript">
// 체크박스 선택       
$(document).ready(function(){
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
})
;
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