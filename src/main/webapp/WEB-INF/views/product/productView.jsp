<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	/////////////////////////////////////////////////////////////
	String p_no 				= null;
	String p_name				= null;
	String p_price 				= null;
	String p_detail 			= null;
	String p_stock 				= null;
	String p_img 				= null;
	String p_dlvyfee 			= null;
	String p_step 				= null;
	String category_local_no 	= null;
	String category_type_no 	= null;
	List<Map<String,Object>> productView = //유지의문제 - DB를 경유해야한다 ->servlet
		(List<Map<String,Object>>)request.getAttribute("productView");
		if(productView !=null && productView.size()>0){
			p_no				= productView.get(0).get("PRODUCT_NO").toString();
			p_name				= productView.get(0).get("PRODUCT_NAME").toString();            
			p_price 			= productView.get(0).get("PRODUCT_PRICE").toString();       
			p_detail			= productView.get(0).get("PRODUCT_DETAIL").toString();        
			p_stock				= productView.get(0).get("PRODUCT_STOCK").toString();        
		//	p_img				= productView.get(0).get("PRODUCT_IMG").toString();         
			p_dlvyfee			= productView.get(0).get("PRODUCT_DLVYFEE").toString();       
		//	p_step				= productView.get(0).get("PRODUCT_STEP").toString();       
			category_local_no	= productView.get(0).get("CATEGORY_LOCAL_NO").toString();
			category_type_no 	= productView.get(0).get("CATEGORY_TYPE_NO").toString();
		}
// 	out.print(productView);
// 	out.print(p_name);
	/////////////////////////////////////////////////////////////
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resources/common/common.jsp" %>
<!-- productContents.css 추가 -->
<style>
@charset "UTF-8";
/* --------------------- 상세내용 css-------------------- */
* {
	/* 레이아웃용 */
	/* border: 1px solid red; */
	
}

/* input태그에 number타입의 화살표 항상 보이기 : 크롬에서만 적용됨 */
input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	opacity: 1;
}

/* 당장 쓰지 않는 정보는 캡션으로 막아둡시다. 설명용 캡션은 table에서만 사용하는 설명용 */
caption {
	display: none;
}

article {
	margin-bottom: 100px;
}
/* --------------------- 상세내용 css-------------------- */

/* ---------------- 상세정보탭 테이블관련 css---------------- */
table.extra-information {
	background: #e0e0e0;
	margin: 30px 0 60px;
	width: 100% !important;
}

table.extra-information th {
	width: 15%;
	background: #f5f5f5;
	color: #515151;
}

table.extra-information th, table.extra-information td {
	font-weight: 400;
	text-align: left;
	padding-left: 15px;
	background: #fff;
	font-family: Dotum;
	font-size: 11px;
	height: 28px;
	padding: 5px 0 5px 10px;
	border-width: 1px;
	line-height: 20px;
}

table.extra-information td {
	width: 35%;
	color: #666;
}

table.extra-information th {
	width: 15%;
	background: #f5f5f5;
	color: #515151;
}

#qna_table, #review_table {
	font-size: 10px;
}

#delivery_content {
	font-size: 10px;
}
/* ----------------상세정보의 테이블관련 css---------------- */
</style>
</head>

<!-- 본문 시작 -->
<body>

