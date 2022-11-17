<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.*, com.meaningfarm.util.PageBar" %>  
<%
	boolean isOk = false;
	if(request.getParameter("isOk")!=null){
		isOk = Boolean.parseBoolean(request.getParameter("isOk"));
	}
	List<Map<String,Object>> memberList = 
			(List<Map<String,Object>>)request.getAttribute("memberListAll");
	int size = 0;
	if(memberList!=null){
		size = memberList.size();
	}		
	//out.print(memberList);
	// 한 페이지에 출력될 로우의 수를 담음
	//int numPerPage = 10;
	int numPerPage = 3;
	// 내가 바라보는 페이지 번호 담음
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>  
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
<style type="text/css">
.scontainer {
	float: left;
	margin-top:  -40px;
	margin-left: 150px;
	margin-bottom: 50px;
}
#productListContainer {
	width: 70%;
	:A
	margin: 0 auto;
	float: right;
	margin-right: 100px;
	margin-bottom: 50px;
}
#ffooter {
	clear: both;
}
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


<script type="text/javascript">
let g_no=0; //그리드에서 선택이 바뀔때 마다 변경된 값이 저장됨.
let tb_value; // 사용자가 입력한 문자열 담기
let isOk = false;
function dlgIns_save(){
	//폼 전송 처리함.
	$("#f_boardIns").submit();
}
function dlgIns_close(){
	$("#dlg_boardIns").dialog('close');
}
function getMemberListAll(){
	// 사용자가 선택한 콤보박스에 value가 담김 - b_title or b_content or b_writer 
	cb_value = user_combo;
	tb_value = $("#tb_search").val(); // 사용자가 입력한 조건 검색 문자열
	console.log("콤보박스 값: "+cb_value+", 사용자가 입력한 키워드: "+ tb_value);
	location.href = "memberList?cb_search="+cb_value+"&tb_search="+tb_value;
	
}	//////////////////////////여기내꺼 확인좀해보자!!!!!!!!!!!!!!!!!!!!!!!!!!
function boardDetail(bm_no){
}


</script>


</head>
<body>
<script type="text/javascript">
	let user_combo="auth_id";//회원분류 || 아이디 || 이름 || 이메일 || 생일 || 가입일..
	// 전변 - javascript에서는 선언만 하고 선택을 하지 않았거나 값이 할당되지 않으면 
	// 그냥 null비교만 해서는 안된다.
	$(document).ready(function(){//DOM구성이 완료된 시점-자바스크립트로 태그접근,설정변경,이미지
		$("#dg_board").datagrid({
			onSelect:function(index,row){
				g_no = row.B_NO;
				console.log("g_no:"+g_no);
			},
			onDblClickCell: function(index, field, value){
				if("m_id" == field){
					location.href="./memberDetail?m_id="+g_no;
					g_no = 0;
					$("#dg_board").datagrid('clearSelections')
				}// if
			}//function
		});//데이터 그리드
		
		//검색 조건 콤보에 변경이 일어났을 때
		$('#cb_search').combobox({
			onChange:function(){
			user_combo = $("#cb_search").combobox('getValue'); // b_title or b_content or b_writer
			console.log(user_combo)
			}
		});

		$('#tb_search').textbox({
			icons: [{
				iconCls:'icon-search',
				handler: function(e){
					alert("검색");
					//$(e.data.target).textbox('setValue', 'Something added!');
					$("#dg_board").datagrid({

					});// datagrid
				}// handler
			}] // icons
		}); // textbox
	
	
	    /*===================== CRUD버튼 시작 ====================*/	    
		//조회버튼 클릭했을 때
	    $('#crudBtnSel').bind('click', function(){
	    	getMemberListAll();
	    });
		
		$('#crudBtnUpd').bind('click', function(){
	        alert('수정 버튼');
	    });	
		$('#crudBtnDel').bind('click', function(){
	        alert('삭제 버튼');
	    });			
	    /*===================== CRUD버튼 끝 ====================*/	    

	});///////////////// end of ready
</script>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
<!-- ########## sidebar 시작 ##########-->
<%@ include file="../../../resources/layout/sidebar.jsp"%>
<!-- ########## sidebar 끝 ##########-->
	<!-- ########## 회원 리스트 시작 ########## -->

 
