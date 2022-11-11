<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../../../resources/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>MEANINGFARM</title>
</head>
<body>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
<br>
<br>
<br>
<br>
<br>
	<!--글쓰기 화면 시작  -->
	<div class="container">
		<div class="row">
				<form name="read" role="form" method="post">
				<input type="hidden" id="notice_no" name="notice_no" value="${read.notice_no}" /> 
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
				<input type="hidden" id="NOTICEFILE_NO" name="NOTICEFILE_NO" value=""> 
			</form>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">글상세내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<label for="notice_no">글 번호</label>
						<input type="text" class="form-control" style="text-align:center; font-weight : bold"
							value="${read.notice_no}번" readonly="readonly" id="notice_no"
							name="notice_no" maxlength="30"></td>
					</tr>
					<tr>
						<td>
							<label for="notice_title">글 제목</label>
						<input type="text" class="form-control" style="text-align:center; font-weight : bold"
							readonly="readonly" id="notice_title" name="notice_title"
							value="${read.notice_title}" maxlength="30"></td>
					</tr>
					<tr>
						<td>
						<label for="admin_name">작성자</label>						
						<input type="text" class="form-control" style="text-align:center; font-weight : bold"
							readonly="readonly" id="admin_name" name="admin_name"
							value="${read.admin_name}" maxlength="10">
						</td>
					</tr>
					<tr>
						<td>
						<label for="notice_content">내용</label>	
						<input type="text" class="form-control"
							readonly="readonly" id="notice_content" name="notice_content"
							value="${read.notice_content}" style="height: 300px" />
						</td>
					</tr>
					<tr>
						<td>
							<hr>
							<span>파일 목록</span>
							<div class="form-group" style="border: 1px solid #dbdbdb;">
								<c:forEach var="file" items="${file}">
								<!--파일이름+파일사이즈 보여주기 및 누르면 다운  -->
									<a href="#" onclick="fn_fileDown('${file.NOTICEFILE_NO}'); return false;">${file.NOTICEFILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
								</c:forEach>
							</div>
							<hr>
						</td>
					</tr>
					
				</tbody>
			</table>
			
		</div>
		<!-- 업데이트 삭제 리스트 버튼 추가 -->
		<button type="submit" id="update_btn"
			class="btn btn-warning update_btn">update</button>
		<button type="submit" id="delete_btn" class="btn btn-info delete_btn">delete</button>
		<button type="button" id="list_btn" class="btn btn-secondary list_btn"
			style="float: right">List</button>
	<hr>
	
	<!-- 이전글 다음글 추가 -->
   <div class=" bg-white rounded shadow-sm">
   <c:choose >
   <c:when test="${move.next != 9999}">
   
   <button type="button" class="btn btn-success mr-3 mb-3" onclick="location.href='/mall/notice/read?notice_no=${move.next}'"> <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>이전글</button>
      <a href="/mall/notice/read?notice_no=${move.next}" style="color: black"> ${move.nexttitle} </a>
   </c:when>
   
   <c:when test="${move.next == 9999}">
   <button type="button" class="btn btn-success mr-3 mb-3" disabled>이전글이 없습니다</button>
   </c:when>
   </c:choose>
   
   <br/>
   
   <c:choose>
   <c:when test="${move.last != 9999}">
   <button type="button" class="btn btn-success mr-3 " onclick="location.href='read?notice_no=${move.last}'"> <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>다음글</button>
   <a href="read?notice_no=${move.last}" style="color: black"> ${move.lasttitle} </a>
   </c:when>
   
   <c:when test="${move.last == 9999}">
   <button type="button" class="btn btn-success mr-3" disabled>다음글이 없습니다</button>
   </c:when>
   </c:choose>
   </div>
<!-- 이전글 다음글 추가 끝 -->
	
	
	
	
	</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<!-- ########## 푸터 시작 ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## 푸터 끝 ########## -->

<!------------------------------------------------------------------------------------------------------------------->

	<!--스크립트 모음 -->
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='read']");
			
			// 수정 
			$("#update_btn").on("click", function(){
				formObj.attr("action", "/mall/notice/update");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제버튼 눌러서 삭제팝업띄우기
			$("#delete_btn").on("click", function(){
				var deleteYN = confirm("정말 삭제하시겠습니까?");//deleteYN 변수선언
				if(deleteYN == true){
					
				formObj.attr("action", "/mall/notice/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			});
			
			// 리스트로 돌아가기
			$(".list_btn").on("click", function(){
				location.href = "/mall/notice/list?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
		}) 
			//파일다운 함수
			function fn_fileDown(noticefile_no){
			var formObj = $("form[name='read']");
			$("#NOTICEFILE_NO").attr("value", noticefile_no);
			formObj.attr("action", "/mall/notice/fileDown");
			formObj.submit();
		}
		
</script>


</body>
</html>
