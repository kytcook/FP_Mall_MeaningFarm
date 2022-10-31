package com.meaningfarm.mall.cart;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	// 로거 출력
	Logger logger = LoggerFactory.getLogger(CartService.class);

	@Autowired(required = false)
	private CartDao cartDao = null;
	
	// 장바구니 리스트
	public List<Map<String, Object>> cartList(Map<String, Object> pMap) {
		logger.info("cartList 호출 성공"); // 최종에는 삭제
		List<Map<String, Object>> cartList = null;
		cartList = cartDao.cartList(pMap);
		return cartList;
	}

	public int cartDelete(int cart_no) {
		int result = 0;
		result = cartDao.cartDelete(cart_no);
		return result;
	}

//	public int cartDelete(Map<String, Object> pMap) {
//		int result = 0;
//		result = cartDao.cartDelete(pMap);
//		return result;
//	}

}
