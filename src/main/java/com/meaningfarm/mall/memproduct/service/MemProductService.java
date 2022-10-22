package com.meaningfarm.mall.memproduct.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.memproduct.dao.MemProductDao;

// 할 일 : 배송비에 음수 -> 양수 필터링 기능 추가
@Service
public class MemProductService {
	Logger logger = LoggerFactory.getLogger(MemProductService.class);
	@Autowired(required=false)
	private MemProductDao productDao = null;
	
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공");
		List<Map<String,Object>> productList = null;
		productList = productDao.productList(pMap);
		return productList;
	}

}
