<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../resources/common/common.jsp" %>
<%
	//String admin_name = mVO.login("admin_name");
	String m_id = (String)session.getAttribute("m_id"); //인클루드 jsp앞에 넣었을때 변수 선언해야함
	String admin_name = (String)session.getAttribute("admin_name"); 
	String m_email = (String)session.getAttribute("m_email"); 
 //  out.print(m_id); // ok
//   out.print(admin_name); // no
//   out.print(m_email);  // no
	//if(s_name != null){//인증 되었을 때 보여줄 페이지 출력  < 로그인 성공>
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>MEANINGFARM-글작성</title>
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
	<!--글쓰기 화면 시작  -->
	<div class="container" >
	
		<div class="row">
			<form action="/notice/write" method="post" name="write"  enctype="multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">공지사항
								작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" id="notice_title" name="notice_title"
								maxlength="30"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								value="관리자" id="admin_name" name="admin_name"
								maxlength="10" readonly></td>
						</tr>
						<tr>
							<td><textarea class="form-control"
									placeholder="글 내용" id="notice_content" name="notice_content"
									style="height: 300px"></textarea>
						    </td>
							<tr>
									<td id="fileIndex">
									</td>
							</tr>

					</tbody>
				</table>
				<button type="button" class="btn btn-primary write_btn" onclick="checkForm()">Submit</button>
				<button type="reset" class="btn btn-danger resetBtn">Reset</button>
				<button type="button" class="fileAdd_btn" id="fileAdd_btn" onclick="fn_addFile()">파일추가</button>	
				<button type="button" id="listBtn" class="btn btn-secondary"style="float: right">List</button>
			</form>
			<!-- 폼종료 -->


		</div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<!-- ########## [[ 푸터 시작 ]] ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## [[ 푸터 끝 ]] ########## -->
<!-- 스크립트 -->
<!--리스트 버튼을 눌렀을떄 리스트페이지로 이동하기  -->
	<script type="text/javascript">
		document.getElementById("listBtn").onclick = function() {
			console.log("list로 이동");
			location.href = 'list';
		};
	</script>

	<script type="text/javascript">
		//공백 유효성 검사
		function checkForm() {
			var formObj = $("form[name='write']"); //폼 객체 선언
			var notice_title = document.write.notice_title;
			// 아이디 입력 유무 체크    
			if (notice_title.value == '' || notice_title.value.length == 0) {
				window.alert("제목을 입력하시오");
				document.write.notice_title.focus();
				document.getElementById('userId').select();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지   
			}
			var notice_content = document.write.notice_content; // 암호 입력 유무 체크    
			if (document.write.notice_content.value == '' || notice_content.value.length == 0) {
				alert('내용을 입력하세요.');
				document.write.notice_content.focus();
				return false;
			}
			
			alert('입력하시겠습니까?');
			formObj.attr("action", "/mall/notice/write");
			formObj.attr("method", "post");
			formObj.submit();
			
		}
		</script>
		
	<script type="text/javascript">
	
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>"); 
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
	
		};
	</script>


</body>
</html>