<!---------------------- HEADER START ---------------------->
<%@include file="/resources/layout/header.jsp"%>
<%@include file="/resources/layout/nav.jsp"%>
<!----------------------- HEADER END ----------------------->

  <div class="container"><!-- section 영역 2개를 묶는 div -->
    <!-- 상단메인 -->
    <section class="container mt-3 mb-3">
      <header class="container">
        <div class=" mb-3 container-fluid" style="max-width: 1000px;">
          <div class="row g-0">
          <!-- jstl foreach 시작 -->
          <c:forEach var="p" items="${productView}" >
            <div class="col-6 text-center align-self-center">
            <!-- jsp에 이미지를 넣기 위해 ${pageContext.request.contextPath}를 사용 
           		 참조 : https://byul91oh.tistory.com/m/203 -->
              <img src="${path}/resources/images/이미지준비중_1.jpg" class="img-fluid rounded-start" alt="이미지를 불러오지 못 하고 있습니다.">
            </div>
            <div class="col-6 ps-3">
              <div>
                <h3><b>${p.PRODUCT_NAME}</b></h3><!-- 상품명 -->
                <hr />
              </div>
                <table>
                  <caption>기본 정보</caption>
                  <tbody>
                    <tr>
                      <th><b>판매가</b></th>
                      <td><b><fmt:formatNumber value="${p.PRODUCT_PRICE}" pattern="###,###,###"/> 원 </b></td>
                    </tr>
                  </tbody>
                </table>
                <br />
                <p class="info border-top"><small class="text-muted">(최소주문수량 1개 이상)</small></p>
                <div id="totalProducts">
                  <p class="text-danger border-bottom"><small>❗수량을 선택해주세요.</small></p>
                  <table>
                    <caption>상품 목록</caption>
                    <colgroup>
                      <col style="width:284px;">
                      <col style="width:100px;">
                      <col style="width:110px;">
                    </colgroup>
                    <thead>
                      <tr>
                        <th scope="col">상품명</th>
                        <th scope="col">상품수</th>
                        <th scope="col">가격</th>
                      </tr>
                    </thead>
                    <tbody class="text">
                      <tr>
                        <td>${p.PRODUCT_NAME} (30개)</td>
                        <td> 
                          <input class="amount_input" type="text" style="width:55px" value="1" >개<!-- 상품수량 입력 -->
                          <input type="hidden" name="m_id" class="m_id" value=<%=m_id2%>>
                          <input type="hidden" name="product_no" class="product_no" value="${p.PRODUCT_NO}">
                          <span>
                          	<button class="plus_btn">+</button>
                          	<button class="minus_btn">-</button>
                          </span>
                        </td>
                        <td class="right">
                          <fmt:formatNumber value="${p.PRODUCT_PRICE}" pattern="###,###,###"/>(총가격계산) 원
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div><!-- id="totalProducts" -->
                <hr />
                <div id="totalPrice" class="totalPrice mb-4">
                  <strong>총 상품금액</strong>(수량) : <span class="total fw-bolder fs-4">11,500원 (1개)</span>
                </div>
                <div class="container-fluid row justify-content-between">
                  <button class="btn btn-light border fw-bolder p-3 col-4" type="submit">관심상품</button>
                  <button id="cart" class="btn btn-warning border fw-bolder p-3 col-4"  type="submit">장바구니 담기</button>
                  <button class="btn btn-primary border fw-bolder  p-3 col-4" type="submit">주문하기</button>
                </div>
                <p class="border mt-3 border-dark"></p><!-- 줄간격 -->
                <div class="cboth buy_info">
                  <span class="buy_info_title fw-bold">
                  💡구매하시기 전에 꼭 읽어 주세요.
                  </span>
                  <p><small>
                  + 당일 오전 10시 이전 주문시, 특정 상품을 제외한 상품들은 당일 또는 <br />&nbsp;&nbsp;&nbsp;
                    1일 이내 출고 드립니다 <br><br>
                  + 배송 받으시는 주소지가 도서(제주도 포함) 산간 지역일 경우,<br />&nbsp;&nbsp;&nbsp;
               	    추가 배송비가발생하는 점 정중히 양해를 부탁드립니다. <br><br>
                  + 상품을 받으신 이후, 문제가 있으실 경우, 만 하루가 지나기 전에,<br /> &nbsp;&nbsp;&nbsp;
              	    고객센터로 접수를 해주셔야 환불/교환 서비스를 받으실 수 있습니다.
                  </small></p>
                </div>
            </div>
            </c:forEach>
            <!-- jstl foreach 끝 -->
          </div>
        </div>
      </header>
    </section>
    <!-- 상단메인 -->
    <!--========================== 상품정보탭 ==========================-->
    <%@include file="./productViewSub.jsp" %>
    <!--========================== 상품정보탭 ==========================-->
  </div><!-- section 영역 2개를 묶는 div -->
  <!-- 본문 끝 -->
  
	<!----------------------- FOOTER START ---------------------->
	<%@include file="/resources/layout/footer.jsp"%>
	<!------------------------ FOOTER END ----------------------->
  
<!-- productContents.js 추가 -->    
<script>
/*********************************************
 * 상품뷰 js
 ********************************************/
// 상품 추가•빼기 버튼
$(document).ready(function () {
  let amount = $(".amount_input").val();
  $(".plus_btn").on("click", function () {
    console.log("플러스눌림");
    $(".amount_input").val(++amount);
  });

  $(".minus_btn").on("click", function () {
    console.log("마이너스눌림");
    if (amount > 1) {
      $(".amount_input").val(--amount);
    } else {
      alert("1개 미만은 담을 수 없습니다.");
    }
  });
});

// 서버로 전송할 데이터 객체
  let form = {
  m_id: '',// 여기에 로그인 세션 id를 담아줘야 합니다.(현재는 상수값)
  product_no: '',
  cart_amount: '',
};

// 장바구니 버튼
$("#cart").on("click", function (e) {
	if(confirm("장바구니에 담으시겠습니까?") == true){
	form.cart_amount = $(".amount_input").val();
	form.product_no = $(".product_no").val();
	m_id = $(".m_id").val();
	form.m_id = m_id;
		} else {
			return false;
		}
	
	$.ajax({
		  url: '/mall/cart/cartAdd.do', // 호출할 url, 전송페이지
		  type: 'GET', // 전송방식
		  data: form, // 서버로 전송할 데이터
		  contentType: "application/json; charset=utf-8",// 데이터포맷 json
		  success: function (result) {
		  			console.log(JSON.stringify(form));
		  			cartAlert(result);// a.
				},
		  error: function(){
					console.log("전송실패");
				}
		  })
	});
	
	// a.서버가 요청을 성공적으로 수행했을 때 수행될 메소드, 파라미터는 서버가 반환한 값
	   function cartAlert(result) {
	       if (result == '0') {
	         alert("장바구니에 추가를 하지 못하였습니다.");
	       } else if (result == '1') {
	            if(confirm("추가되었습니다. 장바구니로 이동할까요?") == true){
	            location.href = "/mall/cart/cartList?m_id=" + m_id
	            }
	       } else if (result == '2') {
	            if(confirm("이미 상품이 존재합니다. 장바구니로 이동할까요?") == true){
	            location.href = "/mall/cart/cartList?m_id=" + m_id
	            }
	       } else if (result == '5') {
	         alert("로그인이 필요합니다.");
	      }
	   }
</script>
</body>
</html>
