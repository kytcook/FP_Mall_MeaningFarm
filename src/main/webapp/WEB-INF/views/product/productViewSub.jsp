<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--========================== 상품정보탭 ==========================-->
    <!--=== 상세정보 시작 ===-->
      <!-- 메뉴탭 -->
    <section class="container w-75 mt-5">
      <article class="container">
        <div id="product_tab1"></div><!-- 탭메뉴의 앵커용 div입니다. -->
          <ul class="product_info nav nav-tabs nav-justified">
            <li class="product_description nav-item">
              <button onclick="fnMove('1')" class="nav-link text-dark active">상세정보</button>
            </li>
            <li class="product_review nav-item">
              <button onclick="fnMove('2')" class="nav-link text-dark border">사용후기</button>
            </li>
            <li class="product_qna nav-item">
              <button onclick="fnMove('3')" class="nav-link text-dark border">상품 Q&amp;A</button>
            </li>
            <li class="product_delivery nav-item">
              <button onclick="fnMove('4')" class="nav-link text-dark border">배송교환</button>
            </li>
          </ul>
      <!-- 메뉴탭 -->
        <div class="container">
          <table class="extra-information mt-5">
            <tbody>
              <tr>
                <th scope="row" class="goods-view-form-table-heading">
                  포장단위별 용량(중량), 수량, 크기
                </th>
                <td>1봉/200g</td>
                <th scope="row" class="goods-view-form-table-heading">
                  관련법상 표시사항
                </th>
                <td>GAP, 무농약 인증</td>
              </tr>
              <tr>
                <th scope="row" class="goods-view-form-table-heading">
                  생산자, 수입품의 경우 수입자를 함께 표기
                </th>
                <td>제품 별도 라벨 표기 참조</td>
                <th scope="row" class="goods-view-form-table-heading">
                  상품구성
                </th>
                <td>무농약 콩나물</td>
              </tr>
              <tr>
                <th scope="row" class="goods-view-form-table-heading">
                  농수산물의 원산지 표시에 관한 법률에 따른 원산지
                </th>
                <td>국산</td>
                <th scope="row" class="goods-view-form-table-heading">
                  보관방법 또는 취급방법
                </th>
                <td>냉장 보관</td>
              </tr>
              <tr>
                <th scope="row" class="goods-view-form-table-heading">
                  제조연월일(포장일 또는 생산연도), 유통기한 또는
                  품질유지기한
                </th>
                <td>제품 별도 라벨 표기 참조</td>
                <th scope="row" class="goods-view-form-table-heading">
                  소비자상담 관련 전화번호
                </th>
                <td>미닝팜 고객행복센터(1004-1004)</td>
              </tr>
            </tbody>
          </table>
          <div>        
        <img src="${pageContext.request.contextPath}/resources/images/apple.jpg" alt="as" width="800" height="500" class="d-block">
        <%=p_detail%><!-- 인클루드로 페이지가 메인에 합쳐지기 때문에 여기서 오류나는건 정상입니다. -->
        </div>
        </div>
      </article>
      <!--=== 상세정보 끝 ===-->
      
      <!--=== 사용후기 시작 ===-->
      <!-- 메뉴탭 -->
      <article class="container">
        <div id="product_tab2"></div><!-- 탭메뉴의 앵커용 div입니다. -->
          <ul class="product_info nav nav-tabs nav-justified">
            <li class="product_description nav-item">
              <button onclick="fnMove('1')" class="nav-link text-dark border">상세정보</button>
            </li>
            <li class="product_review nav-item">
              <button onclick="fnMove('2')" class="nav-link text-dark active">사용후기</button>
            </li>
            <li class="product_qna nav-item">
              <button onclick="fnMove('3')" class="nav-link text-dark border">상품 Q&amp;A</button>
            </li>
            <li class="product_delivery nav-item">
              <button onclick="fnMove('4')" class="nav-link text-dark border">배송교환</button>
            </li>
          </ul>
      <!-- 메뉴탭 -->
        <div class="container">
          <table id="review_table" class="table mt-5 table-borderless">
            <thead>
              <tr class="bg-secondary bg-opacity-10 text-center border">
                <td scope="col" class="col-1">번호</td>
                <td scope="col" class="col-6">제목</td>
                <td scope="col" class="col-1">작성자</td>
                <td scope="col" class="col-2">작성일</td>
                <td scope="col" class="col-1">조회</td>
                <td scope="col" class="col-2">평점</td>
              </tr>
            </thead>
            <tbody class="text-center border">
              <tr>
                <td>1</td>
                <td class="text-start">참 맛있따</td>
                <td>임은택</td>
                <td>2022-10-17</td>
                <td>5</td>
                <td>★★★★★</td>
              </tr>
              <tr>
                <td>2</td>
                <td class="text-start">화가나는 맛입니다.</td>
                <td>아무개</td>
                <td>2022-10-17</td>
                <td>2</td>
                <td>★★☆☆☆</td>
              </tr>
              <tr>
                <td>3</td>
                <td class="text-start">이렇게 평범한 사과는 처음 먹어봐요!!</td>
                <td>쏘쏘요</td>
                <td>2022-10-17</td>
                <td>3</td>
                <td>★★★★☆</td>
              </tr>
              <tr>
                <td>2</td>
                <td class="text-start">화가나는 맛입니다.</td>
                <td>아무개</td>
                <td>2022-10-17</td>
                <td>4</td>
                <td>★★☆☆☆</td>
              </tr>
            </tbody>
          </table>
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </article>
      <!--=== 사용후기 끝 ===-->

      <!--=== 상품 Q&A 시작 ===-->
      <!-- 메뉴탭 -->
      <article class="container">
        <div id="product_tab3"></div><!-- 탭메뉴의 앵커용 div입니다. -->
          <ul class="product_info nav nav-tabs nav-justified">
            <li class="product_description nav-item">
              <button onclick="fnMove('1')" class="nav-link text-dark border">상세정보</button>
            </li>
            <li class="product_review nav-item">
              <button onclick="fnMove('2')" class="nav-link text-dark border">사용후기</button>
            </li>
            <li class="product_qna nav-item">
              <button onclick="fnMove('3')" class="nav-link text-dark active">상품 Q&amp;A</button>
            </li>
            <li class="product_delivery nav-item">
              <button onclick="fnMove('4')" class="nav-link text-dark border">배송교환</button>
            </li>
          </ul>
      <!-- 메뉴탭 -->
        <div class="container border mt-4 mb-5 pe-5 ps-5">
            <div class="row justify-content-between pt-5 container">
              <h6 class="col-2">상품문의</h6> 
              <button type="button" class="btn btn-outline-primary col-2">문의하기</button>
            </div>
            <ul class="mt-3" style="font-size: 11px;">
              <li>구매한 상품의 취소/반품은 <b>마이팜 구매내역에서 신청</b> 가능합니다.</li>
              <li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
              <li><b>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기</b>를 이용해주세요</li>
              <li><b>“해당 상품 자체”와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고없이 이동, 노출제한, 삭제 등의 조체가 취해질 수 있습니다.</b></li>
              <li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
            </ul>
            <p class="border border-dark"></p>
          <table id="qna_table" class="table mt-1 table-striped ">
            <tbody class="text-center ">
              <tr class="row">
              </tr>
              <tr>
                <td>질문</td>
                <td class="text-start">
                  <p>
                    [사용자 아이디] <br />
                    1kg | 1개
                  </p>
                  <p>왜 주문이 안될까요 <br />
                    로그인하고 구매했는데요 <br />
                    사과가 먹고싶은데 왜 먹을 수가 없죠.. 빨리 해결해주세요
                  </p>
                  </td>
                <td class="text-end">2022-10-17 21:00:21</td>
              </tr>
              <tr>
                <td>└ 답변</td>
                <td class="text-start">
                  <p>
                    [판매자 아이디] <br />
                    1kg | 1개
                  </p> 
                  <p>안녕하세요 고객님^^ <br />
                    먼저, 불편을 드려서 정말 죄송합니다 <br />
                    해당 상품은 현재 품절로 상품 재입고가 예정된 상태입니다.
                  </p>
                </td>
                <td class="text-end">2022-10-17 10:00:21</td>
                
              </tr>
            </tbody>
          </table>
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </article>
      <!--=== 상품 Q&A 끝 ===-->

      <!--=== 배송관련 시작 ===-->
      <!-- 메뉴탭 -->
      <article class="container">
        <div id="product_tab4"></div><!-- 탭메뉴의 앵커용 div입니다. -->
          <ul class="product_info nav nav-tabs nav-justified">
            <li class="product_description nav-item">
              <button onclick="fnMove('1')" class="nav-link text-dark border">상세정보</button>
            </li>
            <li class="product_review nav-item">
              <button onclick="fnMove('2')" class="nav-link text-dark border">사용후기</button>
            </li>
            <li class="product_qna nav-item">
              <button onclick="fnMove('3')" class="nav-link text-dark border">상품 Q&amp;A</button>
            </li>
            <li class="product_delivery nav-item">
              <button onclick="fnMove('4')" class="nav-link text-dark active">배송교환</button>
            </li>
          </ul>
      <!-- 메뉴탭 -->
        <div class="container mt-5">
          <div class="container border" id="delivery_content">
            <div class="row row-cols-2 text-muted " style="height: auto;">
              <div class="col border p-4">
                <h5><b class="text-success">PAYMENT</b> INFO</h5>
                상품결제정보
                <hr>
                <p>
                고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br/>  
                <br/>
                무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
                주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
                </p>
              </div>
              <div class="col border p-4">
                <h5><b class="text-success">DELIVERY</b> INFO</h5>
                배송정보
                <hr>
                배송 방법 : 택배<br/>
                배송 지역 : 전국지역<br/>
                배송 비용 : <%=p_dlvyfee %><br/>
                배송 기간 : 1일 ~ 3일<br/>
                배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.
                고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br/>
              </div>
              <div class="col border p-4">
                <h5><b class="text-success">EXCHANGE</b> INFO</h5>
                교환 및 반품정보
                <hr>
                교환 및 반품 주소<br/>
                - [54866] 전라북도 전주시 덕진구 틀못2길 46 (장동) 217동(호반베르디움더클래스상가동) 103호 (상가동)<br/>
                <br/>
                교환 및 반품이 가능한 경우<br/>
                - 계약내용에 관한 서면을 받은 날부터 7일. 단, 그 서면을 받은 때보다 재화등의 공급이 늦게 이루어진 경우에는 재화등을 공급받거나 재화등의 공급이 시작된 날부터 7일 이내
                  - 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날 부터 3월이내, 그사실을 알게 된 날 또는 알 수 있었던 날부터 30일이내<br/>
                <br/>
                교환 및 반품이 불가능한 경우<br/>
                - 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br/>
                  - 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br/>
                  - 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br/>
                  - 복제가 가능한 재화등의 포장을 훼손한 경우<br/>
                  - 개별 주문 생산되는 재화 등 청약철회시 판매자에게 회복할 수 없는 피해가 예상되어 소비자의 사전 동의를 얻은 경우<br/>
                  - 디지털 콘텐츠의 제공이 개시된 경우, (다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우 제공이 개시되지 아니한 부분은 청약철회를 할 수 있습니다.)<br/>
                  <br/>
                ※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br/>
                (색상 교환, 사이즈 교환 등 포함)<br/>
              </div>
              <div class="col border p-3">
                <h5><b class="text-success">SERVICE</b> INFO</h5>
                서비스문의
                <hr>
                ㅎ
              </div>
            </div>
          </div>
        </div>
      </article>
      <!--=== 배송관련 끝 ===-->
    </section>

    
    <!--========================== 상품정보탭 ==========================-->
<script src="${path}/js/productViewSub.js" type="text/javascript"></script>