<br><br><br>
	<div class="memberListContainer">
		<h1 class="pb-5 border-bottom-8 left-title">
			<b>회원리스트</b>
		</h1>
	<!--	<form action="/member/memberList" method="post" border="1" color="white" align="center" width="60%"> -->
		<form border="1" color="white" align="center" width="60%">
			<div class="sort-wrap ">
				<div class=" d-grid gap-2" style="width: 80%; margin-left: 30%">
					<div id="b_List">
						<select name="cb_search" id="cb_search" onchange="">
							<option selected>--선택--</option>
							<option value="auth_id">회원분류</option>
							<option value="m_id">아이디</option>
							<option value="m_email">이메일</option>
							<option value="m_name">이름</option>
							<option value="m_type">회원 등급</option>
						</select> 
						<input  type="text" style="width: 400px"  class="form-search right"
							name="searchText" value="${param.searchText}"
							placeholder="검색어를 입력해주세요">
						<button id="tb_search" name="tb_search" type="tb_search" role="button" class="btn btn-success m-1">검색</button>
					</div>
					
					
					<table id="dg_board" class="table table-hover table-borderless" width="400px" style="margin-left: -250px" border="0" cellpadding="0" cellspacing="0">
						<thead>
							<tr align="center" bgcolor="">
								<th><input class="form-check-input" type="checkbox" name="cb_product_all"></th>
								<th id="auth_id">회원분류</th>
								<th id="m_id">아이디</th>
								<th id="m_name">이름</th>
								<th id="m_email">이메일</th>
								<th id="m_birth">생일</th>
								<th id="m_registedate">가입일</th>
								<th id="m_type">회원등급</th>
								<th >삭제</th>
							</tr>
						</thead>


<%
	if(size==0){
		if(isOk){	
%> 	
<script>
	$.messager.alert('Info','조회결과가 없습니다.');
</script>
<%
		}
	}
	else if(size>0){
		//for(int i=0;i<size;i++){
		for(int i = nowPage*numPerPage; i<(nowPage*numPerPage)+numPerPage; i++){
			
			if(size == i) break;
			Map<String,Object> rMap = memberList.get(i);
%>	 						
						
						
						
						<tbody class="table-content">
<%
	};// end of if
} //end of for
%>
    						
							<c:forEach items="${memberListAll}" var="member">
								<tr onClick="location.href='/mall/member/memberDetail?m_id=${member.M_ID}'">
									<th><input class="form-check-input" type="checkbox" name="cb_member"></th>
									<th><c:out value="${member.AUTH_ID}" /></th>
									<th><c:out value="${member.M_ID}" /></th>
									<th><c:out value="${member.M_NAME}" /></th>
									<th><c:out value="${member.M_EMAIL}" /></th>
									<th><c:out value="${member.M_BIRTH}" /></th>
									<th><c:out value="${member.M_REGISTEDATE}" /></th>
									<th><c:out value="${member.M_TYPE}" /></th>
									<td><a href="${contextPath}/member/memberDelete?id=${member.M_ID }">X</a></td>
							</c:forEach>
						</tbody>
					</table>
		</form>
<!--########## 페이지네이션 ##########-->
		
		
			
	<div style="display:table-cell;vertical-align:middle; width:800px; background:#fff; height:30; border:1px solid #fff;">
<%
	String pagePath = "memberList";
	PageBar pb = new PageBar(numPerPage, size, nowPage, pagePath);
	out.print(pb.getPageBar());
%>
	</div>
	



<!-- ########## 페이지네이션 ########## -->
		
		
		
		
		<div id="b_memberList">
			<!-- <button id="crudBtnUpd"type="button" class="btn btn-dark" onclick="location.href='./productinsert'">수정</button> -->
			<button id="crudBtnUpd"type="button" class="btn btn-dark">수정</button>
			<button type="button" class="btn btn-dark">등록</button>
			<button type="button" class="btn btn-dark" onclick="delete()">삭제</button>
			<button id="crudBtnSel" type="button" class="btn btn-dark">조회</button>
		</div>
	</div>
	</div>
	</div>

	<hr>
	<br>
	<br>
	<br>

	<!-- ########## 회원 리스트 끝 ########## -->
<!--  <a  href="${contextPath}/member/registerForm"><h1 style="text-align:center">회원가입</h1></a> -->

<!-- ########## [[ footer 시작 ]] ##########-->
<%@ include file="../../../resources/layout/footer.jsp" %>
<!-- ########## [[ footer 끝 ]] ##########-->
</body>

<script type="text/javascript">
//체크박스 선택       
 jQuery(document).ready((function($){
   let doneLoop = '${doneLoop}';
   console.log(typeof(doneLoop));
   if(doneLoop === "true") {
      console.log("if문 거침");
//      $("#t_memberlist").html("");
//      $("#t_memberlist").remove();
      $("#dg_board").remove();
      $("#b_memberList").html("");
   }
   
   let cb_member = document.getElementsByName("cb_member");
   let cb_member_cnt = cb_member.length;
      
   $("input[name='memberListAll']").click(function(){
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
 
 
/* ########## 삭제하기 버튼 눌렀을 때 ########## */
function delete() {
   let obj = document.querySelectorAll("input[name='cb_member']"); //체크 박스 -> class가 check
   let noList = new Array();
   for (let i = 0; i< obj.length; i++) {
      if (obj[i].checked == true) {
         noList.push(obj[i].value);
         console.log(noList);
      }// if
   } // for
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
 }
 
</script>
</html>