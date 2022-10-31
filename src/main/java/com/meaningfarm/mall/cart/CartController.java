package com.meaningfarm.mall.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 장바구니 목록
	// http://localhost/mall/product/cart.do
	@GetMapping("cartList.do")
	public String cartList(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("carList 호출 성공");
		List<Map<String, Object>> cartList = null;
		cartList = cartService.cartList(pMap);
		model.addAttribute("cartList", cartList);
		return "cart/cart";

	}
	
	// 장바구니 삭제
//	@GetMapping("cartDelete.do")
//	public Object cartDelete(@RequestParam Map<String, Object> pMap) {
//		logger.info("boardDelete 호출 성공");
//		int result = 0;
//		result = cartService.cartDelete(pMap);
//		return "redirect:cartList.do";
//	}
	
	@PostMapping("/cartDelete.do")
	public String cartDelete(@RequestParam(value="cartProduct_nos", required=false) String cart_nos, Model model) {
		String a = cart_nos;
		logger.info(a);
		logger.info("carDelete 호출 성공");
		List<String> cartProductchk = null;
		cartProductchk = new ArrayList<String>(Arrays.asList(cart_nos.split(",")));
		for(String cart_no : cartProductchk) {
			cartService.cartDelete(Integer.parseInt(cart_no));
			logger.info(cart_no);
		}
		return "redirect:cartList.do";
	}
//	@PostMapping("/cartDelete.do")
//	public String cartDelete(@RequestParam Map<String, Object> pMap, Model model) {
//		logger.info("carDelete 호출 성공");
//		List<Map<String, Object>> cartProductchk = null;
//		cartProductchk = new List<String,Object>(Arrays.asList(pMap.split(",")));
//		logger.info(cartProductchk.toString());
//		for(Map<String, Object> pMap : cartProductchk) {
//			cartService.cartDelete(Integer.parseInt(pMap.getString("")));
//		}
//		return "redirect:cartList.do";
//	}
}
