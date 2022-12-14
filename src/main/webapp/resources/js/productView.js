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

// 서버로 전송할 데이터
/*const form = {
  //m_id: '${M_ID}',
  product_no: '${PRODUCT_NO}',
  cart_amount: '',
};
*/
// 장바구니 버튼
$("#cart").on("click", function (e) {
  console.log("장바구니 담기 눌림");
  form.cart_no = $(".amount_input").val();
});

// ajax
$.ajax({
  type: 'GET', // 서버로 보낼 데이터
  url: 'cartAdd.do', // 호출할 url
  data: form, // 서버로 보낼 데이터
  success: function (result) {
    // 서버가 요청을 성공적으로 수행했을 때 수행될 메소드, 파라미터는 서버가 반환한 값
    if (result == '0') {
      alert("장바구니에 추가를 하지 못하였습니다.");
    } else if (result == '1') {
      alert("장바구니에 추가되었습니다.");
    } else if (result == '2') {
      alert("이미 장바구니에 있는 상품입니다.");
    } else if (result == '5') {
      alert("로그인이 필요합니다.");
    }
  }
});
