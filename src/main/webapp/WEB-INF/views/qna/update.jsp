<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../resources/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<title>MEANINGFARM-qna상세보기</title>
</head>
<body>
	<!---------------------- 헤더시작 -------------------->
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->

	<!---------------------- 헤더끝-------------------- -->

	<!--글쓰기 화면 시작  -->
	<div class="container">
		<div class="row">
		<form name="read" role="form" method="post">
				<input type="hidden" id="qna_no" name="qna_no" value="${read.qna_no}" /> 
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			<!-- hidden으로 값 넘겨줌 -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">문의글수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<label for="notice_no">글 번호</label>
						<input type="text" class="form-control" style="text-align:center; font-weight : bold"
							value="${update.qna_no}번" readonly="readonly" id="qna_no"
							name="qna_no" maxlength="30"></td>
					</tr>
					<tr>
						<td>
						<label for="notice_no">문의종류</label>
						<input type="text" class="form-control" style="text-align:center; font-weight : bold"
							value="${update.qna_pw}" readonly="readonly" id="qna_pw"
							name="qna_pw" maxlength="30"></td>
					</tr>
					<tr>
						<td>
							<label for="qna_title">글 제목</label>
						<input type="text" class="form-control" style="text-align:center; font-weight : bold"
							 id="qna_title" name="qna_title"
							value="${update.qna_title}" maxlength="30"></td>
					</tr>
					<tr>
						<td>
						<label for="m_id">작성자</label>						
						<input type="text" class="form-control" style="text-align:center; font-weight : bold"
							readonly="readonly" id="m_id" name="m_id"
							value="${update.m_id}" maxlength="10">
						</td>
					</tr>
					<tr>
						<td>
						<label for="qna_content">내용</label>	
						<input type="text" class="form-control"
						 id="qna_content" name="qna_content"
							value="${update.qna_content}" style="height: 300px" />
						</td>
					</tr>
				</tbody>
			</table>
			
		<!-- 업데이트 삭제 리스트 버튼 추가 -->
		<button type="submit" class="btn btn-primary update_btn">저장</button>
		<button type="submit" class="btn btn-secondary cancel_btn">취소</button>
	</form>
		</div>
		</div>
		<div>
	
			
	</div>


<!-- ########## [[ 푸터 시작 ]] ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## [[ 푸터 끝 ]] ########## -->


<!-------------------------------------------------------------------------------------------------------------------->

	<!--스크립트 모음 -->
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='read']");
			
			// 수정 
			$("#update_btn").on("click", function(){
				formObj.attr("action", "/qna/update");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			//취소
				$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "/qna/read?qna_no=${update.qna_no}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";
			})
			
			
			
			// 리스트로 돌아가기
			$(".list_btn").on("click", function(){
				location.href = "/qna/list?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
		}) 
			
</script>


</body>
</html>
