<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>회원정보 출력창</title>
<%@ include file="../../../common/common.jsp" %>
<style type="text/css">
body 
* {
	font-family: 'Noto Sans';
	font-weight: 400;
	letter-spacing: 0;
}

.d-grid gap-2 {
	border-left: 3;
}

.table {
	border-top: 2px solid #225f2a;
}

.btnArea {
	border-top: 2px solid #225f2a;
}

.button {
	margin-top: 20px;
	display: inline-block;
	text-align: center;
	background-color: #2f623a;
	border: 1px solid #293824;
	color: #fff;
	font-size: 13px;
}

.board_pg_area {
	clear: both;
	text-align: center;
	padding-bottom: 15px;
	font-size: 0px;
}

#memberList{
	font-size:20px;
	margin-bottom:100px;
}

#userinputDiv>h2{
		padding-top: 20px;
		padding-left: 20px;
	}

	
#userinputDiv{
	height:600px;
	background-color:white;
}

	
</style>

</head>
<body>

<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/anav.jsp" %>
<!-- ########## [[ 헤더 끝 ]] ########## -->



<!-- ########## sidebar 시작 ##########-->
<%@ include file="../../../layout/sidebar.jsp"%>
<!-- ########## sidebar 끝 ##########-->

	<!-- ########## 회원 리스트 시작 ########## -->
	
	
<%--  [[ 내꺼 ]] 
	<form action="/member/memberList" method="post">
	<table border="1" color="white"  align="center"  width="60%">
	    <tr align="center"   bgcolor="lightgray">
	      <th><b>회원분류</b></th>
	      <th><b>아이디</b></th>
	      <th><b>이름</b></th>
	      <th><b>비밀번호</b></th>
	      <th><b>이메일</b></th>
	      <th><b>생일</b></th>
	      <th><b>삭제</b></th>
	   </tr>
	   
	 <c:forEach var="member" items="${memberListAll}" >     
	   <tr align="center">
	      <th>${member.auth_id}</th>
	      <th>${member.m_id}</th>
	      <th>${member.m_name}</th>
	      <th>${member.m_pw}</th>
	      <th>${member.m_email}</th>
	      <th>${member.m_birth}</th>
	      <td><a href="${contextPath}/member/memberDelete?id=${member.m_id }">X</a></td>
	    </tr>
	  </c:forEach>   
	</table>
	</form>
 --%>
 
 
 
<hr><br><br><br>




<div class="contatiner">
   <div class="pb-3 py-12 text-center">
      <h1 class="pb-5 border-bottom left-title"><b>회원리스트</b></h1>
    </div>
    
 <form action="/member/memberList" method="post" border="1" color="white"  align="center"  width="60%">
        <div class="sort-wrap ">
          <!-- 제목과 게시판설명 -->

        <!-- 정렬 -->
          <div class="d-grid gap-2">
              <div class="col-auto" >
                <button type="search" role="button" class="btn btn-success m-1">검색</button>
                <input type="text" style="width : 200px" class="form-search right" name="searchText" value="${param.searchText}" 
                placeholder="검색어를 입력해주세요">
              </div>
          </div> 
        </div>
          
          <div class="sort m-3" style="float: right;">
            <select name="" id="" onchange="">
                <option value="">--선택--</option>
                <option value="1">회원분류</option>
                <option value="2">아이디</option>
                <option value="3">이메일</option>
                <option value="4">이름</option>
                <option value="5">회원 등급</option>
            </select>
          </div>        
        <table class="table table-hover table-borderless" width="60%" border="0" cellpadding="0" cellspacing="0">
          <thead>
            <tr align="center"   bgcolor="">
              <th scope="col" >회원분류</th>
              <th scope="col" >아이디</th>
              <th scope="col" >이름</th>
              <th scope="col" >이메일</th>
              <th scope="col" >생일</th>
              <th scope="col" >가입일</th>
              <th scope="col" >회원등급</th>
              <th scope="col" >삭제</th>
            </tr>
          </thead>
          <tbody class="table-content">
          <c:forEach items="${memberListAll}"  var="member">
                 <tr >
                 <th><c:out value="${member.auth_id}" /></th>
                 <th><c:out value="${member.m_id}" /></th>
                 <th><c:out value="${member.m_name}" /></th>
                 <th><c:out value="${member.m_email}" /></th>
                 <th><c:out value="${member.m_birth}" /></th>
                 <th><c:out value="${member.m_registedate}" /></th>
                 <th><c:out value="${member.m_type}" /></th>
             <!--     <td><a href="${contextPath}/member/memberDelete?id=${member.m_id }">X</a></td> -->
            </c:forEach>
          </tbody>
        </table>
        </form>
