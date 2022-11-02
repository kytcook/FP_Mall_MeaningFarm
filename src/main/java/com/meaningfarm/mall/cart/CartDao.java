package com.meaningfarm.mall.cart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.memproduct.dao.MemProductDao;

@Service
public class CartDao {

	Logger logger = LoggerFactory.getLogger(MemProductDao.class);

	@Autowired(required = false)
	private SqlSessionTemplate sql = null;

///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 목록 ----------------------------*/
	public List<Map<String, Object>> cartList(Map<String, Object> pMap) {
		logger.info("cartList 호출 성공");
		List<Map<String, Object>> cartList = null;
		try {
			cartList = sql.selectList("cartList", pMap);
			// insert here
			logger.info(cartList.toString());
		} catch (DataAccessException e) {
			logger.info("Exception : " + e.toString());
		}
		return cartList;

	}

///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 삭제 ----------------------------*/
	public int cartDelete(int cart_no) {
		int result = 0;
		try {
			result = sql.delete("cartDelete",cart_no);
			logger.info("result: "+ result);
		} catch (Exception e) {
			logger.info("Exception : " + e.toString());
		}
		return result;
	}

///////////////////////////////////////////////////////////////////////////
	/*-------------------------- 장바구니 번호채번 ---------------------------*/
//	public int cartNo() {
//		// TODO Auto-generated method stub
//		return 0;
//	}

///////////////////////////////////////////////////////////////////////////
	/*--------------------------- 장바구니 추가 -----------------------------*/
	public int cartAdd(CartVO cartVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
