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
		// 강사님코드 진행중
//		logger.info("cartInsert 호출 성공");
//		int result = 0;
//		// 글번호를 먼저 채번
//		int cart_no = 0;
//		cart_no = cartDao.cartNo();
//		pMap.put("cart_no", cart_no);
//		if(pMap.get)
//		result = cartDao.cartAdd(pMap);
//		return 0;
		
		// 장바구니 데이터 유효성 검사
//		CheckCart checkCart = cartDao.checkCart();
//		
//		if(chkCart !=null) { // DB에 이미 중복값이 있다면 2 반환.
//			return 2;
//		}
		try {
			return cartDao.cartAdd(cartVO);
		} catch (Exception e) {
			return 0;// 실패시 0 반환
		}
	
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
