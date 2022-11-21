<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = (String)session.getAttribute("m_id"); //인클루드 jsp앞에 넣었을때 변수 선언해야함
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MY RECIPE</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
     rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
     integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
     crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
     integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
     crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
     integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
     crossorigin="anonymous"></script>
     <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
<body>
  <div id="contents-wrapper" class="recipe_detail">
    <div class="xans-element- xans-product xans-product-additional detail_input">
      <div class="detail">
        <h1>MY RECIPE VIEW</h1>
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
        </div>
          <!-- 제목과 게시판설명 -->
        <hr >
        <!-- 읽어오는 내용 -->
        <form  method="post" name="readForm">
          <input type="text" id ="recipe_title" name="recipe_title" value="${read.recipe_title}" class="form-control mt-4 mb-2" >
          <input type="text" id ="m_id" name="m_id" value="${read.m_id}" class="form-control mt-4 mb-2"
          placeholder="작성자" required>
          <div class="form-group">
            <textarea class="form-control" rows="10" name="recipe_content" id="recipe_content"
             required> <c:out value="${read.recipe_content}"/></textarea>
          </div>
          <br>
          <div>
             <p>조회수</p>
             <input id="recipe_hit" name="recipe_hit" value="${read.recipe_hit}" class="form-control mt-4 mb-2"></input>
          </div>
           <div>
             <label for="recipe_hit"> 좋아요</label>
             <input id="recipe_hit" name="recipe_hit" value="${read.recipe_like}"class="form-control mt-4 mb-2"></input>
          </div>
          <div>
             <label for="recipe_date"> 작성시간</label>
             <input id="recipe_date" name="recipe_date" value="${read.recipe_date}"class="form-control mt-4 mb-2"/>          
         </div>        
          <hr>
           <p class="btnArea">
              <a class="btn btn-success m-3" type ="submit" role="button" href="recipe_listPage" style="float: right">
                  목록
                </a>
                <!-- href = "/recipe/recipe_listPage?Page=${scri.page}" + &perPageNum=${scri.perPageNum}" + 
                "&searchType=${scri.searchType}&keyword=${scri.keyword}" -->
              <a href="./recipe_delete?recipe_no=${read.recipe_no}" class="btn btn-success delBtn m-3" type ="submit" role="button" style="float: right">
                  삭제
                </a>
                <a class="btn btn-success m-3" type ="submit" role="button" href="recipe_modify?recipe_no=${read.recipe_no}" style="float: right">
                  수정
                </a>
             </p>          
        </form>
      </div> <!--  end of detail -->
      
      <!-- 댓글시작 -->
      <br>
      <br>
      <br>
      <br>
      <hr />      
      <div id="reply">
        <ol class="replyList">
          <c:forEach items="${replyList}" var="replyList">
            <li>
              <p class="form-control mt-4 mb-2">
              작성자 : ${replyList.m_id}<br />
              작성 날짜 :  ${replyList.recipe_re_date} <br/>
              ${replyList.recipe_re_content}
              </p>
              <div>
                 <button type="button" class="btn btn-success m-1 replyUpdateBtn" data-recipe_re_no="${replyList.recipe_re_no}"> 수정</button>
                 <button type="button" class="btn btn-success m-1 replyDeleteBtn" data-recipe_re_no="${replyList.recipe_re_no}"> 삭제</button>
              </div>              
            </li>
          </c:forEach>   
        </ol>
      </div>      
   <hr/>   
   <!-- 댓글 쓰기 -->
   <form name="replyForm" method="post">
        <input type="hidden" id="recipe_no" name="recipe_no" value="${read.recipe_no}" />

        <input type="hidden" id="page" name="page" value="${scri.page}"> 
        <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
        <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
        <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 

        <div>
          <label for="m_id">댓글 작성자</label><input type="text" id="m_id" name="m_id" value="<%=m_id %>" class="form-control mt-3 mb-2" />

          <label for="recipe_re_content">댓글 내용</label><input type="text" id="recipe_re_content" name="recipe_re_content" class="form-control mt-4 mb-2"/>

          <label for="recipe_re_pwd">비밀번호</label><input type="text" id="recipe_re_pwd" name="recipe_re_pwd" class="form-control mt-4 mb-2"/>
             
        </div>
        <div>
             <button type="button" class="btn btn-success m-3 replyWriteBtn" style="float:right">작성</button>
        </div>
      </form>
       <!-- 댓글 끝 -->
    </div>

  </div>
  <script>
  //게시물 삭제 alert
   $(document).ready(function(){
      $(".delBtn").click(function(){
         if(confirm("삭제하시겠습니까?")){
            document.readForm.action ="${path}/recipe/recipe_delete"
            document.readForm.submit();
         }
      })
   })
    // 댓글 작성 버튼
    $(".replyWriteBtn").on("click",function(){
      var formObj = $("form[name='replyForm']");
      formObj.attr("action", "./replyWrite");
       formObj.submit();
   
   });   
   
   // 댓글 수정 view
   $(".replyUpdateBtn").on("click", function(){
      location.href = "recipe/replyUpdateView?recipe_no=${read.recipe_no}"
                  + "&page=${cri.page}"
                  +"&perPageNum=${cri.perPageNum}"
                  +"&recipe_re_no"+$(this).attr("data-recipe_re_no");
   })

   
   //댓글 삭제 view
   $(".replyDeleteBtn").on("click",function(){
      location.href = "/recipe/replyDeleteView?recipe_no=${read.recipe_no}"
                  +"&page=${cri.page}"
                  +"&perPageNum=${cri.perPageNum}"
                  +"recipe_re_no="+$(this).attr("data-recipe_re_no");
   })
   
   // 목록
/*    $(".list_btn").on("click", function(){
   
   location.href = "/board/list?page=${scri.page}"
   +"&perPageNum=${scri.perPageNum}"
   +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
   }) */

   </script>
  
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

</html>