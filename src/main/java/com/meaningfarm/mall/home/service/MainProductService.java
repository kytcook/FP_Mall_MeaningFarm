package com.meaningfarm.mall.home.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.home.dao.MainProductDao;
import com.meaningfarm.mall.memproduct.dao.MemProductDao;
import com.meaningfarm.mall.memproduct.service.MemProductService;
@Service
public class MainProductService {

		Logger logger = LoggerFactory.getLogger(MainProductService.class);
		@Autowired(required=false)
		private MainProductDao mproductDao = null;
		
	/////////////////////////////////////////////////////////////////////
		/*-------------------------- 상품 목록 --------------------------*/
		public List<Map<String, Object>> mainProductList(Map<String, Object> pMap) {
			logger.info("boardList 호출 성공"); // 최종에는 삭제
			List<Map<String,Object>> mainProductList = null;
			mainProductList = mproductDao.mainProductList(pMap);
			return mainProductList;
		}
		
}
