<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>      
<!--========= 헤드 =========-->
<%@include file="../layout/head.jsp"%>

<!--========= 헤드 =========-->
  <!-- productList.css 추가하기 -->
  <link href="${path}/css/product/productList.css" rel="stylesheet"/>
  
<%
	/* 데이터를 가져오는지 확인해봅시다. */
	List<Map<String,Object>> productList = //유지의문제 - DB를 경유해야한다 ->servlet
		(List<Map<String,Object>>)request.getAttribute("productList");//sql문을 넘겨넘겨 받아서 가지고옴
	out.print(productList);
	
	/* 페이징처리 변수*/
	int numPerPage = 10;
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>


  <body>
    <header class="container">
      <div class="ico_cate">
          <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" id="goodsListIconView" alt="카테고리 아이콘"> </span>
      </div>
      <div class="container row">
        <!-- 메뉴분류 -->
        <ul class="nav nav-pills mb-3 col-11" id="pills-tab" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-상품별" aria-selected="true">상품별</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-가격별" aria-selected="false">가격별</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-맛있는거" aria-selected="false">맛있는거</button>
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
      
      <p class="border"></p>

    </header>
    
    
    <section>
      <article class="container">
        <div class="list_product row row-cols-3">
      <!--================= 상품리스트 =================-->
      
	  <!-- var="임시변수" items="Model이 가지고 온 변수명" jstl문법 c:foreach => 자바의 for문 -->
	   	<c:forEach var="list" items="${productList}">
          <!--===== 상품1 =====-->
          <div class="col mt-5 mb-4">
            <div class="card shadow-lg m-3" id="a" onclick='productSelect()'>
                <!-- 상품이미지 -->
                <img
                  src="${path}/resources/images/apple.jpg"
                  alt="apple.jpg"
                  onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
                  width="100%"
                  height="300"
                  class="pt-5"
                />
                <!-- 상품설명 -->
                <div class="card-body">
                   <ul class="card-text list-unstyled ps-4 pb-3">
                   	 <!-- 상품이름, 가격, 설명을 출력. / 가격은 3자리 단위마다 ,로 끊는다 -->
                   	 <li style="display:none"><c:out value="${list.PRODUCT_NO}"/></li>
                     <li class="fs-5 fw-bold"><c:out value="${list.PRODUCT_NAME}"/></li>
                     <li class="fs-5 fw-bold"><fmt:formatNumber value="${list.PRODUCT_PRICE}" pattern="###,###,###"/> 원</li>
                     <li class="text-muted"><c:out value="${list.PRODUCT_DETAIL}"/>(1개/200g)</li>
                   </ul>
                </div>
              </div>
            </div>
  	 	</c:forEach>
          <!--===== 상품1 =====-->
<script>
    	function productSelect(){
        alert("상품눌리임");
        //location.href = "./productContents.do?"
    	}
    	
    	$(document).ready(function(){//DOM구성이 완료된 시점-자바스크립트로 태그접근,설정변경,이미지
    		$(".card").datagrid({
    			onSelect:function(index, row) {
    				g_no = row.PRODUCT_NO;
    				console.log("g_no : "+g_no);
    			},
    			onDblClickCell: function(index, field, value){
    				if("B_TITLE" == field){
    					location.href="./boardDetail.sp4?b_no="+g_no
    					g_no = 0;		
    					$("#dg_board").datagrid('clearSelections')		
    			     }
    	         }
    	      });
    	})
</script>
          
          <!--===== 상품2 =====-->
<%--           <div class="col mt-5 mb-5">
            <div class="card shadow-lg">
                <!-- 상품이미지 -->
                <img
                  src="${path}/resources/images/이미지준비중_1.jpg"
                  alt="apple.jpg"
                  onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
                  width="100%"
                  height="300"
                >
                </img>

                <!-- 상품설명 -->
                <div class="card-body">
                  <p class="card-text">
                    <ul class="list-unstyled">
                      <li class="fs-5 fw-bold">[상품 이름]쫄깃쫄깃 사과 250g</li>
                      <li class="fs-5 fw-bold">[가격을 꽂아주세요]</li>
                      <li class="text-muted">무농약으로 재배한 달콤쌉살사과(1개/200g)</li>
                    </ul>
                  </p>
                </div>
              </div>
            </div> --%>
          <!--===== 상품2 =====-->
          </div>
      </article>
      <!--================= 상품리스트 =================-->

      <!--================ 페이지네이션 ================-->
      <footer class="container">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item active" aria-current="page"><a class="page-link bg-success" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
      </footer>
      <!--================ 페이지네이션 ================-->
    </section>
  <!----------------------- FOOTER START ---------------------->
  <!------------------------ FOOTER END ----------------------->    
</body>
</html>