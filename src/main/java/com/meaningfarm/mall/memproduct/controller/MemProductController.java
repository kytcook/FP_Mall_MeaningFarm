// 일반회원 상품관리
package com.meaningfarm.mall.memproduct.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.meaningfarm.mall.memproduct.service.MemProductService;
import com.vo.MemProductVO;

@Controller
@RequestMapping("/product/")
public class MemProductController {
	Logger logger = LoggerFactory.getLogger(MemProductController.class);
	@Autowired(required = false)
	private MemProductService productService = null;

/////////////////////////////////////////////////////////////////////
	/*-------------------------- 상품 목록 --------------------------*/
	/* localhost/mall/product/productList.do */
	@GetMapping("productList")
	public String productList(Model model,@RequestParam Map<String, Object> pMap) {
		logger.info("productList 호출 성공");
		List<Map<String, Object>> productList = null;
		productList = productService.productList(pMap);
		model.addAttribute("productList", productList);
		return "product/productList";
	}
	
//	@GetMapping("/")
//	public String mainProductList(Model model,@RequestParam Map<String, Object> pMap) {
//		logger.info("mainProductList 호출 성공");
//		List<Map<String, Object>> mainProductList = null;
//		mainProductList = productService.productList(pMap);
//		model.addAttribute("mainProductList", mainProductList);
//		return "forward:index.jsp";
//	}
	
	
/////////////////////////////////////////////////////////////////////
	/*-------------------------- 상품 보기 --------------------------*/	
	/* localhost/mall/product/productView.do	*/
	@GetMapping("productView.do")
	public String productView(Model model, @RequestParam Map<String, Object> pMap, HttpSession session){
		String m_id = (String) session.getAttribute("m_id");
		logger.info("ProductView 호출 성공");
		List<Map<String, Object>> productList = null;
		productList = productService.productView(pMap);
		logger.info("productList를 잡았다! : "+productList.toString());
		model.addAttribute("productView", productList);
		return "product/productView";
	}

/////////////////////////////////////////////////////////////////////
	/*-------------------------- 상품 이미지 -------------------------*/
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
	logger.info("ProductController imagedetail " + fileName);
	File file = new File("D:\\java_study\\Project\\finalProject-220930\\workspace_meaningFarm\\meaningfarm\\src\\main\\webapp\\resources\\image\\" + fileName);
	ResponseEntity<byte[]> result = null;
	try {
	HttpHeaders header = new HttpHeaders();
	header.add("Content-type", Files.probeContentType(file.toPath()));
	result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	}catch (IOException e) {
	e.printStackTrace();
	}
	
	return result;
	}
	
//	// produces 속성 : 반환해주는 데이터를 JSON형식이 되도록 지정해준다.
//	@GetMapping(value="/memProductfileList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public ResponseEntity<List<MemProductfileVO>> memProductfileList(int product_no) {
//	logger.info("memProductfileList : ");
//	return new ResponseEntity<List<MemProductfileVO>>(productService.memProductfileList(product_no), HttpStatus.OK);
//	}	

//////////////////////////////////////////////////////////////////////
	/*-------------------------- 상품 카테고리 -------------------------*/
	@GetMapping("/productct")
	public String productCT(MemProductVO mVO, Model model) {
		logger.info("MemProductController productCT");
		model.addAttribute("ListCategoryType", productService.productCTList(mVO.getCategory_type_no()));
		System.out.println("카테고리타입 널값 체크" + productService.productCTList(mVO.getCategory_type_no()));
		return null;
	}

	@GetMapping("/productcl")
	public String productCL(MemProductVO mVO, Model model) {
		logger.info("MemProductController productCL");
		model.addAttribute("ListCategoryLocal", productService.productCLList(mVO.getCategory_local_no()));
		System.out.println("카테고리타입 널값 체크" + productService.productCLList(mVO.getCategory_local_no()));
		return null;
	}
	
//////////////////////////////////////////////////////////////////////
}//end of MemProductController.class
