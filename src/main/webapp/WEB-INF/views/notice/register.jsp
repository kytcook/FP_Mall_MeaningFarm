<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>MEANINGFARM-글작성</title>
</head>
<body>
    <!---------------------- 헤더시작 -------------------->
  	<%@include file="../include/header.jsp" %>
    <!---------------------- 헤더끝-------------------- -->
    
    
        
    <!--글쓰기 화면 시작  -->
	<div class="container">
		<div class="row">
			<form action="register" method="post" enctype="multipart/form-data">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글번호" id="NOTICE_NO" name="NOTICE_NO" maxlength="30"></td>					
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" id="NOTICE_TITLE" name="NOTICE_TITLE" maxlength="30"></td>					
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="작성자" id="ADMIN_NAME" name="ADMIN_NAME" maxlength="10"></td>					
						</tr>
						<tr>
							<td><textarea type="text" class="form-control" placeholder="글 내용"  id="NOTICE_CONTENT" name="NOTICE_CONTENT" style="height: 300px"></textarea></td>					
						</tr>
				<!-- 		<tr>
							<td><input type="file" id="file" name="file" multiple/></td>					
						</tr>
 -->
					</tbody>
				</table>
				 <button type="submit" class="btn btn-primary">Submit</button>
                 <button type="reset" class="btn btn-danger">Reset</button>
 				<button type="button" id="listBtn" class="btn btn-secondary" style="float: right">List</button>    
			</form>
		</div>
	</div>
	


<!--리스트 버튼을 눌렀을떄 리스트페이지로 이동하기  -->	
<script type="text/javascript">
    document.getElementById("listBtn").onclick = function () {
    	console.log("list로 이동");
        location.href = 'list';
    };
</script>
	
	
	
	
	
	<!-- 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
