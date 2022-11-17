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
  m_id: '야호랑',// 여기에 로그인 세션 id를 담아줘야 합니다.(현재는 상수값)
  product_no: '',
  cart_amount: '',
};

// 장바구니 버튼
$("#cart").on("click", function (e) {
	if(confirm("장바구니에 담으시겠습니까?") == true){
	form.cart_amount = $(".amount_input").val();
	form.product_no = $(".product_no").val();
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
	      alert("장바구니에 추가되었습니다.");
	    } else if (result == '2') {
	      alert("이미 장바구니에 있는 상품입니다.");
	    } else if (result == '5') {
	      alert("로그인이 필요합니다.");
		}
	}