<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%><!--11.11 추가-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main 페이지</title>
<%@ include file="/resources/common/common.jsp" %>
<style type="text/css">

/* ########## 캐러셀 ~ 동그라미 ~ 네모칸 &줄 시작 ########## */
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }
      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }
      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }
      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }
      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
	  .card:hover {
		transform: scale(1.1);
		transition: transform .3s;
	  }
/* ########## 캐러셀 ~ 동그라미 ~ 네모칸 &줄 끝 ########## */


/* ########## 아이콘 들어갈 자리 시작 ########## */
   .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }
      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

/* ########## 아이콘 들어갈 자리 끝 ########## */

/* ########## 상품리스트 시작 ########## *//* 11.11 추가 */
/* card 호버시 커지게  */
.productCard:hover {
	transform: scale(1.1);
	transition: transform .3s;
}
/* ########### 상품리스트 끝 ########## */
</style>



<%
	/////////////////////////////////////////////////////
	/* 데이터를 가져오는지 화면에서 확인해봅시다. */
// 	List<Map<String,Object>> mainProductList = //유지의문제 - DB를 경유해야한다 ->servlet
// 	(List<Map<String,Object>>)request.getAttribute("mainProductList");//sql문을 넘겨넘겨 받아서 가지고옴
// 	out.print(mainProductList);
	
%>

<body>


<!-- ########## Main 홈페이지 시작 ########## -->
<main>
<!-- 캐러셀 시작 -->
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="bd-placeholder-img"  src="${pageContext.request.contextPath}/resources/img/main/carousel1.gif" width="100%" height="60%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

        <div class="container">
          <div class="carousel-caption text-start">
      <!--      <h1>Example headline.</h1>
            <p>Some representative placeholder content for the first slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>-->
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img"  src="${pageContext.request.contextPath}/resources/img/main/carousel.png" width="100%" height="60%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption">
        <!--    <h1>Another example headline.</h1>
            <p>Some representative placeholder content for the second slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>	-->
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img"  src="${pageContext.request.contextPath}/resources/img/main/egg.jpg" width="100%" height="60%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

        <div class="container">
          <div class="carousel-caption text-end">
            <!--  <h1>One more for good measure.</h1>
            <p>Some representative placeholder content for the third slide of this carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>-->
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

<hr>
  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->
  <div class="container px-4 py-5" id="featured-3">
    <div class="m_title01 cboth">WHY FARM IN US</div>
    <h2 class="pb-2 border-bottom"><b>Meaning Farm이 살아야 우리 농산물이 산다!</b></h2>
  </div>
  
  
  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
     <!--   <div class="col-lg-4 border border-info rounded">	-->
      <div class="col-lg-4 ">
        <img class="bd-placeholder-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/main/savemoney.png" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
        <title>Placehㅐlder</title>
        <rect width="100%" height="100%" fill="#777" style=stroke:red/>
        <text x="50%" y="50%" fill="#777" dy=".3em"></text></img>

        <h2 class="fw-normal"><b>절약하세요!</b></h2>
        
        <div class="keep_txt02" >Save Money</div>
        
        
        <p>긴 유통 과정 없이 농가에서 바로 직송하는<br/>
						신선한 농산물을 합리적인 가격에<br/>
						구입하실 수 있어요.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
     	 </div><!-- /.col-lg-4 -->
     	 <div class="col-lg-4 ">
        <img class="bd-placeholder-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/main/supportfarmer.png" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
        <title>Placeholder</title>
        <rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em"></text></img>

        <h2 class="fw-normal"><b>응원해주세요!</b></h2>
        <div class="keep_txt02" >Support Farmers</div>
        <p>생산자가 열심히 일구신 농산물을<br/>
		맛있게 드시고, 그들을 응원해주세요.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 ">
        <img class="bd-placeholder-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/main/reducefood.png"  width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img " aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
        <title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em"></text></img>

        <h2 class="fw-normal"><b>환경을 지켜주세요!</b></h2>
        <div class="keep_txt02" >Reduce Food Waste</div>
        <p>파미너스 “ASSA” 브랜드 상품으로<br/>
		음식물 낭비를 줄이실 수 있어요.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
<hr />

