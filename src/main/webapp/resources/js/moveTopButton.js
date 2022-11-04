
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
