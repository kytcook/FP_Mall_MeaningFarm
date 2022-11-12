package com.meaningfarm.mall.cart.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.memproduct.dao.MemProductDao;
import com.vo.CartVO;

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
		} catch (Exception e) {
			logger.info("Exception : " + e.toString());
		}
		return cartList;

	}// end of cartList.method


///////////////////////////////////////////////////////////////////////////
	/*--------------------------- 장바구니 추가 -----------------------------*/
	public int cartAdd(CartVO cartVO) {
		logger.info("cartInsert 호출 성공");
		int result = 0;
		try {// 등록
			result = sql.insert("cartAdd",cartVO);
			logger.info("등록성공 : " + result);
		} catch (Exception e) {
			logger.info("등록실패 : " + e.toString());
		}
		return result;

	}// end of cartAdd.method

///////////////////////////////////////////////////////////////////////////
	/*--------------------------- 장바구니 확인 -----------------------------*/
	public int cartCheck(CartVO cartVO) {// 회원정보와 상품 정보를 넘겨 해당하는 row가 있나 확인
		logger.info("cartCheck 호출 성공 : "+cartVO.getM_id() + cartVO.getProduct_no());
		// 장바구니 데이터 체크
		// 0 : 중복데이터 없음. 1: 중복 데이터 있음.
		int cartCheck = 0;
		try {
			cartCheck = sql.selectOne("cartCheck",cartVO);
			logger.info("중복검사 : "+ cartCheck);
		} catch (Exception e) {
			logger.info("Exception(데이터 중복검사 실패) : " + e.toString());
			throw e;
		}
		System.out.println("여기");
		return cartCheck;

	}// end of cartCheck.method

///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 수정 ----------------------------*/
	public int cartUpdate(Map<String, Object> pMap) {
		int result = 0;
		try {
			result = sql.update("cartUpdate",pMap);
			logger.info("result: "+ result);
		} catch (Exception e) {
			logger.info("Exception(수정실패) : " + e.toString());
		}
		return result;
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
	}// end of cartDelete.method

}// end of CartDao.class
