package com.meaningfarm.mall.home.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
@Service
public class MainProductDao {
	Logger logger = LoggerFactory.getLogger(MainProductDao.class);

	@Autowired(required = false)
	private SqlSessionTemplate sql = null;

/////////////////////////////////////////////////////////////////////
	/*----------------------- 상품목록 | 상품보기 ----------------------*/	
	public List<Map<String, Object>> mainProductList(Map<String, Object> pMap) {
		logger.info("mainProductList 호출 성공");
		List<Map<String, Object>> mainProductList = null;
		try {
			mainProductList = sql.selectList("memProductList", pMap);
			// insert here
			logger.info(mainProductList.toString());
		} catch (DataAccessException e) {
			logger.info("Exception : " + e.toString());
		}
		return mainProductList;

	}
}
