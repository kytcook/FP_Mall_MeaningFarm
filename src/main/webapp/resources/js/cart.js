/*------------------------- 수량수정 START -------------------------*/
/* 수량증감버튼 */
$(document).ready(function () {
	// 증가버튼
	$(".plus_btn").on("click", function(){
		let cart_amount = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++cart_amount);
	});
	
	// 감소버튼
	$(".minus_btn").on("click", function(){
		let cart_amount = $(this).parent("div").find("input").val();
		if(cart_amount > 1){
			$(this).parent("div").find("input").val(--cart_amount);		
		}
	});
	
/* 수량 변경 버튼 */
	// 장바구니 번호와 수량을 구해와서 <form>태그 내부에 작성된 <input>태그에 저장한 후, <form>태그를 서버로 전송/제출
	$(".cart_amount_update_btn").on("click", function(){
			let cart_no = $(this).data("cart_no");
			let cart_amount = $(this).parent("td").find("input").val();
			$(".cart_no_update").val(cart_no);
			$(".cart_amount").val(cart_amount);
			$(".cart_amount_update_form").submit();
// 			alert("장바구니 번호 : "+cart_no +" / 장바구니 수량 : "+ cart_amount);
		});
		
});// end of (document).ready
/*-------------------------- 수량수정 END -------------------------*/

/*------------------------- 체크박스 START-------------------------*/
/* 체크박스 선택 */
$(document).ready(function(){
	// 체크박스의 name을 가져와서 체크박스와 체크된 박스 개수만큼 dom을 구성
	let cb_cartProduct = document.getElementsByName("cb_cartProduct");
	let cb_cartProduct_cnt = cb_cartProduct.length;
		
	// 전체선택 : cb_cartProduct 이름을 가진 체크박스의 개수 만큼 반복하여 전체 체크박스 선택
	$("input[name='cb_cartProduct_all']").click(function(){
		let chk_listArr = $("input[name='cb_cartProduct']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	
	// 체크박스가 만약 모두 클릭됐다면 전체체크박스 활성화/비활성화
	$("input[name='cb_cartProduct']").click(function(){
		console.log("클릭됐슴다");
		if($("input[name='cb_cartProduct']:checked").length == cb_cartProduct_cnt){
			$("input[name='cb_cartProduct_all']")[0].checked = true;
		}
		else{
			$("input[name='cb_cartProduct_all']")[0].checked = false;
		}
	});
});
/*-------------------------- 체크박스 END--------------------------*/

/*--------------------- 장바구니 상품 삭제 START ---------------------*/
/* 삭제버튼 클릭 이벤트 */
function remove() {
	// 장바구니상품 체크박스에 쿼리를 모두 담아옴
	let obj = document.querySelectorAll("input[name='cb_cartProduct']"); //체크 박스 -> class가 check
	console.log(obj);
	let noList = new Array();
	for (let i = 0; i< obj.length; i++) {
		if (obj[i].checked) {
			noList.push(obj[i].value);
			console.log(noList);
		}
	}
	$.ajax({
		type: 'POST',
        url: 'cartDelete.do',
		traditional: true,
		dataType: 'text',
		data: {
            'cartProduct_nos': noList
		},
	}).done(function(res) {
		location.reload();
		})
	  .fail(function (error) {
		console.log("에러발생:" + JSON.stringify(error));
	})
}
/*---------------------- 장바구니 상품 삭제 END ----------------------*/

/*-------------------- 상품목록 페이지로 이동 START--------------------*/
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="/mall/product/productList"
	});
});
/*--------------------- 상품목록 페이지로 이동 END --------------------*/