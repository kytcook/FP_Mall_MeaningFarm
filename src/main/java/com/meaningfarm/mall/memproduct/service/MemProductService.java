package com.meaningfarm.mall.memproduct.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.memproduct.dao.MemProductDao;
import com.vo.MemProductVO;
import com.vo.MemProductfileVO;

@Service
public class MemProductService {
	Logger logger = LoggerFactory.getLogger(MemProductService.class);
	@Autowired(required=false)
	private MemProductDao productDao = null;
	
/////////////////////////////////////////////////////////////////////
	/*-------------------------- 상품 목록 --------------------------*/
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공"); // 최종에는 삭제
		List<Map<String,Object>> productList = null;
		productList = productDao.productList(pMap);
		return productList;
	}
	
/////////////////////////////////////////////////////////////////////
	/*-------------------------- 상품 보기 --------------------------*/	
	public List<Map<String, Object>> productView(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공"); // 최종에는 삭제
		List<Map<String,Object>> productList = null;
		productList = productDao.productList(pMap);
		return productList;
	}
	
/////////////////////////////////////////////////////////////////////
	/*------------------------- 상품이미지 출력 ------------------------*/
	public List<MemProductfileVO> memProductfileList(int product_no){
	logger.info("memProductfileList 호출 성공"); // 최종에는 삭제
	List<MemProductfileVO> memProductfileList = productDao.memProductfileList(product_no);
	return memProductfileList;

}

/////////////////////////////////////////////////////////////////////
	/*------------------------- 상품 카테고리 -------------------------*/
	public List<MemProductVO> productCTList(int category_type_no) {
		List<MemProductVO> CTList = null;
		CTList = productDao.productCTList(category_type_no);
		logger.info("MemProductService productCTList" + CTList);
		return CTList;
	}

	public List<MemProductVO> productCLList(int category_local_no) {
		List<MemProductVO> CLList = null;
		CLList = productDao.productCLList(category_local_no);
		logger.info("MemProductService productCLList" + CLList);
		return CLList;
	}

}
