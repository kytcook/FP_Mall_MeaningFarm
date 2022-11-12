package com.meaningfarm.mall.cart.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meaningfarm.mall.cart.service.CartService;
import com.meaningfarm.mall.interceptor.MemberVO;
import com.meaningfarm.mall.product.ProductVO;
import com.vo.CartVO;

@Controller
@RequestMapping("/cart/")
public class CartController {

	Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired(required = false)
	private CartService cartService = null;
	
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 목록 ----------------------------*/
	/* localhost/mall/product/cart.do?m_id='' */
	@GetMapping("cartList")
	public String cartList(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("carList 호출 성공");
		List<Map<String, Object>> cartList = null;
		cartList = cartService.cartList(pMap);
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}
	
	@GetMapping("cartRef")
	public String cartRef(Model model, @RequestParam Map<String, Object> pMap) {
		logger.info("carList 호출 성공");
		List<Map<String, Object>> cartList = null;
		cartList = cartService.cartList(pMap);
		model.addAttribute("cartList", cartList);
		return "cart/cartRef";
	}
	
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 추가 ----------------------------*/
	/**********************
	 * 0: 등록 실패(insert) - cart테이블에는 있지만 product테이블에 없는 경우(부모키위반)
	 * 1: 등록 성공(insert) 
	 * 2: 등록된 데이터 존재(check)  
	 * 5: 로그인 필요
	 * 
	 **/
	@GetMapping("cartAdd.do")
	@ResponseBody
	public String cartAdd(CartVO cartVO, HttpServletRequest request) {
		logger.info("carAdd.do 호출 성공");
		logger.info("CartVO - m_id : " + cartVO.getM_id() + "product_no : " + cartVO.getProduct_no() + "cart_amount : " + cartVO.getCart_amount());
		// 로그인 체크
//		HttpSession session = request.getSession();
//		String m_id = (String)session.getAttribute("m_id");
//		session.setAttribute("m_id", m_id);
//		
//		logger.info("로그인체크" + m_id);
//		if(m_id == null) {
//				return "5";
//		}
		
		// 장바구니 추가
		int result = 0;
		result = cartService.cartAdd(cartVO);
		
		// 확인확인 :D
		String str = Integer.toString(result);
		System.out.println("결과 : " + str);
		
		return result + ""; // 반환타입을 String 으로 변환
	}
	
///////////////////////////////////////////////////////////////////////////	
	/*---------------------------- 장바구니 수정 ----------------------------*/
	@PostMapping("cartUpdate.do")
	public Object cartUpdate(@RequestParam Map<String, Object> pMap) throws UnsupportedEncodingException {
		logger.info("cartUpdate 호출 성공");
		logger.info("pMap : " + pMap.toString());
		int result = 0;
		result = cartService.cartUpdate(pMap);
		
		// 브라우저 url에 한글인코딩
		String m_id = pMap.get("m_id").toString();
		m_id = URLEncoder.encode(m_id, "UTF-8");
		
		return "redirect:cartList?m_id=" + m_id;
		
	}
///////////////////////////////////////////////////////////////////////////	
	/*---------------------------- 장바구니 삭제 ----------------------------*/
	@PostMapping("cartDelete.do")
	public String cartDelete(@RequestParam(value="cartProduct_nos", required=false) String cartProduct_nos) {
		logger.info(cartProduct_nos);
		logger.info("carDelete 호출 성공");
		List<String> cartProductchk = null;
		cartProductchk = new ArrayList<String>(Arrays.asList(cartProduct_nos.split(",")));
		for(String cart_no : cartProductchk) {
			cartService.cartDelete(Integer.parseInt(cart_no));
			logger.info(cart_no);
		}
		return "redirect:cartList";
	}

///////////////////////////////////////////////////////////////////////////	
}// end of CartController.class
