package com.meaningfarm.mall.memproduct.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.memproduct.dao.MemProductDao;

@Service
public class MemProductService {
	Logger logger = LoggerFactory.getLogger(MemProductService.class);
	@Autowired(required=false)
	private MemProductDao productDao = null;
	
	// 상품리스트
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공"); // 최종에는 삭제
		List<Map<String,Object>> productList = null;
		productList = productDao.productList(pMap);
		if(productList!=null && productList.size()==1) {//.size는 Collections Framework의 ArrayList의 길이를 확인
			
		}
		return productList;
	}
	
	// 상품보기
	public List<Map<String, Object>> productView(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공"); // 최종에는 삭제
		List<Map<String,Object>> productList = null;
		productList = productDao.productList(pMap);		
		return productList;
	}

}
