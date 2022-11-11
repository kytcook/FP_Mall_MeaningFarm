<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<!-- CSS only -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna.css" rel="stylesheet">
<!--  <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script> -->
<title>qna 리스트화면</title>
<%@ include file="../../../resources/common/common.jsp" %>
</head>
<body>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->


<!--문의게시판 글 내용 시작  -->
    <section class="qna">
      <div class="page-title">
        <div class="container">
          <h3>문의게시판</h3>
        </div>
      </div>

      <!-- board seach area -->
      <div id="board-search">
        <div class="container">
          <div class="search-window">
          <!--폼시작  -->
            <form action="get">

              <div class="search-wrap">
                    <!--검색 셀렉트박스  -->
                   <select name="searchType" >
    			  <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
     			  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>문의종류</option>
			      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
   				 </select>
   				 	<!--검색 셀렉트박스끝  -->
   				 	
                <input
                  id="keywordInput"
                  type="text"
                  name="keyword"
                  placeholder="검색어를 입력해주세요."
                  value="${scri.keyword}"
                />
                <button type="button" id="searchBtn" class="btn btn-dark">검색</button>
                <script>
			      $(function(){
			        $('#searchBtn').click(function() {
			          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			        });
			      });   
			    </script>

              
              
              
              </div>
            </form>
   			<!--폼 끝  -->        
   			
   			<!-- 글입력버튼 -->   

          </div>
        </div>
      </div>

      <!-- board list area -->
      <div id="board-list">
        <div class="container">
          <table class="board-table">
            <thead>
              <tr>
                <th scope="col" class="qna_no">글번호</th>
                <th scope="col" class="qna_title">제목</th>
                <th scope="col" class="qna_pw">문의종류</th>
                <th scope="col" class="m_id">작성자</th>
                <th scope="col" class="qna_regdate">등록일</th>
                <th scope="col" class="qna_state">답변여부</th>
              </tr>
              
            </thead>
            <tbody>
            <!-- 리스트 뿌려줄곳 시작 -->
        	<!-- 목록 시작 -->
			<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.qna_no}</td>
				<td>
				<a href="/mall/qna/read?qna_no=${list.qna_no}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
				<c:out value="${list.qna_title}" /></a>
				</td>
				<td>${list.qna_pw}</td>
				<td>${list.m_id}</td>
				<td>${list.qna_regdate}</td>
				<td>${list.qna_state}</td>
			</tr>
			</c:forEach>
			<!-- 목록 끝 -->
   			<!-- 리스트 뿌려줄곳 끝 -->

            </tbody>
          </table>
     
          		<!-- 글입력버튼 -->   
             <div style="display: inline-block; margin: 0 10px;  float: right;">
 				 <a href="#" id="writeBtn" class="btn btn-secondary">글쓰기</a>
			</div>
          <br>
        <br>
        <!--페이지네이션 시작  -->
        <div class="pagnation" style=" display: flex; justify-content : center;">
		  	<nav aria-label="..." style=" float: center;">
		  
		  <ul class="pagination">
		  
		     <c:if test="${pageMaker.prev}">
		    <li class="page-item">
		    <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">Prev</a>
		    </li>
		     </c:if> 
		     
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    <li class="page-item">
		    <a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
		    </li>
		     </c:forEach>


			 <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    <li class="page-item">
		      <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">Next</a>
		    </li>
		      </c:if> 
		      
		  </ul>
		</nav>
		</div>
        <!--페이지네이션 끝  -->
		
          </div>
          
        </div>

    </section>
<!-- 문의게시판 내용 끝 -->




<!-- ########## [[ 푸터 시작 ]] ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## [[ 푸터 끝 ]] ########## -->


<!--스크립트 처리  -->

<script type="text/javascript">
    document.getElementById("writeBtn").onclick = function () {
    	console.log("글쓰기폼으로 이동");
        location.href = 'writeForm';
    };
</script>






</body>
</html>