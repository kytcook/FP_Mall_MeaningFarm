<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.meaningfarm.util.PageBar" %>

<!DOCTYPE html>
<html>
<title>상품리스트</title>   
<head>
	<!-- productList.css 추가하기 -->
	<link href="${path}/css/product/productList.css" rel="stylesheet"/>
	<!-- 맨 위로 버튼.css -->
	<link href="${path}/css/static/moveTopButton.css" rel="stylesheet" type="text/css"/>
	<style>
		* {
			/* border: 1px solid red; */
			
		}
		/*--------header CSS---------*/
		.nav-pills>.nav-item>.nav-link {
			color: rgb(18, 17, 17) !important;
		}
		
		.nav-pills>.nav-item>.active {
			color: rgb(255, 255, 255) !important;
			background-color: rgb(45, 197, 116) !important;
		}
		
		.nav-pills>.nav-item>.active:hover {
			color: rgb(255, 255, 255) !important;
			background-color: rgb(23, 97, 57) !important;
		}
		/*--------header CSS---------*/
		
		/* card 호버시 커지게  */
		.card:hover {
			transform: scale(1.1);
			transition: transform .3s;
		}
		
		  a#MOVE_TOP_BTN {
		    /* TOP버튼관련 CSS */
		    border-bottom: 10px solid rgb(71, 206, 53);
		    color: white;
		    position: fixed; /* 화면에 고정 */
		    right: 5%; /* right, bottom 버튼의 위치 설정 */
		    bottom: 80px;
		    display: none; /* 화면에서 숨김  */
		    z-index: 999; /* 다른 태그들보다 위로 오도록 설정(z-index 가 설정된 다른 태그가 있다면 그 태그보다 커야 함) */
		  }		
	</style>
</head>
<body>
	<!-- 맨 위로 버튼.html -->
	<a id="MOVE_TOP_BTN" href="#" class="btn btn-warning">TOP</a>
	
<!--========= 헤더 =========-->
<%@include file="/resources/layout/header.jsp"%>
<%@include file="/resources/layout/nav.jsp"%>
<!--========= 헤더 =========-->

<%
	/////////////////////////////////////////////////////
	List<Map<String,Object>> productList = //유지의문제 - DB를 경유해야한다 ->servlet
		(List<Map<String,Object>>)request.getAttribute("productList");//sql문을 넘겨넘겨 받아서 가지고옴
	/* 데이터를 가져오는지 화면에서 확인해봅시다. */
// 	out.print(productList);
	int size = 0;
	if(productList!=null){
		size = productList.size();// 컬럼의 개수 변수에 담기
	}
	/////////////////////////////////////////////////////
	
	/////////////////////////////////////////////////////
	/* 페이징처리 변수*/
	boolean isOk = false;
	if(request.getParameter("isOk")!=null){
		isOk = Boolean.parseBoolean(request.getParameter("isOk"));
	}	
	int numPerPage = 9; // 현재 페이지에 출력할 개수 설정
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	/////////////////////////////////////////////////////
%>
    <header class="container">
      <div class="ico_cate">
          <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" id="goodsListIconView" alt="카테고리 아이콘"> </span>
      </div>
      <div class="container row">
        <!-- 메뉴분류 -->
        <ul class="nav nav-pills mb-3 col-11" id="pills-tab" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
            type="button" role="tab" aria-controls="pills-상품별" aria-selected="true">상품별</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" 
            type="button" role="tab" aria-controls="pills-가격별" aria-selected="false">가격별</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact"
             type="button" role="tab" aria-controls="pills-맛있는거" aria-selected="false">맛있는거</button>
          </li>
          <!-- <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-상품별" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0"></div>
            <div class="tab-pane fade" id="pills-가격별" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0"></div>
            <div class="tab-pane fade" id="pills-맛있는거" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0"></div>
          </div> -->
        </ul>
        <!-- 메뉴분류 -->
        <!-- 정렬 드랍다운 -->
        <div class="btn-group col-1">
          <button type="button" class="btn  dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
            리뷰순  
          </button>
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start">
            <li><a class="dropdown-item" href="#">별점 높은순</a></li>
            <li><a class="dropdown-item" href="#">별점 낮은순</a></li>
            <li><a class="dropdown-item" href="#">최신순</a></li>
          </ul>
        </div>
        <!-- 정렬 드랍다운 -->
      </div>
    </header>
    
    
    <section>
      <article class="container">
        <div class="list_product row row-cols-3">
      <!--================= 상품리스트 =================-->
      <!-- 현재 페이지에서 보여지는 상품의 개수를 제어하면서 꺼내는 반복문 : 상품리스트, 페이징 처리 START -->
      
      
      
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
		for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
			if(size == i) break;
			Map<String,Object> rMap = productList.get(i);// 데이터 꺼내는 반복문/ 데이터 껀수만큼
