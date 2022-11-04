<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<%@ include file="../../../common/common.jsp" %>
</head>
<body>
<style>
.scontainer {
	float: left;
	margin-top: -40px;
	margin-left: 100px;
}
#pdContainer {
	width: 70%;
	margin: 0 auto;
	float: right;
	margin-right: 120px;
	margin-bottom: 50px;
}
#ffooter {
	clear: both;
}
a {
	text-decoration: none;
	color: black;
}
table {
	text-align: center;
}
</style>
<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/nav.jsp" %>
<%@ include file="../../../layout/sidebar.jsp" %>
<div id="pdContainer">
<h1>상품 상세</h1>
<form action="/mall/product/productdetail?product_no=${productSelectOne.product_no}" method="post" id="f_product"> <br/>
<input type="hidden" name="product_no" id="product_no" value="${productSelectOne.product_no}">
<input type="text" class="form-control" name="product_name" value="${productSelectOne.product_name}" placeholder="상품명"> <br/>
<select class="form-select" id="s_category_local_no" name="category_local_no" value="${productSelectOne.category_local_no}">
	<option selected value="">카테고리-지역</option>
</select><br/>
<select class="form-select" id="s_category_type_no" name="category_type_no" value="${productSelectOne.category_type_no}">
	<option selected value="">카테고리-종류</option>
</select><br/>
<input type="text" class="form-control" name="product_price" value="${productSelectOne.product_price}" placeholder="상품 가격"> <br/>
<input type="text" class="form-control" name="product_stock"  value="${productSelectOne.product_stock}" placeholder="상품 재고"> <br/>
<div class="form_section">
	<div class="form_section_content">
		<input type="file" class="form-control" name="product_img" id="product_img" accept="image/*" multiple>
		<div id="uploadResult">
		</div>
	</div>
</div>
<br/>
<input type="radio" class="form-check-input" name="dlvyfee_radio" value="dlvyfee_x"> 무료
<input type="radio" class="form-check-input" name="dlvyfee_radio" value="dlvyfee_s"> 조건부 무료
<input type="radio" class="form-check-input" name="dlvyfee_radio" value="dlvyfee_o"> 유료 <br/>
<div id="tb_dlvyfee_s" style="display:none;">
	배송비 조건 <input type="text" class="form-control" name="product_dlvylimit"  value="${productSelectOne.product_dlvylimit}"> 원 이상 무료 <br/>
	기본 배송비 <input type="text" class="form-control" id="" name="product_dlvyfee" value="${productSelectOne.product_dlvyfee}"> 원
</div>
<div id="tb_dlvyfee_o" style="display:none;">
	기본 배송비 <input type="text" class="form-control" id="" name="product_dlvyfee" value="${productSelectOne.product_dlvyfee}"> 원
</div>
<input type="textarea" class="form-control" name="product_detail" value="${productSelectOne.product_detail}" placeholder="상세 설명"> <br/>
<input type="hidden" name="m_id"  value="${productSelectOne.m_id}">
<button id="b_update" class="btn btn-warning" data-oper="modify">수정</button>
<button id="b_delete" class="btn btn-dark" data-oper="remove">삭제</button>
</form>

