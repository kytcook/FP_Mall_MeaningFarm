<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
</head>
<body>
<%@ include file="../../../resources/common/common.jsp" %>
<h1>상품 등록</h1>
<!-- ########## [[ 헤더 시작 ]] ########## -->
<%@include file="../../../resources/layout/header.jsp"%>
<%@include file="../../../resources/layout/nav.jsp"%>
<!-- ########## [[ 헤더 끝 ]] ########## -->
<form action="./productinsert" method="post" id="f_product" enctype="multipart/form-data"> <br/>
상품명 : <input type="text" name="product_name" id="product_name"> <br/>
카테고리(지역) :
	<select id="s_category_local_no" name="category_local_no">
		<option selected value="">선택</option>
	</select><br/>
카테고리(종류) :
	<select id="s_category_type_no" name="category_type_no">
		<option selected value="">선택</option>
	</select><br/>

판매가격 : <input type="text" name="product_price"> <br/>
재고 : <input type="text" name="product_stock"> <br/>
이미지 첨부 : <input type="file" name="product_img" id="product_img" multiple="multiple"> <br/>
<div id="uploadResult">
</div>
배송비 :
<input type="radio" name="dlvyfee_radio" value="dlvyfee_x"> 무료
<input type="radio" name="dlvyfee_radio" value="dlvyfee_s"> 조건부 무료
<input type="radio" name="dlvyfee_radio" value="dlvyfee_o"> 유료 <br/>
<div id="tb_dlvyfee_s" style="display:none;">
	배송비 조건 <input type="text" name="product_dlvylimit"> 원 이상 무료 <br/>
	기본 배송비 <input type="text" id="" name="product_dlvyfee"> 원
</div>
<div id="tb_dlvyfee_o" style="display:none;">
	기본 배송비 <input type="text" id="" name="product_dlvyfee"> 원
</div>
상세 설명 : <input type="textarea" name="product_detail"> <br/>
m_id : <input type="textarea" name="m_id"> <br/>
</form>
<button id="b_submit">등록</button>


<!-- ########## [[ 푸터 시작 ]] ########## -->
<%@include file="../../../resources/layout/footer.jsp"%>
<!-- ########## [[ 푸터 끝 ]] ########## -->

<script type="text/javascript">
$(document).ready(function() {
	// 배송비 라디오버튼 클릭하면 텍스트박스 뜨는 코드 시작
	$('input[name="dlvyfee_radio"]').on('click', function(){
		let dlvyfee_radio = $('input[name="dlvyfee_radio"]:checked').val();
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
	// 배송비 라디오버튼 클릭하면 텍스트박스 뜨는 코드 끝
	
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
	for(let i=0;i<CTArr.length;i++) {
		CTSelect.append("<option value='" + CTArr[i].category_type_no + "' name='category_type_no' >" + CTArr[i].category_type_name + "</option>");
	}
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
	for(let i=0;i<CLArr.length;i++) {
		CLSelect.append("<option value='" + CLArr[i].category_local_no + "' name='category_type_no' >" + CLArr[i].category_local_name + "</option>");
	}
	// 카테고리-로컬 끝
	
}); // end of document ready

// 이미지 업로드
$("input[type='file']").on("change", function(e) {
//	// 기존에 이미지 존재하면 삭제
//	if($(".imgDeleteBtn").length > 0) {
//		deleteImg();
//	}
	
	let formData = new FormData();
	let img = $("input[name='product_img']");
	let imgList = img[0].files;
	let imgObj = imgList[0];
	
	if(!imgCheck(imgObj.name, imgObj.size)) {
		console.log(imgObj.name, imgObj.size)
		return false;
	}
	alert("통과");
	
	for(let i=0;i<imgList.length;i++) {
		formData.append("uploadImg", imgObj);
	}

	
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
			showUploadImage(result);
		},
		error: function(error) {
			alert("이미지 파일이 아닙니다.")
		}
	});
	console.log(imgList);
	console.log(imgObj);
}) // end of input type file change

let regex = new RegExp("(.*?)\.(jpg|png|gif|JPG|PNG|GIF)$"); // 파일 형식 제한
let maxSize = 10485760000; // 파일 용량 제한

function imgCheck(imgName, imgSize) {
	if(imgSize >= maxSize) {
		alert("파일 사이즈 초과");
		return false;
	}
	if(!regex.test(imgName)) {
		alert("업로드할 수 없는 파일 형식");
		return false;
	}
	return true;
}

// 이미지 출력
function showUploadImage(uploadResultArr) {
	if(!uploadResultArr || uploadResultArr.length == 0) { alert("showUploadImage 오류"); return }
	for(let i=0;i<uploadResultArr.length;i++) {
		let uploadResult = $("#uploadResult");
		let obj = uploadResultArr[i];
		let str = "";
	//	let imsi = obj.productfile_path.replace(/\\/g, '/').indexOf('resource');
	//	let imsi2 = obj.productfile_path.replace(/\\/g, '/').slice(imsi);
	//	let fileCallPath = imsi2 + "/s_" + obj.productfile_name;
		let imsi = obj.productfile_path.replace(/\\/g, '/').indexOf('20');
		let imsi2 = obj.productfile_path.replace(/\\/g, '/').slice(imsi);
		let fileCallPath = imsi2 + "/s_" + obj.productfile_name;
	//	let fileCallPath = obj.productfile_path.replace(/\\/g, '/') + "/s_" + obj.productfile_name;
		console.log(fileCallPath)
		
		str += "<div id='result_card'>";
		str += "<img src='productfiledetail?imgName=" + fileCallPath + "'>";
	//	str += "<img src='/mall/" + fileCallPath + "'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "</div>"
		str += "<input type='hidden' name='productfileVO[" + i + "].productfile_name' value='"+ obj.productfile_name +"'>";
		str += "<input type='hidden' name='productfileVO[" + i + "].productfile_sname' value='"+ obj.productfile_sname +"'>";
		str += "<input type='hidden' name='productfileVO[" + i + "].productfile_path' value='"+ obj.productfile_path +"'>";
		
		uploadResult.append(str);
	} // end for for
	
}

// imgdeletebtn.click 사용 안 하는 이유는 div 태그가 웹 페이지 렌더링 이후 자스 코드를 통해 출력된 거라(동적 출력)
$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
	deleteImg();	
});

// 파일 삭제
function deleteImg() {
	let targetImg = $(".imgDeleteBtn").data("file");
	let targetDiv = $("#result_card");
	
	$.ajax({
		url: 'productfiledelete',
		data: {imgName : targetImg},
		dataType: 'text',
		type: 'POST',
		success: function(result) {
			console.log(result + " 삭제 완료");
			targetDiv.remove()
			$("input[type='file']").val("");
		},
		error: function(error) {
			console.log(error);
			alert("파일 삭제 실패");
		}
	})
}

$("#b_submit").on("click", function(e) {
	e.preventDefault();
	$("#f_product").submit();
})
</script>
</body>
</html>