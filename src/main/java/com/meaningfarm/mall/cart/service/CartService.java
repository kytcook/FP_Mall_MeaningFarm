package com.meaningfarm.mall.cart.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meaningfarm.mall.cart.dao.CartDao;
import com.vo.CartVO;

@Service
public class CartService {
	// 로거 출력
	Logger logger = LoggerFactory.getLogger(CartService.class);

	@Autowired(required = false)
	private CartDao cartDao = null;
	
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 목록 ----------------------------*/
	public List<Map<String, Object>> cartList(Map<String, Object> pMap) {
		logger.info("cartList 호출 성공"); 
		List<Map<String, Object>> cartList = null;
		cartList = cartDao.cartList(pMap);
		return cartList;
	}
	
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 추가 ----------------------------*/
	public int cartAdd(CartVO cartVO) {
		logger.info("cartInsert 호출 성공");
		int result = 0;
		// 장바구니 데이터 체크 : m_id, product_no
		int cartCheck = cartDao.cartCheck(cartVO);
		if(cartCheck != 0) {// 등록정보가 DB에 있다면 2 반환
			logger.info("중복된 장바구니 데이터가 있습니다.");
			return 2;
		} else {// 장바구니 추가 후 1을 반환 | 실패시 0 반환
			result = cartDao.cartAdd(cartVO);
		}
		return result;
	
	}
	
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 수정 ----------------------------*/
	public int cartUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = cartDao.cartUpdate(pMap);
		return result;
	}
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 삭제 ----------------------------*/
	public int cartDelete(int cart_no) {
		int result = 0;
		result = cartDao.cartDelete(cart_no);
		return result;
	}

	
////////////////////////////////////////////////////////////////////////////

}
