package com.meaningfarm.mall.memproduct.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.meaningfarm.mall.memproduct.logic.ProductLogic;


@Controller
@RequestMapping("/product/")
public class MemProductController {
	Logger logger = LoggerFactory.getLogger(MemProductController.class);
	private ProductLogic productLogic = null;
	
	//	http://localhost/mall/product/productList.do
	@GetMapping("productList.do")
	public String productList(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("ProductList 호출 성공");
//		List<Map<String, Object>> productList = null;
//		productList = productLogic.productList(pMap);
//		model.addAttribute("productList", productList);
		return "product/productList";
	}

//	@GetMapping("productList.do")
//	public Object productList() {
//		logger.info("ProductList 호출 성공");
//		return "redirect:productList";
//	}
	
	//	http://localhost/mall/product/productContents.do
	@GetMapping("productContents.do")
	public String productContents(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("ProductContents 호출 성공");
//		List<Map<String, Object>> productList = null;
//		productList = productLogic.productList(pMap);
//		model.addAttribute("productList", productList);
		return "product/productContents";
	}
}