</div>	
</div>	
</div>	
	









		<hr>

		<div class="contatiner" style="width: 70%">

			<h2><b>회원 리스트!</b></h2>
			<div class="table-responsive">
				<table class="table table-md" align="center" margin-left="20px">
					<thead>
						<tr>
							<th scope="col">회원분류</th>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">이메일</th>
							<th scope="col">생일</th>
							<th scope="col">가입일</th>
							<th scope="col">회원등급</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberListAll}" var="member">
							<tr>
								<td scope="col"><c:out value="${member.auth_id}" /></td>
								<td scope="col"><c:out value="${member.m_id}" /></td>
								<td scope="col"><c:out value="${member.m_name}" /></td>
								<td scope="col"><c:out value="${member.m_email}" /></td>
								<td scope="col"><c:out value="${member.m_birth}" /></td>
								<td scope="col"><c:out value="${member.m_registedate}" /></td>
								<td scope="col"><c:out value="${member.m_type}" /></td>
								<td scope="col"><a href="${contextPath}/member/memberDelete?m_id=${member.m_id }">X</a></td>
							</tr>

						</c:forEach>


					</tbody>
				</table>
			</div>
			</main>
		</div>
	</div>
	
	
	
	
		<hr><br><br><br>
<!-- 민지님꺼  -->

	<div class="contatiner" style="width: 80%">
		<table id="t_memberlist" class="table">
			<th><input class="form-check-input" type="checkbox"name="memberlistAll"></th>
				<th scope="col">회원분류</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">생일</th>
				<th scope="col">가입일</th>
				<th scope="col">회원등급</th>
			<c:set var="doneLoop" value="false" />
			<c:forEach items="${memberListAll}" var="list" varStatus="status">
				<c:choose>
					<c:when test="${m_id eq null and not doneLoop}">
						<h2><b>회원 리스트</b></h2>
						<c:set var="doneLoop" value="true" />
					</c:when>
					<c:when test="${m_id eq list.m_id}">
						<tr>
							<td>
							<input class="form-check-input" type="checkbox" name="cb_member" value="${memberListAll}"></td>
							<td>
							<%-- <a href="/mall/member/productdetail?=${memberListAll}"> --%>
							<c:out value="${memberListAll}" /></a></td>
								<td scope="col"><c:out value="${member.auth_id}" /></td>
								<td scope="col"><c:out value="${member.m_id}" /></td>
								<td scope="col"><c:out value="${member.m_name}" /></td>
								<td scope="col"><c:out value="${member.m_email}" /></td>
								<td scope="col"><c:out value="${member.m_birth}" /></td>
								<td scope="col"><c:out value="${member.m_registedate}" /></td>
								<td scope="col"><c:out value="${member.m_type}" /></td>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
		</table>
	</div>
	
	<div id="b_memberList">
		<!-- <button type="button" class="btn btn-warning" onclick="location.href='./productinsert'">등록</button> -->
		<button type="button" class="btn btn-dark" onclick="delete()">삭제</button>
	
	
	
	<!-- ########## 회원 리스트 끝 ########## -->
<!--  <a  href="${contextPath}/member/registerForm"><h1 style="text-align:center">회원가입</h1></a> -->





<!-- ########## [[ footer 시작 ]] ##########-->
<%@ include file="../../../layout/footer.jsp" %>
<!-- ########## [[ footer 끝 ]] ##########-->
    
</body>

<script>
//체크박스 선택       
/* jQuery(document).ready((function($){
   let doneLoop = '${doneLoop}';
   console.log(typeof(doneLoop));
   if(doneLoop === "true") {
      console.log("if문 거침");
//      $("#t_memberlist").html("");
      $("#t_memberlist").remove();
      $("#b_memberList").html("");
   }
   
   let cb_member = document.getElementsByName("cb_member");
   let cb_member_cnt = cb_member.length;
      
   $("input[name='memberlistAll']").click(function(){
      var chk_listArr = $("input[name='cb_member']");
      for (var i=0; i<chk_listArr.length; i++){
         chk_listArr[i].checked = this.checked;
      }
   });
   $("input[name='cb_member']").click(function(){
      if($("input[name='cb_member']:checked").length == cb_product_cnt){
         $("input[name='memberlistAll']")[0].checked = true;
      }
      else{
         $("input[name='memberlistAll']")[0].checked = false;
      }
   });
}));
 */
// 삭제하기
function delete() {
   let obj = document.querySelectorAll("input[name='cb_member']"); //체크 박스 -> class가 check
   let noList = new Array();
   for (let i = 0; i< obj.length; i++) {
      if (obj[i].checked == true) {
         noList.push(obj[i].value);
         console.log(noList);
      }
   }
   $.ajax({
      type: 'POST',
        url: 'memberDelete',
      traditional: true,
      dataType: 'text',
      // contentType: 'application/json; charset=utf-8',
      data: {
            'product_nos': noList
      },
   }).done(function(res) {
      location.reload();
      })
   .fail(function (error) {
      console.log(JSON.stringify(error));
   })
}

 
</script>
</html>