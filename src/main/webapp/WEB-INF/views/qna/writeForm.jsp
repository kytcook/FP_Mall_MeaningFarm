<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="../../../resources/common/common.jsp" %>   
<%
	String m_id = (String)session.getAttribute("m_id"); //인클루드 jsp앞에 넣었을때 변수 선언해야함
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna 글입력</title>
</head>
<body>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
<!--글쓰기 화면 시작  -->
	<div class="container">
		<div class="row">
			<form action="write" method="post" name="write">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">문의사항 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<!-- 카테고리 테이블을 따로 만듦. 컬럼을 파서 담아서 넘김 -->
							<td>
							<!-- name="searchType" --> 
							  <select id="qna_pw" name="qna_pw" class="form-control" >
							    <option value="n">=== 문의 종류 선택 ===</option>
							    <option value="상품문의">상품문의</option>
							    <option value="농장문의">농장문의</option>
							    <option value="베송문의">배송문의</option>
							    <option value="기타">기타</option>
							  </select>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" id="qna_title" name="qna_title"
								maxlength="30"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								value="<%=m_id %>" id="m_id" name="m_id"
								maxlength="10" readonly></td>
						</tr>
						<tr>
							<td><textarea class="form-control"
									placeholder="글 내용" id="qna_content" name="qna_content"
									style="height: 300px"></textarea>
						    </td>

					</tbody>
				</table>
				<button type="submit" class="btn btn-primary write_btn" onclick="checkForm()">Submit</button>
				<button type="reset" class="btn btn-danger resetBtn">Reset</button>
				<button type="button" id="listBtn" class="btn btn-secondary"style="float: right">List</button>
			</form>
			<!-- 폼종료 -->


		</div>
	</div>
<!-- ########## [[ 푸터 시작 ]] ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## [[ 푸터 끝 ]] ########## -->



<!----------------스크립트 시작--------------------->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		document.getElementById("listBtn").onclick = function() {
			console.log("list로 이동");
			location.href = 'list';
		};
	</script>

</body>
</html>