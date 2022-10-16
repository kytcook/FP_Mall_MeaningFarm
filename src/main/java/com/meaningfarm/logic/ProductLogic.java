package com.meaningfarm.logic;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;

import com.meaningfarm.dao.ProductDao;


public class ProductLogic {
	Logger logger = LoggerFactory.getLogger(ProductLogic.class);
	private ProductDao productDao = null;
	
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공");
		List<Map<String,Object>> productList = null;
		productList = productDao.productList(pMap);
		return productList;
	}

}
