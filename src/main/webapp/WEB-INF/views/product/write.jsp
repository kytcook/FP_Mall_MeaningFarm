<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
</head>
<body>
<%@ include file="../../../common/common.jsp" %>
<script type="text/javascript">
	// 옵션 팝업창 띄우기
	function optionPopup() {
		const url = "/product/optionpopup"
		const name = "OptionPopup"
		const option = "width=1000, height=500, top=100, left=200, location=no";
		window.open(url, name, option)
	}
	$(document).ready(function(){
	// 옵션 라디오 버튼 - 버튼 disabled 조정
	    $("input:radio[name=option_radio]").click(function(){
	        if($("input[name=option_radio]:checked").val() == "option_o"){
	        	console.log($("input[name=option_radio]:checked").val())
	            $("input:button[name=b_optionpopup]").attr("disabled",false);
	        }else if($("input[name=option_radio]:checked").val() == "option_x"){
	              $("input:button[name=b_optionpopup]").attr("disabled",true);
	        	console.log($("input[name=option_radio]:checked").val())
	        }
	    });
	// 
	    $('input[name="dlvyfee_radio"]').on('click', function(){
	    	  let dlvyfee_radio = $('input[name="dlvyfee_radio"]:checked').val();
	    	  if(dlvyfee_radio == "dlvyfee_s"){
	    	  console.log(dlvyfee_radio);
	    		  $('#tb_dlvyfee_o').css('display','none');
 	             $('#tb_dlvyfee_s').css('display','block');
	    	  }else if(dlvyfee_radio == "dlvyfee_o"){
	    	  console.log(dlvyfee_radio);
	    	             $('#tb_dlvyfee_o').css('display','block');
	    	             $('#tb_dlvyfee_s').css('display','none');
	    	  }else{
	    	  console.log(dlvyfee_radio);
	    		  $('#tb_dlvyfee_o').css('display','none');
 	             $('#tb_dlvyfee_s').css('display','none');
	    	  }
	    	 
	    	});
	}); // end of document ready
</script>
<h1>상품 등록</h1>
<form action="/product/write" method="post"> <br/>
<!-- product_no : <input type="text" name="product_no"> <br/>  -->
상품명 : <input type="text" name="product_name"> <br/>
카테고리 :  <input type="text" name="category_no">
<select name="category_name">
<option value=""></option>
</select> <br/>
판매가격 : <input type="text" name="product_price"> <br/>
product_type : <input type="text" name="product_type"> <br/>
옵션 : 
<input type="radio" name="option_radio" value="option_x"> 설정 안 함 
<input type="radio" name="option_radio" value="option_o"> 설정함
<input type="button" id="b_optionpopup" name="b_optionpopup" value="옵션 설정" onclick="optionPopup()" disabled /> <br/>
재고 : <input type="text" name=product_stock> <br/>
대표이미지 : 첨부파일 <input type="text" name="product_img"> <br/>
배송비 :
<input type="radio" name="dlvyfee_radio" value="dlvyfee_x"> 무료
<input type="radio" name="dlvyfee_radio" value="dlvyfee_s"> 조건부 무료
<input type="radio" name="dlvyfee_radio" value="dlvyfee_o"> 유료 <br/>
<div id="tb_dlvyfee_s" style="display:none;">
	배송비 조건 <input type="text" name="product_dlvyfee"> 원 이상 무료
</div>
<div id="tb_dlvyfee_o" style="display:none;">
	기본 배송비 <input type="text" id="" name="product_dlvyfee"> 원
</div>
상세 설명 : <input type="textarea" name="product_detail"> <br/>
<button type="submit">등록</button>

</form>
</body>
</html>