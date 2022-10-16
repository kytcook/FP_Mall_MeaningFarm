package com.meaningfarm.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.meaningfarm.logic.ProductLogic;

public class ProductController {
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	private ProductLogic productLogic = null;
	
	public String productList(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("ProductList 호출 성공");
		List<Map<String, Object>> productList = null;
		productList = productLogic.productList(pMap);
		model.addAttribute("productList", productList);
		return "forward:boardList.jsp";
	}
}
