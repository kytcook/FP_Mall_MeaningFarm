<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../common/easyui_common.jsp"%>

<%@ page import="java.util.*, com.meaningfarm.util.PageBar" %>  
<%
	boolean isOk = false;
	if(request.getParameter("isOk")!=null){
		isOk = Boolean.parseBoolean(request.getParameter("isOk"));
	}
	List<Map<String,Object>> memberList = 
			(List<Map<String,Object>>)request.getAttribute("memberList");
	int size = 0;
	if(memberList!=null){
		size = memberList.size();
	}		
	//out.print(memberList);
	// 한 페이지에 출력될 로우의 수를 담음
	//int numPerPage = 10;
	int numPerPage = 10;
	// 내가 바라보는 페이지 번호 담음
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>    
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>

<head>
<!-- <meta charset="UTF-8"> 이것때문에 한글깨짐.-->
<title>회원정보 출력창</title>
<style type="text/css">
#tb{
	margin-left:200px;
}


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
	border-top: 2px solid #225f2a;   /*  #568A35   */
}
.btnArea {
	border-top: 2px solid #568A35;
}
.button {
	margin-top: 20px;
	display: inline-block;
	text-align: center;
	background-color: #568A35;
	border: 1px solid #568A35;
	border-radius : 4px;
	color: #fff;
	font-size: 18px;
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
	let g_no = 0; //그리드에서 선택이 바뀔때 마다 변경된 값이 저장됨.
	let tb_value; // 사용자가 입력한 문자열 담기
	let isOk = false;
	function dlgIns_save(){
		//폼 전송 처리함.
		$("#f_boardIns").submit();
	}
	function dlgIns_close(){
		$("#dlg_boardIns").dialog('close');
	}
	function getMemberList(){
		// alert("getBoardList호출");     	   	
		// 사용자가 선택한 콤보박스에 value가 담김 - b_title or b_content or b_writer 
		cb_value = user_combo;
		tb_value = $("#tb_search").val(); // 사용자가 입력한 조건 검색 문자열
		console.log("콤보박스 값: "+cb_value+", 사용자가 입력한 키워드: "+ tb_value);
		location.href = "memberList?cb_search="+cb_value+"&tb_search="+tb_value;
		
	}	//////////////////////////여기내꺼 확인좀해보자!!!!!!!!!!!!!!!!!!!!!!!!!!
	function memberDetail(bm_no){
	}

	</script>
</head>


<body>
<script type="text/javascript">
	let user_combo="auth_id";//제목|내용|작성자
	// 전변 - javascript에서는 선언만 하고 선택을 하지 않았거나 값이 할당되지 않으면 
	// 그냥 null비교만 해서는 안된다.
	$(document).ready(function(){//DOM구성이 완료된 시점-자바스크립트로 태그접근,설정변경,이미지
	//	$('[data-bs-toggle="tooltip"]').tooltip()
		$("#dg_board").datagrid({
		//$("#dg_board").ready({
			onSelect:function(index,row){
				/* g_no = row.B_NO;
				console.log("g_no:"+g_no); */
				g_no = row.M_ID;
				console.log("g_no:"+g_no);
			},
			
			onDblClickCell: function(index, field, value){
				if("m_id" == field){
					location.href="./memberDetail?m_id="+g_no;
					console.log("글씨나오나요")
					/* location.href="./memberDetail?m_id="+g_no; */
					g_no = 0;
					$("#dg_board").datagrid('clearSelections')
				} // end of if
			} // end of onDblClickCell
		}); //$("#dg_board").datagrid({
	
		
		//검색 조건 콤보에 변경이 일어났을 때
		$('#cb_search').combobox({
		//$('#cb_search').ready({
			onChange:function(){
			user_combo = $("#cb_search").combobox('getValue'); // b_title or b_content or b_writer
			console.log(user_combo)
			}
		});

		$('#tb_search').textbox({
		//$('#tb_search').ready({
			icons: [{
				iconCls:'icon-search',
				handler: function(e){
					alert("검색");
					//$(e.data.target).textbox('setValue', 'Something added!');
					$("#dg_board").datagrid({

					}); //datagrid
				} //handler
			}] //icons
		}); //textbox
		
	    /*===================== CRUD버튼 시작 ====================*/	    
		//조회버튼 클릭했을 때
	    $('#crudBtnSel').bind('click', function(){
	    	getMemberList();
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
<!-- ########## [[ sidebar 시작 ]] ##########-->
<%@ include file="../../../resources/layout/sidebar.jsp"%>
<!-- ########## [[ sidebar 끝 ]] ##########-->


<br><br>
	<div class="memberListContainer">
		<h1 class="pb-5 border-bottom-8 left-title">
			<b>회원리스트</b>
		</h1>

<center>

<!-- ########## 툴바 추가 중 조건검색 화면 시작 ########## -->    

    
<!-- ########## 툴바 추가 중 조건검색 화면 끝 ########## -->
<!-- ########## [[ 조건검색 시작 ]] ########## -->

		<!--  	<div class="sort-wrap ">
				<div class=" d-grid gap-2" style="width:1200px; margin-left: 30%">
					<div id="b_List"> -->
					
					 <div id="tb" style="padding:2px 5px;">
						   <select class="easyui-combobox" id="cb_search" name="cb_search" panelHeight="auto" style="width:100px">
							<option >--선택--</option>
							<option value="auth_id">회원분류</option>s
							<option value="m_id">아이디</option>
							<option value="m_email">이메일</option>
							<option value="m_name">이름</option>
							<option value="m_type">회원 등급</option>
						</select> 
						
						<input id="tb_search" name="tb_search" class="easyui-textbox" style="width:400px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
						<button id="tb_search" name="tb_search" type="tb_search" role="button" class="button m-1">검색</button>
					


<!-- ########## [[ 조건검색 끝 ]] ########## -->

    <table id="dg_board" class="table table-hover table-borderless" width="400px" style="margin-left: -250px" border="0" cellpadding="0" cellspacing="0"> 
        <thead>
            <tr align="center" bgcolor="">
          		<th><input class="form-check-input" type="checkbox" name="memberList"></th>
                <th data-options="field:'AUTH_ID',width:60, align:'center', hidden:'true'">회원분류</th>
                <th data-options="field:'M_ID',width:350">아이디</th>
                <th data-options="field:'M_NAME',width:80,align:'center'">이름</th>
                <th data-options="field:'M_EMAIL',width:100,align:'center'">이메일</th>
                <th data-options="field:'M_BIRTH',width:170">생일</th>
                <th data-options="field:'M_REGISTEDATE',width:60,align:'center'">가입일</th>
                <th data-options="field:'M_TYPE',width:60,align:'center'">회원등급</th>
          <!--        <th data-options="field:'',width:60,align:'center'">삭제</th>	-->
            </tr>
        </thead>
        <tbody class="table-content">
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
        	<tr align="center" bgcolor="">
        		<td><input class="form-check-input" type="checkbox" name="memberList"></td>
        		<td><%=rMap.get("AUTH_ID")%></td>
        		<td>
					<a href="javascript:memberDetail('<%=rMap.get("M_ID")%>')" style="text-decoration:none;color:#000000">
	        		<%=rMap.get("M_ID")%>
					</a>        		
        		</td>
        		<td><%=rMap.get("M_NAME")%></td>
        		<td><%=rMap.get("M_EMAIL")%></td>
        		<td><%=rMap.get("M_BIRTH")%></td>
        		<td><%=rMap.get("M_REGISTEDATE")%></td>
        		<td><%=rMap.get("M_TYPE")%></td>
        		<td>
             </tr>
		   <%
		         }// end of for
		      }// end of else if

%>        	
        </tbody>
    </table >
    

<!-- ########## 페이지 네이션 추가 시작 ########## -->
	<!-- <div style="display:table-cell;vertical-align:middle; width:800px; background:#efefef; height:30; border:1px solid #ccc;"> -->
	<div class="table table-hover table-borderless" width="400px" style="margin-left: -250px" border="0" cellpadding="0" cellspacing="0">
<%
	String pagePath = "memberList";
	PageBar pb = new PageBar(numPerPage, size, nowPage, pagePath);
	out.print(pb.getPageBar());
%>
	</div>


<!-- ########## 페이지 네이션 추가 끝 ########## -->
		<div id="b_memberList">
		<button id="tb_search" name="tb_search" type="tb_search" role="button" class="button m-1">삭제</button>
		<button id="tb_search" name="tb_search" type="tb_search" role="button" class="button m-1">수정</button>
			<!-- <button id="crudBtnUpd"type="button" class="btn btn-dark" onclick="location.href='./productinsert'">수정</button> -->
		</div>



<%
	String gubun = request.getParameter("gubun");
	if("list".equals(gubun)){
%>	
<script type="text/javascript">
		getMemberList();
</script>	
<%		
	}
%>
	</div>  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	</div>    
	</div>    
    <!-- 다이얼로그 화면 버튼 추가  끝   -->
<!-- 글입력 화면 추가  끝   -->
</center>
<br><br><br><br><br><br><br><br><br><br>
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
      
   $("input[name='memberList']").click(function(){
      var chk_listArr = $("input[name='cb_member']");
      for (var i=0; i<chk_listArr.length; i++){
         chk_listArr[i].checked = this.checked;
      }
   });
   $("input[name='cb_member']").click(function(){
      if($("input[name='cb_member']:checked").length == cb_product_cnt){
         $("input[name='memberList']")[0].checked = true;
      }
      else{
         $("input[name='memberList']")[0].checked = false;
      }
   });
}));
 
 
</script>



</html>