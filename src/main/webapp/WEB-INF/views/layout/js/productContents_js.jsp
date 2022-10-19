<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
/////////////////////////////////////////////////////////////
/* 상품Tab 관련 JS */
  /* 설명참조 : https://cofs.tistory.com/m/191 */
  function fnMove(seq) {
    var offset = $("#product_tab" + seq).offset();
    $("html, body").animate({ scrollTop: offset.top }, 0);/* 화면이동 딜레이시간 */
  }
/////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////
/* 맨 위로 버튼 */
  $(function() {
    /* 스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼을 나타내고, 사라지도록 설정 */
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        /* 버튼 클릭 이벤트 */
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({/* animation 을 걸어서 화면 맨위로 이동하도록 설정 */
                scrollTop : 0
            }, 300);
            return false;
        });
    });  
/////////////////////////////////////////////////////////////  
</script>