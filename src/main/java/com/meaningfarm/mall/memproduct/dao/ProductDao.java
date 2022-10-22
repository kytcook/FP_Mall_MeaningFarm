package com.meaningfarm.mall.memproduct.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

public class ProductDao {
	Logger logger = LoggerFactory.getLogger(ProductDao.class);
	@Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate = null;

	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("productList 호출 성공");
		List<Map<String, Object>> productList = null;
		try {
			productList = sqlSessionTemplate.selectList("productList", pMap);
			// insert here
			logger.info(productList.toString());
		} catch (DataAccessException e) {
			logger.info("Exception : " + e.toString());
		}
		return productList;

	}
}
