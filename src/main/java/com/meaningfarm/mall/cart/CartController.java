package com.meaningfarm.mall.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cart/")
public class CartController {

	Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired(required = false)
	private CartService cartService = null;
	
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 목록 ----------------------------*/
	/* localhost/mall/product/cart.do */
	@GetMapping("cartList.do")
	public String cartList(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("carList 호출 성공");
		List<Map<String, Object>> cartList = null;
		cartList = cartService.cartList(pMap);
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}
	
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 추가 ----------------------------*/
	@GetMapping("cartAdd.do")
	// 강사님 코드 진행중
//	public String cartAdd(@RequestParam Map<String, Object> pMap) {
//	// 세션에서 유저 id받아오기
////	String userId = (String) session.getAttribute("userId");
//	int result = 0;
//	result = cartService.cartAdd(pMap);
//	return "redirect:cart/cart";
//		
//	}
	public String cartAdd(@RequestParam(value="cartAdd.do", required=false) CartVO cartVO) {
		// 로그인 체크
//		HttpSession session = request.getSession();
//		MemberVO mvo = (MemberVO)session.getAttribute("member");
//		if(mvo == null) {
//			return "5";
//		}
		int result = cartService.cartAdd(cartVO);
		
		return result + ""; // 반환타입을 String 으로 변환
	}

///////////////////////////////////////////////////////////////////////////	
	/*---------------------------- 장바구니 삭제 ----------------------------*/
	@PostMapping("cartDelete.do")
	public String cartDelete(@RequestParam(value="cartProduct_nos", required=false) String cartProduct_nos, Model model) {
		String a = cartProduct_nos;
		logger.info(a);
		logger.info("carDelete 호출 성공");
		List<String> cartProductchk = null;
		cartProductchk = new ArrayList<String>(Arrays.asList(cartProduct_nos.split(",")));
		for(String cart_no : cartProductchk) {
			cartService.cartDelete(Integer.parseInt(cart_no));
			logger.info(cart_no);
		}
		return "redirect:cartList.do";
	}

///////////////////////////////////////////////////////////////////////////	
}// end of CartController.class
