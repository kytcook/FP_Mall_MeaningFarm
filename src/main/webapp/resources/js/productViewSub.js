/*********************************************
 * 상품Tab 관련 JS
 * 설명참조 : https://cofs.tistory.com/m/191
 ********************************************/

function fnMove(seq) {
  var offset = $("#product_tab" + seq).offset();
  $("html, body").animate(
    { scrollTop: offset.top },
    0
  ); /* 화면이동 딜레이시간 */
}
