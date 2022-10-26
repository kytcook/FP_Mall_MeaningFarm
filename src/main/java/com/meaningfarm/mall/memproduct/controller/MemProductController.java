// 일반회원 상품관리
package com.meaningfarm.mall.memproduct.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.meaningfarm.mall.memproduct.service.MemProductService;


@Controller
@RequestMapping("/product/")
public class MemProductController {
	Logger logger = LoggerFactory.getLogger(MemProductController.class);
	@Autowired(required = false)
	private MemProductService productService = null;
	
	// 상품리스트
	//	http://localhost/mall/product/productList.do
	@GetMapping("productList.do")
	public String productList(Model model,@RequestParam Map<String, Object> pMap) {
		logger.info("productList 호출 성공");
		List<Map<String, Object>> productList = null;
		productList = productService.productList(pMap);
		model.addAttribute("productList", productList);
		return "product/productList";
	}
	
	
	
	// 상품보기
	// http://localhost/mall/product/productView.do
	@GetMapping("productView.do")
	public String productView(Model model
							,@RequestParam Map<String, Object> pMap
							,@CookieValue(value="product_no",required=false) String cookie){
		logger.info("ProductView 호출 성공");
		List<Map<String, Object>> productList = null;
		productList = productService.productView(pMap);
		logger.info("productList를 잡았다! : "+productList.toString());
		model.addAttribute("productView", productList);
		return "product/productView";
		
	}
}
