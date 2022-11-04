<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
<%@ include file="../../../common/common.jsp" %>
</head>
<body>
<style>
.scontainer {
	float: left;
	margin-top: -40px;
	margin-left: 100px;
}
#piContainer {
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
<div id="piContainer">
<h1>상품 등록</h1>
<input type="text" value="${m_id}">
<form action="./productinsert" method="post" id="f_product" enctype="multipart/form-data"> <br/>
<input type="text" class="form-control" name="product_name" id="product_name" placeholder="상품명"> <br/>
<select class="form-select" id="s_category_local_no" name="category_local_no">
	<option selected value="">카테고리-지역</option>
</select><br/>
<select class="form-select" id="s_category_type_no" name="category_type_no">
	<option selected value="">카테고리-종류</option>
</select><br/>
<input type="text" class="form-control" name="product_price" placeholder="상품 가격"> <br/>
<input type="text" class="form-control" name="product_stock" placeholder="상품 재고"> <br/>
<input type="file" class="form-control" name="product_img" id="product_img" accept="image/*" multiple> <br/>
<div id="uploadResult">
</div>
<input type="radio" class="form-check-input" name="dlvyfee_radio" value="dlvyfee_x"> 무료
<input type="radio" class="form-check-input" name="dlvyfee_radio" value="dlvyfee_s"> 조건부 무료
<input type="radio" class="form-check-input" name="dlvyfee_radio" value="dlvyfee_o"> 유료 <br/>
<div id="tb_dlvyfee_s" style="display:none;">
	배송비 조건 <input type="text" class="form-control" name="product_dlvylimit"> 원 이상 무료 <br/>
	기본 배송비 <input type="text" class="form-control" id="" name="product_dlvyfee"> 원
</div>
<div id="tb_dlvyfee_o" style="display:none;">
	기본 배송비 <input type="text" class="form-control" id="" name="product_dlvyfee"> 원
</div>
<input type="textarea" class="form-control" name="product_detail" placeholder="상세 설명"> <br/>
<input type="hidden" name="m_id" value="${m_id}">
</form>
<button id="b_submit" class="btn btn-warning">등록</button>
<button type="button" class="btn btn-dark" onclick="location.href='./productlisttest'">취소</button>
</div>
<%@ include file="../../../layout/footer.jsp" %>
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

	//이미지 업로드
	$("input[type='file']").on("change", function(e) {
		
		if($(".imgDeleteBtn").length > 0) {
			deleteImg();
		}
		
		let formData = new FormData();
		let imgInput = $("input[name='product_img']");
		let imgList = imgInput[0].files;
		let imgObj = imgList[0];
		
		if(!imgCheck(imgObj.name, imgObj.size)) {
			console.log(imgObj.name, imgObj.size)
			return false;
		}
		alert("통과");
		
		for(let i=0;i<imgList.length;i++) {
			formData.append("uploadImg", imgList[i]);
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
	}) // end of input type file change
	
	let maxSize = 10485760000; // 파일 용량 제한
	
	function imgCheck(imgName, imgSize) {
		if(imgSize >= maxSize) {
			alert("파일 사이즈 초과");
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
		let fileCallPath = obj.productfile_sname;

		str += "<div id='result_card'>";
		str += "<img src='productfiledetail?imgName=" + fileCallPath + "'>";
		str += "<div class='imgDeleteBtn' data-name='" + fileCallPath +"'>x</div>";
		str += "</div>"
		str += "<input type='hidden' name='productfileVO[0].productfile_name' value='"+ obj.productfile_name +"'>";
		str += "<input type='hidden' name='productfileVO[0].productfile_sname' value='"+ obj.productfile_sname +"'>";
		str += "<input type='hidden' name='productfileVO[0].productfile_path' value='"+ obj.productfile_path +"'>";
		
		uploadResult.append(str);
		
//		let imsi = "";
//		uploadResult.html(imsi);
//		for(let i=0;i<uploadResultArr.length;i++) {
//			let obj = uploadResultArr[i];
//			let str = "";
//			let imsi = obj.productfile_path.replace(/\\/g, '/').indexOf('20');
//			let imsi2 = obj.productfile_path.replace(/\\/g, '/').slice(imsi);
//			let fileCallPath = "s_" + obj.productfile_name;
//			let fileCallPath = obj.productfile_sname;
		//	let fileCallPath = obj.productfile_path.replace(/\\/g, '/') + "/s_" + obj.productfile_name;
//			console.log(fileCallPath)
			
			
//		} // end for for
		
	}
	
	// imgdeletebtn.click 사용 안 하는 이유는 div 태그가 웹 페이지 렌더링 이후 자스 코드를 통해 출력된 거라(동적 출력)
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
		deleteImg();	
	});
	
	// 파일 삭제
	function deleteImg() {
		let targetImg = $(".imgDeleteBtn").data("name");
		let targetDiv = $("#result_card");
		
		console.log(targetImg);
		console.log(targetDiv)
		
		$.ajax({
			url: 'productfiledeleteone',
			data: {imgName : targetImg},
			dataType: 'text',
			type: 'POST',
			success: function(result) {
				console.log(result + " 삭제 완료");
				targetDiv.remove();
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