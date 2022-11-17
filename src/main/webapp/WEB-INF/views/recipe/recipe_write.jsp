<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = (String)session.getAttribute("m_id"); //인클루드 jsp앞에 넣었을때 변수 선언해야함
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- forEach와 c:out를 쓰려면 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!--  fmt날짜 포맷을 써주려면 -->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MY RECIPE</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
  integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
  integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
  crossorigin="anonymous"></script>
</head>



<body>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->

  <div id="contents-wrapper" class="recipe_detail">
    <div class="xans-element- xans-product xans-product-additional detail_input">
      <div class="detail">
        <h1>MY RECIPE</h1>
        <div class="sort-wrap">
          <ul class="list_type1">
            <li>
              <span class="ico"></span>
              <p class="txt">MY RECIPE 게시판입니다</p>
            </li>
            <li>
              <span class="ico"></span>
              <p class="txt">구매 제품으로 나만의 레시피를 만들어 보세요 :)</p>
            </li>
          </ul>
          <!-- 제목과 게시판설명 -->
        </div>
        <hr >
        <form action="recipe_write" method="post" id="writeForm" enctype="multipart/form-data">
          <input type="text" name="recipe_title" class="form-control mt-4 mb-2"
          placeholder="제목을 입력해주세요." required
          >
          <input type="text" name="m_id" class="form-control mt-4 mb-2"
          value="<%=m_id %>" required readOnly
          >
          <div class="form-group">
            <textarea class="form-control" rows="10" name="recipe_content"
            placeholder="내용을 입력해주세요" required
            ></textarea>
          </div>
          <input name="recipe_pwd" placeholder="비밀번호를 입력해주세요 (문자+숫자 10글자 이내)" class="form-control mt-4 mb-2">
          <input type="file" name="file">
          <hr>

          <button type="submit" class="btn btn-success m-3" onclick="write_regi();" style="float:right">작성하기</button>
        </form>

      </div>
    </div>

  </div>
<!-- ########## footer 시작 ##########-->
<%@ include file="../../../resources/layout/footer.jsp" %>
<!-- ########## footer 끝 ##########-->
</body>

<style>
  body * {
  font-family: 'Noto Sans';
  font-weight: 400;
  letter-spacing: 0;
  }

  hr{
    background-color: #225f2a;
    height:3px;
  }

</style>
<!-- <script type="text/javascript">
	$(document).ready(function(e) {
		$('#write').click (function(){
			var frmArr =["title","content", "pwd"];
			//입력값 널 체크
			for (var i = 0; i<frmArr.length; i++){
				//alert(arr[i]);
				if($.trim($('#'+frmArr[i]).val()) == ''){
					alert ('빈칸을 모두 입력해주세요.');
					$('#' + frmArr[i].focus();
					return false;)
				}
			}
			//전송
			$('#frm').submit();
		})
	})
	
</script> -->

</html>