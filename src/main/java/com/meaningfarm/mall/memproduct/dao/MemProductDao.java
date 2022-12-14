package com.meaningfarm.mall.memproduct.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class MemProductDao {
	Logger logger = LoggerFactory.getLogger(MemProductDao.class);

	@Autowired(required = false)
	private SqlSessionTemplate sql = null;

/////////////////////////////////////////////////////////////////////
	/*----------------------- 상품목록 | 상품보기 ----------------------*/	
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("productList 호출 성공");
		List<Map<String, Object>> mainProductList = null;
		try {
			mainProductList = sql.selectList("memproductList", pMap);
			// insert here
			logger.info(mainProductList.toString());
		} catch (DataAccessException e) {
			logger.info("Exception : " + e.toString());
		}
		return mainProductList;

	}

}
