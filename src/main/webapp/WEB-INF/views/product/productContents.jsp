<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--========= 헤드 =========-->
<%@include file="../layout/head.jsp"%>
<!--========= 헤드 =========-->

<!-- productContents.css 추가 -->    
<link href="${path}/css/product/productContents.css" rel="stylesheet" type="text/css"/> 


<!-- 본문 시작 -->
<body>
<!---------------------- HEADER START ---------------------->

<!----------------------- HEADER END ----------------------->
  <div class="container"><!-- section 영역 2개를 묶는 div -->
    <!-- 상단메인 -->
    <section class="container mt-3 mb-3">
      <header class="container">
        <div class=" mb-3 container-fluid" style="max-width: 1000px;">
          <div class="row g-0">
            <div class="col-6 text-center align-self-center">
            <!-- jsp에 이미지를 넣기 위해 ${pageContext.request.contextPath}를 사용 
           		 참조 : https://byul91oh.tistory.com/m/203 -->
              <img src="<%=request.getContextPath()%>/resources/images/이미지준비중_1.jpg" class="img-fluid rounded-start" alt="이미지를 불러오지 못 하고 있습니다.">
            </div>
            <div class="col-6 ps-3">
              <div>
                <h3><b>[상품명 넣는 곳]</b></h3>
                <hr />
              </div>
                <table>
                  <caption>기본 정보</caption>
                  <tbody>
                    <tr>
                      <th><b>판매가</th>
                      <td>100,000,000원 </b></td>
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
                      <col style="width:80px;">
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
                        <td>사과 (30개)</td>
                        <td> 
                          1
                        </td>
                        <td class="right">
                          10,000원
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
                  <button class="btn btn-warning border fw-bolder p-3 col-4"  type="submit">장바구니 담기</button>
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
          </div>
        </div>
      </header>
    </section>
    <!-- 상단메인 -->
    <!--========================== 상품정보탭 ==========================-->
    <%@include file="./productContentsSub.jsp" %>
    <!--========================== 상품정보탭 ==========================-->
  </div><!-- section 영역 2개를 묶는 div -->
  <!-- 본문 끝 -->
  <!----------------------- FOOTER START ---------------------->
  <!------------------------ FOOTER END ----------------------->
  
<!-- productContents.js 추가 -->    
<script src="${path}/js/productContents.js" type="text/javascript"></script>
	
</body>
</html>
