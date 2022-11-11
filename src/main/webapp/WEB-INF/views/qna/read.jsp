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

<title>MEANINGFARM-qna상세보기</title>
</head>
<body>
	<!---------------------- 헤더시작 -------------------->
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
	<!---------------------- 헤더끝-------------------- -->

	<!--글상세 화면 시작  -->
	<div class="container">
		<div class="row">
			<form name="read" role="form" method="post">
				<input type="hidden" id="qna_no" name="qna_no"
					value="${read.qna_no}" /> <input type="hidden" id="page"
					name="page" value="${scri.page}"> <input type="hidden"
					id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword}">
			</form>

			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">글상세내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label for="notice_no">글 번호</label> <input type="text"
							class="form-control"
							style="text-align: center; font-weight: bold"
							value="${read.qna_no}번" readonly="readonly" id="qna_no"
							name="qna_no" maxlength="30"></td>
					</tr>
					<tr>
						<td><label for="notice_no">문의종류</label> <input type="text"
							class="form-control"
							style="text-align: center; font-weight: bold"
							value="${read.qna_pw}" readonly="readonly" id="qna_pw"
							name="qna_pw" maxlength="30"></td>
					</tr>
					<tr>
						<td><label for="qna_title">글 제목</label> <input type="text"
							class="form-control"
							style="text-align: center; font-weight: bold" readonly="readonly"
							id="qna_title" name="qna_title" value="${read.qna_title}"
							maxlength="30"></td>
					</tr>
					<tr>
						<td><label for="m_id">작성자</label> <input type="text"
							class="form-control"
							style="text-align: center; font-weight: bold" readonly="readonly"
							id="m_id" name="m_id" value="${read.m_id}" maxlength="10">
						</td>
					</tr>
					<!-- 좋아요 -->
					<tr>
						<td><label for="qna_like">좋아요</label> <input type="text"
							class="form-control"
							style="text-align: center; font-weight: bold" readonly="readonly"
							id="qna_like" name="qna_like" value="${getLike}" maxlength="10">
						</td>
					</tr>
					<!--글내용  -->
					<tr>
						<td><label for="qna_content">내용</label> <input type="text"
							class="form-control" readonly="readonly" id="qna_content"
							name="qna_content" value="${read.qna_content}"
							style="height: 200px" /></td>
					</tr>


					<!--  댓글추가 -->
					<tr>
						<td>
							<div id="reply">
								<ol class="replyList">
									<!-- 폼끝 -->
									<c:forEach items="${replyList}" var="replyList">
										<li>
											<p>
												작성자 : <input type="text" readonly="readonly"
													class="admin_name" value="${replyList.admin_name}" /><br />
												작성 날짜 : <input type="text" readonly="readonly"
													class="qnareply_date" value="${replyList.qnareply_date}" /><br />
												<!--        작성자 : ${replyList.admin_name}<br />
						        작성 날짜 :  ${replyList.qnareply_date} -->
												<%--  ${replyList.qnareply_content} --%>
											</p>

											<p>
												<input type="text" readonly="readonly"
													class="qnareply_content"
													value="  ${replyList.qnareply_content}"
													style="width: 1200px; height: 200px;" />
											</p> 
											<!-- 수정 삭제 버튼 추가부분 -->
											<p>
												<button type="button" class="replyUpdate" data-qnareply_no="${replyList.qnareply_no}">수정</button>
												<button type="button" class="replyDelete" data-qnareply_no="${replyList.qnareply_no}">삭제</button>
											</p>
											<!-- 수정 삭제 버튼 추가부분 끝-->
										</li>
									</c:forEach>
								</ol>
								<!-- 댓글 번호 정렬 끝-->
							</div>
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
		<!--  <button type="button" class="btn btn-primary LikeBtn"  style="float: right" >좋아요</button> -->
		<input type="image" id="LikeBtn" class="LikeBtn"
			style="float: right; width: 30px; height: 30px; margin: 5px"
			src="${pageContext.request.contextPath}/resources/image/unheart.png"
			alt="제출버튼">
		<!-- 빈하트 추가? -->
		<hr>
	</div>
	<!-- 컨테이너 끝 -->

	<!-- 댓글 쓰기 폼설정-->
	<div>
		<form name="replyForm" method="post">
			<input type="hidden" id="qna_no" name="qna_no" value="${read.qna_no}" />
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum"
				value="${scri.perPageNum}"> <input type="hidden"
				id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword"
				value="${scri.keyword}">

			<!-- 댓글 입력창 -->
			<div id="replyInput" class="container">
				<div>
					<label for="writer">댓글 작성자</label><input type="text"
						class="form-control" id="admin_name" name="admin_name" value="관리자" readonly/> <br />
					<label for="content">댓글 내용</label><input type="text"
						class="form-control" style="height: 200px" id="qnareply_content"
						name="qnareply_content" />
				</div>
				<div>
					<button type="button" class="btn btn-success replyWriteBtn"
						style="float: right">작성</button>
				</div>

			</div>
			<!-- 댓글 입력창 끝-->
		</form>
	</div>
	<!-- 댓글 쓰기 폼설정 끝-->