</div>
<script type="text/javascript">
$(document).ready(function(){

let productForm = $("form[name='f_product']");
	// 삭제
	$("#b_delete").on("click", function(){
		productForm.attr("action", "./productdelete");
		productForm.attr("method", "post");
		productForm.submit();
	})

	// 켰을 때 자동으로 라디오버튼 체크되는 조건 시작
	let product_dlvyfee = document.getElementsByName("product_dlvyfee")[0].value;
	let product_dlvylimit = document.getElementsByName("product_dlvylimit")[0].value;
	if(product_dlvylimit > 0 && product_dlvylimit != null) {
		$(":radio[name='dlvyfee_radio'][value='dlvyfee_s']").attr('checked', true);
	} else if(product_dlvyfee == 0) {
		$(":radio[name='dlvyfee_radio'][value='dlvyfee_x']").attr('checked', true);
	} else {
		$(":radio[name='dlvyfee_radio'][value='dlvyfee_o']").attr('checked', true);
	}
	// 켰을 때 자동으로 라디오버튼 체크되는 조건 끝
		
	// 배송비 텍스트박스 띄우기 시작
	let dlvyfee_radio = $('input[name="dlvyfee_radio"]:checked').val();
	if(dlvyfee_radio == "dlvyfee_s"){
		$('#tb_dlvyfee_o').css('display','none');
		$('#tb_dlvyfee_s').css('display','block');
	} else if(dlvyfee_radio == "dlvyfee_o"){
		$('#tb_dlvyfee_o').css('display','block');
		$('#tb_dlvyfee_s').css('display','none');
	}else{
		$('#tb_dlvyfee_o').css('display','none');
		$('#tb_dlvyfee_s').css('display','none');
	}
	// 배송비 텍스트박스 띄우기 끝
	    	 
	// 배송비 박스 선택하는 대로 변경 시작
	$('input[name="dlvyfee_radio"]').on('click', function(){
		let dlvyfee_radio = $('input[name="dlvyfee_radio"]:checked').val();
		console.log(dlvyfee_radio)
		if(dlvyfee_radio == "dlvyfee_s"){
			$('#tb_dlvyfee_o').css('display','none');
			$('#tb_dlvyfee_s').css('display','block');
		}else if(dlvyfee_radio == "dlvyfee_o"){
			$('#tb_dlvyfee_o').css('display','block');
			$('#tb_dlvyfee_s').css('display','none');
		}else{
			$('#tb_dlvyfee_o').css('display','none');
			$('#tb_dlvyfee_s').css('display','none');
		}
	});
	// 배송비 박스 선택하는 대로 변경 끝
	
	//카테고리-타입 시작
	let CTList = JSON.parse('${selectCategoryType}');
	let CTArr = new Array();
	let CTObj = new Object();
	let CTSelect = $("#s_category_type_no");

	for(let i=0;i<CTList.length;i++) {
		CTObj = new Object();
		CTObj.category_type_no = CTList[i].category_type_no;
		CTObj.category_type_name = CTList[i].category_type_name;
		CTArr.push(CTObj)
	}
	
	let selectedCT = '${productSelectOne.category_type_no}';
	
	for(let i=0;i<CTArr.length;i++) {
		CTSelect.append("<option value='" + CTArr[i].category_type_no + "' name='category_type_no' >" + CTArr[i].category_type_name + "</option>");
	}
	
	$("#s_category_type_no option").each(function(i, obj) {
		if(selectedCT == obj.value) {
			$(obj).attr("selected", "selected");
		}
	})
	// 카테고리-타입 끝
	
	//카테고리-로컬 시작
	let CLList = JSON.parse('${selectCategoryLocal}');
	let CLArr = new Array();
	let CLObj = new Object();
	let CLSelect = $("#s_category_local_no");

	for(let i=0;i<CLList.length;i++) {
		CLObj = new Object();
		CLObj.category_local_no = CLList[i].category_local_no;
		CLObj.category_local_name = CLList[i].category_local_name;
		CLArr.push(CLObj)
	}
	
	let selectedCL = '${productSelectOne.category_local_no}';
	
	for(let i=0;i<CLArr.length;i++) {
		CLSelect.append("<option value='" + CLArr[i].category_local_no + "' name='category_type_no' >" + CLArr[i].category_local_name + "</option>");
	}
	
	$("#s_category_local_no option").each(function(i, obj) {
		if(selectedCL == obj.value) {
			$(obj).attr("selected", "selected");
		}
	})
	// 카테고리-로컬 끝
	
	// 기존 이미지 출력 시작
	let product_no = '<c:out value="${productSelectOne.product_no}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("productfilelist", {product_no : product_no}, function(arr) {
		
		if(arr.length === 0) {
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/image/logo.png'>";
			str += "</div>";
			
			uploadResult.html(str);
			return;
		}

		let str = "";
		let obj = arr[0];
		
		let fileCallPath = encodeURIComponent(obj.productfile_sname);
		str += "<div id='result_card' data-name='" + obj.productfile_name + "' data-sname='" + obj.productfile_sname + "' data-path='" + obj.productfile_path + "'>";
		str += "<img src='productfiledetail?imgName=" + fileCallPath + "'>";
		str += "<div class='imgDeleteBtn' data-name='" + fileCallPath +"'>x</div>";
		str += "</div>";
		str += "<input type='hidden' id='productfile_no' name='productfileVO[0].productfile_no' value='"+ obj.productfile_no +"'>";
		str += "<input type='hidden' name='productfileVO[0].productfile_name' value='"+ obj.productfile_name +"'>";
		str += "<input type='hidden' name='productfileVO[0].productfile_sname' value='"+ obj.productfile_sname +"'>";
		str += "<input type='hidden' name='productfileVO[0].productfile_path' value='"+ obj.productfile_path +"'>";
		
		uploadResult.html(str);
		
		
	}) // end of getJSON
	// 기존 이미지 출력 끝
	
	//이미지 업로드
	$("input[type='file']").on("change", function(e) {
		
		if($(".imgDeleteBtn").length > 0) {
			deleteImg();
		}
		
		let formData = new FormData();
		let img = $("input[name='product_img']");
		let imgList = img[0].files;
		let imgObj = imgList[0];
		
		if(!imgCheck(imgObj.name, imgObj.size)) {
			console.log(imgObj.name, imgObj.size)
			return false;
		}
		
		formData.append("uploadImg", imgObj);
	
		$.ajax({
			url: 'productfileinsert',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result) {
				console.log(result);
				console.log("성공")
				showUploadImage(result);
			},
			error: function(error) {
				alert("이미지 파일이 아닙니다.")
			}
		});
	}) // end of input type file change
	
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 파일 형식 제한
	let maxSize = 10485760000; // 파일 용량 제한
	
	function imgCheck(imgName, imgSize) {
		if(imgSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(imgName)) {
			alert("업로드할 수 없는 파일 형식");
			return false;
		}
		return true;
	}
	
	// 이미지 출력
	function showUploadImage(uploadResultArr) {
		if(!uploadResultArr || uploadResultArr.length == 0) { alert("showUploadImage 오류"); return }
		let uploadResult = $("#uploadResult");
		let obj = uploadResultArr[0];
		let str = "";
		let fileCallPath = encodeURIComponent(obj.productfile_name);
		
		str += "<div id='result_card'>";
		str += "<img src='productfiledetail?imgName=" + fileCallPath + "'>";
		str += "<div class='imgDeleteBtn' data-name='" + fileCallPath +"'>x</div>";
		str += "</div>"
		str += "<input type='hidden' name='productfileVO[0].productfile_name' value='"+ obj.productfile_name +"'>";
		str += "<input type='hidden' name='productfileVO[0].productfile_sname' value='"+ obj.productfile_sname +"'>";
		str += "<input type='hidden' name='productfileVO[0].productfile_path' value='"+ obj.productfile_path +"'>";
		
		uploadResult.append(str);

	} // end of showUpImage
	
	// 이미지 화면에서 삭제 시작
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
		deleteImg();	
	});
	
	
	// 파일 삭제
	function deleteImg() {
		console.log("delete 실행")
		
		let targetImg = $(".imgDeleteBtn").data("name");
		let targetDiv = $("#result_card");
		
		let productfile_no = $("#productfile_no").val();
		console.log(productfile_no)
		let product_no = $("#product_no").val();
		console.log(product_no)

//		$.ajax({
//			url: 'productfiledeleteone',
//			data: {
//				imgName : targetImg,
//				productfile_no : productfile_no
//				},
//			dataType: 'text',
//			type: 'POST',
//			success: function(result) {
//				console.log(result + " 삭제 완료");
				targetDiv.remove();
//				$("input[type='file']").val("");
//			},
//			error: function(error) {
//				console.log(error);
//				alert("파일 삭제 실패");
//			}
//		})
	}
		
	// 이미지 화면에서 삭제 끝
	
	
}); // end of document ready

let formObj = $("form");

$("#b_update").on("click", function(e) {
	e.preventDefault();
	// dlvyfee_x나 o면 배송비조건 0원으로 초기화 시작
	if($('input[name="dlvyfee_radio"]:checked').val() == "dlvyfee_x") {
		$('input[name="product_dlvylimit"]').val(0);
		$('input[name="product_dlvyfee"]').val(0);
	} else if($('input[name="dlvyfee_radio"]:checked').val() == "dlvyfee_o") {
		$('input[name="product_dlvylimit"]').val(0);
		document.getElementsByName("product_dlvyfee")[0].value = document.getElementsByName("product_dlvyfee")[1].value
	}
	// dlvyfee_x나 o면 배송비조건 0원으로 초기화 끝
	
	$("#f_product").submit();
})
</script>
</body>
</html>