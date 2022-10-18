<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>상품 리스트</title>
    <!--===================== CSS only =====================-->
    <style>
      * {
        /* border: 1px solid red; */
      }
    /*--------header CSS---------*/
    .nav-pills > .nav-item > .nav-link{
      color: rgb(18, 17, 17) !important;
    }

    .nav-pills > .nav-item > .active {
      color: rgb(255, 255, 255) !important;
      background-color: rgb(45, 197, 116) !important;
    }
    .nav-pills > .nav-item > .active:hover {
      color: rgb(255, 255, 255) !important;
      background-color: rgb(23, 97, 57) !important;
    }
    /*--------header CSS---------*/
    </style>
    <!--===================== CSS only =====================-->
    <!-- bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <!-- bootstrap -->

    <!-- JavaScript Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
    <!-- JavaScript Bundle with Popper -->

    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
  </head>

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
      <!--================= 상품리스트 =================-->
      <article class="container">
        <div class="list_product row row-cols-3">
          <!--===== 상품1 =====-->
          <div class="col mt-5 mb-5">
            <div class="card shadow-lg">
                <!-- 상품이미지 -->
                <img
                  src="./apple.jpg"
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
            </div>
          <!--===== 상품1 =====-->
          <!--===== 상품2 =====-->
          <div class="col mt-5 mb-5">
            <div class="card shadow-lg">
                <!-- 상품이미지 -->
                <img
                  src="./이미지준비중_1.jpg"
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
            </div>
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
</body>
</html>