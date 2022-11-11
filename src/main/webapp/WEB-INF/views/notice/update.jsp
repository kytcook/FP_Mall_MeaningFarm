<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../../../resources/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MEANINGFARM-글수정</title>
</head>
<body>
    <!---------------------- 헤더시작 -------------------->
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
    <!---------------------- 헤더끝---------------------->
<br>    
<br>    
<br>    
<br>    
    <!--글수정 화면 시작  -->
	<div class="container">
		<div class="row">
			<form action="update" role="form" method="post" name="update" enctype="multipart/form-data" >
				<input type="hidden" name="notice_no" value="${update.notice_no}" readonly="readonly"/>
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
				<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
				<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">	
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" 
							id="notice_title" name="notice_title" value="${update.notice_title}" maxlength="30"></td>					
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="작성자"  readonly="readonly" 
							id="admin_name" name="admin_name" value="${update.admin_name}"  maxlength="10"></td>					
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 내용"  
							id="notice_content" name="notice_content" value="${update.notice_content}" style="height: 300px"/></td>					
						</tr>
						<tr>
							<td id="fileIndex">
								<c:forEach var="file" items="${file}" varStatus="var">
								<div>
									<input type="hidden" id="noticefile_no" name="FILE_NO_${var.index}" value="${file.NOTICEFILE_NO}">
									<input type="hidden" id="noticefile_name" name="FILE_NAME" value="FILE_NO_${var.index}">
									
									<a href="#" id="fileName" onclick="return false;">${file.NOTICEFILE_NAME}</a>(${file.FILE_SIZE}kb)
									<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br> <!-- 삭제버튼보이기 -->
								</div>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
					<div>
						<button type="submit" class="btn btn-primary update_btn">저장</button>
						<button type="submit" class="btn btn-secondary cancel_btn">취소</button>
						<button type="button" class="fileAdd_btn">파일추가</button>
					</div>
			</form>
		</div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<!-- ########## 푸터 시작 ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## 푸터 끝 ########## -->

<!--스크립트 추가 영역  -->	
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='update']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			//취소버튼을 누르면 그글의 상세조회로 이동하게 처리함
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/notice/read?notice_no=${update.notice_no}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
		})
	

	function fn_addFile(){
	var fileIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});

	var fileNoArry = new Array();
	var fileNameArry = new Array();
	
	function fn_del(value, name){
		
		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
		}
	}
	</script>
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>
