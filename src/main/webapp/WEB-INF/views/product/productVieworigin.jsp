<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<!--========= 헤드 =========-->
<%@ include file="../../../resources/common/common.jsp" %>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
<!--========= 헤드 =========-->

<!-- productContents.css 추가 -->    
<link href="${path}/css/product/productView.css" rel="stylesheet" type="text/css"/> 

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
	out.print(productView);
	out.print(p_name);
	/////////////////////////////////////////////////////////////
%>

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
              <img src="{path}/resources/images/이미지준비중_1.jpg" class="img-fluid rounded-start" alt="이미지를 불러오지 못 하고 있습니다.">
            </div>
            <div class="col-6 ps-3">
              <div>
                <h3><b><%=p_name%></b></h3><!-- 상품명 -->
                <hr />
              </div>
                <table>
                  <caption>기본 정보</caption>
                  <tbody>
                    <tr>
                      <th><b>판매가</th>
                      <td><%=p_price%>원 </b></td>
                    </tr>
                     <tr>
                   		<td>ㅁㄴㅇ</td>
                   		<fmt:formatNumber value="${produceView.PORDUCE_PRICE}" pattern="###,###,###"/>
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
                        <td><%=p_name %>(30개)</td>
                        <td> 
                          <input class="productCount" style="width:55px" type="number" min="1" max="99" value="1" >개<!-- 상품수량 입력 -->
                        </td>
                        <td class="right">
                          <%=p_price%> 원
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
                  <button id="cartInsert" class="btn btn-warning border fw-bolder p-3 col-4"  type="submit">장바구니 담기</button>
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
    <%@include file="./productViewSub.jsp" %>
    <!--========================== 상품정보탭 ==========================-->
  </div><!-- section 영역 2개를 묶는 div -->
  <!-- 본문 끝 -->
  <!----------------------- FOOTER START ---------------------->
  <%@include file="../../../resources/layout/footer.jsp"%>
  <!------------------------ FOOTER END ----------------------->
  
<!-- productContents.js 추가 -->    
<script src="${path}/js/productView.js" type="text/javascript"></script>
<script>
	$('#cartInsert').bind('click', function(){
		alert("으아아");
	})
</script>	
</body>
</html>