%>	    

          <!--===== 상품1 =====-->
          <div class="col mt-5 mb-4">
            <div class="card shadow-lg m-3">
               <!-- 상품이미지 -->
               <div id = "imageGet">
<!--                		<div class="image_wrap"  -->
<%--                			 data-product_no="${productList.PRODUCTFILE_NO}" --%>
<%--                			 data-path="${productList.PRODUCTFILE_PATH}" --%>
<%--                			 data-uuid="${productList.uuid} data-file" --%>
<!--                			 /> -->
<!--                			<img> -->
<!--                		</div> -->

			<!-- src="./display?fileName=apple.jpg" -->
               <img
                 src="${path}/resources/image/apple.jpg"
                 alt="apple.jpg"
                 onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
                 width="100%"
                 height="300"
                 class="pt-5"
               />
               </div>
               <!-- 상품설명 -->
               <div class="card-body">
                  <ul class="card-text list-unstyled ps-4 pb-3">
                  	 <!-- 상품이름, 가격, 설명을 출력. / 가격은 3자리 단위마다 ,로 끊는다 -->
            	 	<li class="product_no" style="display:none"><%=rMap.get("PRODUCT_NO")%></li>
           			<li><input type="hidden" class="product_no" name="product_no" value="<%=rMap.get("PRODUCT_NO")%>"/></li>
                    <li class="fs-5 fw-bold"><%=rMap.get("PRODUCT_NAME")%></li>
                    <li class="fs-5 fw-bold"><%=rMap.get("PRODUCT_PRICE")%>원</li>
                    <li class="text-muted"><%=rMap.get("PRODUCT_DETAIL")%></li>
                  </ul>
               </div>
            </div>
          </div>
        <!--===== 상품1 =====-->

				<% // 반복문을 통해 상품데이터를 꺼냅니다.
					}// end of for
				}// end of if
				%>
      <!-- 현재 페이지에서 보여지는 상품의 개수를 제어하면서 꺼내는 반복문 : 상품리스트, 페이징 처리 END -->				
       	</div>
      </article>
      <!--================= 상품리스트 =================-->

      <!--================ 페이지네이션 ================-->
      <footer class="container">
		<div class="pagination justify-content-center">
		<%
			String pagePath = "productList.do";
			PageBar pb = new PageBar(numPerPage, size, nowPage, pagePath);
			out.print(pb.getPageBar());
		%>
			</div>
		<!-- 페이지 네이션 추가   끝  -->          
      </footer>
      <!--================ 페이지네이션 ================-->
    </section>
    
  <!----------------------- FOOTER START ---------------------->
<%@include file="/resources/layout/footer.jsp"%>
  <!------------------------ FOOTER END ----------------------->  
</body>
	<!-- productList.js 추가하기 -->
	<script defer>
		$(document).ready(function(){
			// 상품 한번 클릭시 상품번호 출력 : 나중에 페이지이동을 한번 클릭으로 옮기고 더블클릭 삭제할것.
			$(".card").click(function() {
// 				console.log(product_no);
				let product_no = $(this).find(".product_no").text();
// 				alert("상품눌리임");
				location.href = "productView.do?product_no="+product_no
			});
			
			// 상품 두 번 클릭시 페이지 이동
// 			$(".card").dblclick(function() {
// 				let product_no = $(this).find(".product_no").text();
// 				location.href = "productView.do?product_no="+product_no
// 			});
		})
		
		
		 $(function() {
		/* 스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼을 나타내고, 사라지도록 설정 */
		    $(window).scroll(function() {
		        if ($(this).scrollTop() > 500) {
		            $('#MOVE_TOP_BTN').fadeIn();
		        } else {
		            $('#MOVE_TOP_BTN').fadeOut();
		        }
		    });
		    /* 버튼 클릭 이벤트 */
		    $("#MOVE_TOP_BTN").click(function() {
		        $('html, body').animate({/* animation 을 걸어서 화면 맨위로 이동하도록 설정 */
		            scrollTop : 0
		        }, 300);
		        return false;
		    });
		});  
		
	</script>  
</html>