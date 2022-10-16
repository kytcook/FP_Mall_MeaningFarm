package com.meaningfarm.logic;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.meaningfarm.controller.ProductController;

public class ProductLogic {
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@GetMapping("ProductList.farm")
	public static List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공");
		
		return null;
	}

}
