<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- === Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- ===== Link Swiper's CSS ===== -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

    <!-- ===== Fontawesome CDN Link ===== -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
        
    <!-- ===== CSS ===== -->
  <%--   <link href="${pageContext.request.contextPath}/resources/css/recipe.css" rel="stylesheet"> --%>
  <!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"  
  rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">-->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

    <!--<title>Card with Sliding Feature</title>-->
</head>
<body>
   <!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> -->
  <!--bootstrap-->
<!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 -->
<div class="container recipe" style="height:650px; ">   
  <div class="myrecipe_card">
    <p style="text-align:center; color:gray; font-family:courier;" > MEANING FARM RECIPE</p>
    <h1 style="text-align:center; ">미닝팜 추천 간편 레시피 </h1>
    <hr style="width: 100%; margin-left : auto; margin-right : auto; color:#225f2a;">
    <p style="text-align:center;"> 미닝팜의 신선한 상품으로 요리한 간편한 레시피 입니다</p>
    <p style="text-align:center;"> 추가 상품의 레시피는 미닝팜 홈페이지 마이레시피 게시판에서 확인하실 수 있습니다.</p>
  </div>
    <div class="swiper-container mySwiper " style="width: 95%;">
      <div class="swiper-wrapper content" >
        <!--card1-->
        <div class="swiper-slide card" style="max-hegiht : 20em;">          
          <div class="card-content">
            <div class="image">
              <img src="${pageContext.request.contextPath}/resources/img/main/recipe_ban01.jpg" alt="" style="width:390px; height : 280px; float:center;">
            </div>
            <div class="card-body">
              <h5 class="card-title" style="font-size: 25px; text-align:center;">신선한 완숙 토마토로
              <br>만드는 카프레제
              </h5>
              <p class="card-text"style="text-align:center; font-size: 18px;">신선한 완숙 토마토로 얇게 썬 후 바질잎과 
                모짜렐라를 얹어 올리브유를 뿌려주세요
              </p>
              <div class="re_icon_area" stype="opacity:1;">
                <ul style="opacity:1;">
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">
                    <div class="icon" style="opacity:1;  ">
                      <img src="${pageContext.request.contextPath}/resources/img/main/egg.jpg" style="margin-top:-200px; margint-left:-40px" style="opacity:1;">
                    </div>
                    <div class="r_text" style="opacity:1;">10분</div>
                  </div>
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">
                    <div class="icon" style="opacity:1;">
                      <img src="${pageContext.request.contextPath}/resources/img/recipe/egg.jpg" style="margin-top:-200px;" style="opacity:1;">
                    </div>
                    <div class="r_text" style="opacity:1;">300cal</div>
                  </div>
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">  
                    <div class="icon" style="opacity:1;">
                      <img src="${pageContext.request.contextPath}/resources/img/recipe/re_icon03.png" style="opacity:1;">                                
                    </div>
                    <div clss="r_text" stype="opacity:1;">쉬움</div>
                  </div>
                </ul>
              </div>
              <!-- 게시물 번호 부분 데이터 넣고 바꾸기 !  -->
              <a href="http://localhost/mall/recipe/recipe_view?recipe_no=2632" class="btn btn-outline-success" style="float: right">Go recipe</a>
            </div>
          </div>  
        </div>

        <!--card 2-->
        <div class="swiper-slide card" style="max-hegiht : 20em;">          
          <div class="card-content">
            <div class="image">
              <img src="${pageContext.request.contextPath}/resources/img/recipe/recipe_ban02.jpg" alt="" style="width:390px; height : 280px; float:center;">
            </div>
            <div class="card-body">
              <h5 class="card-title" style="font-size: 25px; text-align:center;">촉촉한 반숙란으로 
              <br>만든 에그 샐러드
              </h5>
              <p class="card-text"style="text-align:center; font-size: 18px;">반숙란을 으깨서 다진 샐러리와 요거트, 
                레몬쥬스와 함께 섞어주세요.
              </p>
              <div class="re_icon_area" stype="opacity:1;">
                <ul style="opacity:1;">
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">
                    <div class="icon" style="opacity:1;  ">
                      <img src="${pageContext.request.contextPath}/resources/img/recipe/re_icon01.png" style="opacity:1;">
                    </div>
                    <div class="r_text" style="opacity:1;">15분</div>
                  </div>
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">
                    <div class="icon" style="opacity:1;">
                      <img src="${pageContext.request.contextPath}/resources/img/recipe/re_icon02.png" style="opacity:1;">
                    </div>
                    <div class="r_text" style="opacity:1;">600cal</div>
                  </div>
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">  
                    <div class="icon" style="opacity:1;">
                      <img src="${pageContext.request.contextPath}/resources/img/recipe/re_icon03.png" style="opacity:1;">                                
                    </div>
                    <div clss="r_text" stype="opacity:1;">쉬움</div>
                  </div>
                </ul>
              </div>
              <a href="http://localhost/mall/recipe/recipe_view?recipe_no=2632" class="btn btn-outline-success" style="float: right">Go recipe</a>
            </div>
          </div>  
        </div>
        <!--card3-->
        <div class="swiper-slide card "style="max-hegiht : 20em;" >          
          <div class="card-content">
            <div class="image">
              <img src="${pageContext.request.contextPath}/resources/img/recipe/recipe_ban03.jpg" alt="" style="width:390px; height : 280px; float:center;">
            </div>
            <div class="card-body">
              <h5 class="card-title" style="font-size: 25px; text-align:center;">입맛따라 골라먹는
              <br>반숙란+구운계란의 계란
              </h5>
              <p class="card-text"style="text-align:center; font-size: 18px;">구운계란, 반숙란 또는 훈제란을 
                야채와 함께 간장에 끓여주세요.
              </p>
              <div class="re_icon_area" stype="opacity:1;">
                <ul style="opacity:1;">
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">
                    <div class="icon" style="opacity:1;  ">
                      <img src="${pageContext.request.contextPath}/resources/img/recipe/re_icon01.png" style="opacity:1;">
                    </div>
                    <div class="r_text" style="opacity:1;">30분</div>
                  </div>
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">
                    <div class="icon" style="opacity:1;">
                      <img src="${pageContext.request.contextPath}/resources/img/recipe/re_icon02.png" style="opacity:1;">
                    </div>
                    <div class="r_text" style="opacity:1;">750cal</div>
                  </div>
                  <div class="group-icon" style="float :left;width:33%; padding:10px;">  
                    <div class="icon" style="opacity:1;">
                      <img src="${pageContext.request.contextPath}/resources/img/recipe/re_icon03.png" style="opacity:1;">                                
                    </div>
                    <div clss="r_text" stype="opacity:1;">보통</div>
                  </div>
                </ul>
              </div>
              <a href="http://localhost/mall/recipe/recipe_view?recipe_no=2632" class="btn btn-outline-success" style="float: right">Go recipe</a>
            </div>
          </div>  
        </div>  

      </div> <!-- div class = swiper-wrapper end-->
      <div class="swiper-group">
         <div class="swiper-button-next"></div>
         <div class="swiper-button-prev"></div>
         <div class="swiper-pagination"></div>
      </div>
  </div><!--  end of swiper  -->

</div> <!--  end of container recipe -->
  <!-- Swiper JS -->
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 3,
      spaceBetween: 30,
      loop: true,
      loopFillGroupWithBlank: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>

</body>
</html>