package com.meaningfarm.mall.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meaningfarm.mall.Logic.ProductLogic;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	private ProductLogic productLogic = null;
	
	@GetMapping("productList.do")
	public String productList(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("ProductList 호출 성공");
//		List<Map<String, Object>> productList = null;
//		productList = productLogic.productList(pMap);
//		model.addAttribute("productList", productList);
		return "product/productList";
	}
}
