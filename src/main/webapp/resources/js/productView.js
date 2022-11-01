/*********************************************
 * 상품컨텐츠 관련 js
 * 상품Tab 관련 JS 
 * 설명참조 : https://cofs.tistory.com/m/191 
 ********************************************/
 $(document).ready(function(){
 let amount = $(".amount_input").val();
 $(".plus_btn").on("click", function(){
 	console.log("플러스눌림");
 	$(".amount_input").val(++amount);
 });
 $(".minus_btn").on("click", function(){
 	console.log("마이너스눌림");
 	$(".amount_input").val(--amount);
 });
 })

  function fnMove(seq) {
    var offset = $("#product_tab" + seq).offset();
    $("html, body").animate({ scrollTop: offset.top }, 0);/* 화면이동 딜레이시간 */
  }
  
  