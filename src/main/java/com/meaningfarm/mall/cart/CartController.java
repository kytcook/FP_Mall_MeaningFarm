package com.meaningfarm.mall.cart;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cart/")
public class CartController {

	Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired(required = false)
	private CartService cartService = null;

	// 모든 장바구니 리스트 불러오기
	// http://localhost/mall/product/cart.do
	@GetMapping("cartList.do")
	public String cartList(Model model, @RequestParam Map<String, Object> pMap) {
//		logger.info("carList 호출 성공");
//		List<Map<String, Object>> cartList = null;
//		cartList = cartService.cartList(pMap);
//		model.addAttribute("cartList", cartList);
		return "cart/cart";

	}

}