<!-- 상품리스트 -->
<section>
	<article class="container">
	    <div class="list_product row row-cols-4">
	   		<c:choose>   
	   			<c:when test="${mainProductList eq null}">
	   				이미지를 불러오지 못 하고 있습니다.
	   			</c:when>
	   			<c:otherwise>
				<c:forEach var="p" items="${mainProductList}" begin="0" end="3">
			      <!--===== 상품1 =====-->
			      <div class="col mt-5 mb-4">
			        <div class="card shadow-lg m-3 productCard">
			           <!-- 상품이미지 -->
			           <img
			             src="./display?fileName=apple.jpg"
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
			              	 <li class="PRODUCT_NO" style="display:none">${p.PRODUCT_NO}</li>
			                <li class="fs-5 fw-bold">${p.PRODUCT_NAME}</li>
			                <li class="fs-5 fw-bold">${p.PRODUCT_PRICE}원</li>
			                <li class="text-muted">${p.PRODUCT_DETAIL}</li>
			              </ul>
			           </div>
			        </div>
			      </div>
			    <!--===== 상품1 =====-->	
				</c:forEach>  
			</c:otherwise>
			</c:choose> 
   	 	</div>
	</article>
</section>    
<!-- 상품리스트 -->


    <!-- START THE FEATURETTES -->
	<br>
    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading fw-normal lh-1">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>
 <br><br>  
    <hr class="featurette-divider">
<!--#########################################################  -->



<!--#########################################################  -->
<!-- 아이콘 들어갈 자리 시작 -->

  <h1 class="visually-hidden">Features examples</h1>

  <div class="container px-4 py-5" id="featured-3">
    <div class="m_title01 cboth">CONNECT AND CREATE</div>
    <h2 class="pb-2 border-bottom"><b>Meaning Farm 비전</b></h2>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
      <div class="feature col">
        <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg bg-gradient fs-2 mb-3">
          <img class="bi" src="${pageContext.request.contextPath}/resources/img/main/connect.png" width="100" height="100"><use xlink:href="#collection"/></img>
        </div>
        <h3 class="fs-2">CONNECT</h3>
        
        <p> ‘생산자와 소비자를 연결하다’ 이 문구처럼<br/>
			모두가 만족을 하실 수 있도록 좋은 농산물을<br/>
			소개하고 연결하겠습니다. .</p>
        <a href="#" class="icon-link d-inline-flex align-items-center">
          Call to action
          <svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
        </a>
      </div>
      <div class="feature col">
        <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg bg-gradient fs-2 mb-3">
           <img class="bi" src="${pageContext.request.contextPath}/resources/img/main/collaborate.png" width="100" height="100"><use xlink:href="#people-circle"/></img>
        </div>
        <h3 class="fs-2">COLLABORATE</h3>
        <p> 소비자 입장에서 신선한 농산물을<br/>
			드실 수 있도록 생산자분들과<br/>
			정기적인 미팅을 하며 서로 협력하겠습니다.</p>
        <a href="#" class="icon-link d-inline-flex align-items-center">
          Call to action
          <svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
        </a>
      </div>
      <div class="feature col">
        <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg bg-gradient fs-2 mb-3">
         <img class="bi" src="${pageContext.request.contextPath}/resources/img/main/create.png" width="100" height="100"></img>
        </div>
        <h3 class="fs-2">CREATE</h3>
        <p> 앞의 두 가치들과 더불어<br/> 
			항상 새로운 발상으로 좋은 서비스와<br/>
			상품을 만들어 선보이겠습니다.</p>
        <a href="#" class="icon-link d-inline-flex align-items-center">
          Call to action
          <svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
        </a>
      </div>
    </div>
  </div>
<!-- 아이콘 들어갈 자리 끝 -->




<!--#########################################################  -->

</main>
<!-- ########## Main 홈페이지 끝 ########## -->



</body>

<script defer><!--11.11 추가-->
	/* 상품리스트 클릭시 이동 */
	$(document).ready(function(){
		// 상품 한번 클릭시 상품번호 출력 : 나중에 페이지이동을 한번 클릭으로 옮기고 더블클릭 삭제할것.
		$(".productCard").click(function() {
			let product_no = $(this).find(".PRODUCT_NO").text();
			location.href = "product/productView.do?product_no="+product_no
		});
	})
</script>  
</html>