<!-- ########## [[ 푸터 시작 ]] ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## [[ 푸터 끝 ]] ########## -->


	<!-------------------------------------------------------------------------------------------------------------------->

	<!-- 댓글 수정 -->
	<script>
	  $(".replyUpdate").click(function(){
	   self.location = "/mall/qna/replyUpdate?qna_no=${read.qna_no}"
	    + "&page=${scri.page}"
	    + "&perPageNum=${scri.perPageNum}"
	    + "&searchType=${scri.searchType}"
	    + "&keyword=${scri.keyword}"
	    + "&qnareply_no=" + $(this).attr("data-qnareply_no");        
	  });
	
	  $(".replyDelete").on("click", function(){
			location.href = "/mall/qna/replyDeleteView?qna_no=${read.qna_no}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&qnareply_no="+$(this).attr("data-qnareply_no");
		});
	  
	  
	 </script>


	<!--스크립트 모음 -->
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='read']");
			
			// 수정 
			$("#update_btn").on("click", function(){
				formObj.attr("action", "/mall/qna/update");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제버튼 눌러서 삭제팝업띄우기
			$("#delete_btn").on("click", function(){
				var deleteYN = confirm("정말 삭제하시겠습니까?");//deleteYN 변수선언
				if(deleteYN == true){
					
				formObj.attr("action", "/mall/qna/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			});
			
			// 리스트로 돌아가기
			$(".list_btn").on("click", function(){
				location.href = "/mall/qna/list?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
		}) 
			
		
			//댓글 전송	
		$(".replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/mall/qna/replyWrite");
		  formObj.submit();
		});
</script>


<script>

$(function() { // 스크립트 시작문
	// 좋아요 
	var likeval = ${getLike};
	
	let qna_no = ${read.qna_no};
	let m_id = '${read.m_id}';
	let qna_like = 1;
	
	if(likeval > 0){
		console.log(likeval + "좋아요를 누르셨습니다.");
		$('.LikeBtn').html("좋아요 취소");
		$('.LikeBtn').click(function() {
		
			$.ajax({
				type :'post',
				url : '<c:url value ="/qna/likeDown"/>',
				contentType: 'application/json',
				data : JSON.stringify(
						{
							"qna_no" : qna_no,
							"m_id" : m_id,
							"qna_like" : qna_like
						}		
					),
				success : function(data) {
					alert('좋아요를 취소하셨습니다.');
				}
			})// 아작스 끝
		});
		 $('.LikeBtn').attr('src', '${pageContext.request.contextPath}/resources/image/heart.png');
	}else{
		console.log(likeval + "좋아요 안누름")
		console.log(m_id);
		$('.LikeBtn').click(function() {
			$.ajax({
				type :'post',
				url : '<c:url value ="/qna/likeUp"/>',
				contentType: 'application/json',
				data : JSON.stringify(
						{
							"qna_no" : qna_no,
							"m_id" : m_id,
							"qna_like" : qna_like
						}		
					),
				success : function(data) {
					alert('좋아요를 누르셨습니다.');
				}
			})// 아작스 끝
	
		});
		
		
	}


}); //end of function




		
		
		
		
</script>


</body>
</html>
