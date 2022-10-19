<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!--===================== CSS only =====================-->
<style>
  * {
    /* 레이아웃용 */
    /* border: 1px solid red; */
  }

  caption {
    /* 당장 쓰지 않는 정보는 캡션으로 막아둡시다. 설명용 캡션은 table에서만 사용하는 설명용 */
    display: none;
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

  article {
    margin-bottom: 100px;
  }

  /* ----------------상세정보의 테이블관련 css---------------- */
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
  table.extra-information th,
  table.extra-information td {
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
  /* ----------------상세정보의 테이블관련 css---------------- */

  #qna_table,
  #review_table {
    font-size: 10px;
  }

  #delivery_content {
    font-size: 10px;
  }
</style>
<!--===================== CSS only =====================-->
