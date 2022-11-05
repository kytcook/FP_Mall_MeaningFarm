<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
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
      
/* ########### 아름님꺼 css 시작 ########## */

.gnb .gnb_search {
    position: absolute;
    right: 108px;
    top: 10px;
    width: 238px;
}

.gnb_search .inp_search {
    width: 100%;
    height: 36px;
    padding: 0 50px 0 20px;
    border: 1px solid #f7f7f6;
    border-radius: 18px;
    background-color: #f7f7f7;
    font-weight: 400;
    font-size: 12px;
    color: #666;
    line-height: 36px;
    transition: background-color .3s ease-in-out;
}

.gnb_search .btn_search {
    position: absolute;
    right: 10px;
    top: 3px;
    width: 30px;
    height: 30px;
    line-height: 36px;
}

.gnb_search .init {
    position: relative;
}

.gnb_search .init .btn_delete {
    display: none;
    position: absolute;
    overflow: hidden;
    left: 170px;
    top: -36px;
    width: 36px;
    height: 36px;
    border: none;
    background: url(https://res.kurly.com/pc/ico/2010/ico_search_del.svg) no-repeat 50% 50%;
    background-size: 12px 12px;
    font-size: 0;
    line-height: 0;
    /* opacity: 0; */
}

.gnb_search:hover .btn_delete {
    display: block;
}

.gnb .location_login .btn_location.on {
    background-image: url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting.svg?ver=1);
}

.gnb .location_login .btn_location {
    overflow: hidden;
    position: absolute;
    right: 52px;
    top: 10px;
    width: 36px;
    height: 36px;
    border: none;
    font-size: 0;
    line-height: 0;
}

.gnb .location_notice {
    display: none;
    position: absolute;
    right: 41px;
    top: 56px;
    width: 308px;
    padding: 20px 18px 19px 20px;
    border: 1px solid #ddd;
    background-color: #fff;
    z-index: 100;
    font-weight: 700;
    font-size: 16px;
    color: #333;
    line-height: 24px;
}

.gnb .location_notice::after {
    position: absolute;
    content: '';
    top: -50px;
    right: 9px;
    width: 36px;
    height: 50px;
    background: url(https://res.kurly.com/pc/ico/2011/ico_point_up_18x12.svg) no-repeat 50% 100%;
}
/* /* border가 색자체가 돼서 나중에 변경 예정 * */


.gnb .location_login .location_notice.on,
.gnb .location_login:active .location_notice,
.gnb .location_login:hover .location_notice {
    display: block;
}
/* 포인터가 영역을 벗어나면 notice가 바로 사라져버림 
>> z-index 추가해서 수정 완료*/
/* js로 location_login에 3초간 active 붙게 설정*/

.gnb .location_notice .emph {
    color: #5f0080;
}

.gnb .group_button .btn {
    display: block;
    height: 36px;
    margin-top: 17px;
    padding-bottom: 2px;
    border-radius: 3px;
    font-size: 12px;
}

.gnb .group_button .login {
    float: left;
    width: 104px;
    border: 1px solid #5f0080;
    background-color: #fff;
    color: #5f0080;
}

.gnb .group_button .search_address {
    float: right;
    width: 158px;
    border: 1px solid #5f0081;
    background-color: #5f0080;
    color: #fff;
}

.gnb .cart_count {
    position: absolute;
    right: -6px;
    top: 10px;
}

.gnb .cart_count .btn_cart {
    display: block;
    width: 36px;
    height: 36px;
    background: url(https://res.kurly.com/pc/service/common/2011/ico_cart.svg) no-repeat 50% 50%;
}
/* btn_car와 btn_location은 hover 시 보라색으로 변경해야 함. url 못찾는 중 */
/* #header 끝 */

/* ########### 아름님꺼 css 끝 ########## */
    
</style>

<body>

<!-- ########## NAV 버전 1 시작 ########## -->

<!-- 
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Main</a>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">상품별</a></li>
              <li><a class="dropdown-item" href="#">지역별</a></li>
              <li><a class="dropdown-item" href="#">가격별</a></li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="#">신상품</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link disabled">베스트</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link disabled">할인상품</a>
          </li>         

          <li class="nav-item">
            <a class="nav-link disabled">My recipe</a>
          </li>
                   
        </ul>
        </div>        
        
		<div class="col-md-3 text-end">
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
        </form>
 		</div>   

        ########## 마음에 안들면 삭제 시작 ##########
        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small">
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sign oDDDDDut</a></li>
          </ul>
        ########## 마음에 안들면 삭제 끝 ##########
      </div>
    </div>
  </nav> 
  
 -->
  
<!-- ########## NAV 버전 1 끝 ########## -->


<!-- ########## NAV 버전 2 시작 ########## -->  
 <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
      </a>
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-secondary">Main</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle  bg-white text-dark" href="#" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">상품별</a></li>
            <li><a class="dropdown-item" href="#">지역별</a></li>
            <li><a class="dropdown-item" href="#">가격별</a></li>
          </ul>
        </li>        
        <li><a href="#" class="nav-link px-2 link-dark">신상품</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">베스트</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">할인상품</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">My recipe</a></li>
      </ul>

		<div class="col-md-3 text-end">
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control" placeholder="원하시는 상품을 검색해보세요" aria-label="Search">
        </form>
 		</div>   

        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://image.cine21.com/resize/cine21/still/2017/1207/15_56_42__5a28e62a4f72a[X252,310].jpg" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small">
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sign oDDDDDut</a></li>
          </ul>
        </div>
<!-- ############# 아름님 꺼 가져오기 시작 ########## -->       
<!-- ############# 아름님 꺼 가져오기 시작 ########## -->       
<!-- 
         <div class="gnb_search">
             <form action="">
                 <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search">
                 <div class="init">
                     <button type="button" id="search_init" class="btn_delete">검색어 삭제하기</button>
                 </div>
             </form>
         </div>
  -->
 <!--  
         <div class="location_login">
             <button type="button" class="btn_location on">배송지 등록</button>
             
             <div class="location_notice">
                 <span class="emph">배송지를 등록</span>하고<br>
                 <span class="txt">구매가능한 상품을 확인하세요!</span>
                 <div class="group_button">
                     <button type="button" class="btn login">로그인</button>
                     <button type="button" class="btn search_address">
                         <span class="ico"></span>
                         주소검색
                     </button>
                 </div>
             </div>
         </div>
 -->  
  <!--      
          <div class="cart_count">
              <a href="#" class="btn_cart">
                <span class="blind">장바구니</span>
              </a>
          </div>   
   -->        
<!-- ############# 아름님 꺼 가져오기 끝 ########## -->       
<!-- ############# 아름님 꺼 가져오기 끝 ########## -->       
    </header>
 </div>


<!-- ########## NAV 버전 2 끝 ########## -->    
  

</body>
</html>