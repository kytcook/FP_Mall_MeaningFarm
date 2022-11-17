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

import com.vo.MemProductVO;
import com.vo.MemProductfileVO;

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
			mainProductList = sql.selectList("memProductList", pMap);
			// insert here
			logger.info(mainProductList.toString());
		} catch (DataAccessException e) {
			logger.info("Exception : " + e.toString());
		}
		return mainProductList;

	}

/////////////////////////////////////////////////////////////////////
	/*--------------------------- 상품이미지 -------------------------*/
	public List<MemProductfileVO> memProductfileList(int product_no) {
		logger.info("ProductDAO : " + product_no);
		List<MemProductfileVO> memProductfileList = null;
		try {
			memProductfileList = sql.selectList("memProductfileList", product_no);
			logger.info(memProductfileList.toString());
		} catch (DataAccessException e) {
			logger.info("Exception : " + e.toString());
		}
		return memProductfileList;
	}	
	
/////////////////////////////////////////////////////////////////////
	/*------------------------- 상품 카테고리 -------------------------*/
	public List<MemProductVO> productCTList(int category_type_no) {
		List<MemProductVO> CTList = null;
		CTList = sql.selectList("ListCategoryType", category_type_no);
		return CTList;
	}

	public List<MemProductVO> productCLList(int category_local_no) {
		List<MemProductVO> CLList = null;
		CLList = sql.selectList("ListCategoryLocal", category_local_no);
		return CLList;
	}

}// end of MemProductDao.class