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
import org.springframework.web.bind.annotation.ResponseBody;

import com.meaningfarm.mall.interceptor.MemberVO;
import com.meaningfarm.mall.product.ProductVO;

@Controller
@RequestMapping("/cart/")
public class CartController {

	Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired(required = false)
	private CartService cartService = null;
	
///////////////////////////////////////////////////////////////////////////
	/*---------------------------- 장바구니 목록 ----------------------------*/
	/* localhost/mall/product/cart.do?m_id='' */
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
	/*********
	 * 1: 등록 성공
	 * 2: 등록된 데이터 존재
	 * 5: 로그인 필요
	 */
	@GetMapping("cartAdd.do")
	@ResponseBody
	public String cartAdd(@RequestParam(value="cartAdd.do", required=false) CartVO cartVO, HttpSession session) {
		// 로그인 체크
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		//DB에 존재하는 m_id와 product_no을 입력해주세요
//		String m_id = "야호랑";
//		int product_no = 1;
//		int cart_amount = 2;
//		
////		CartVO cartVO = new CartVO();
//		cartVO.setM_id(m_id);
//		cartVO.setProduct_no(product_no);
//		cartVO.setCart_amount(cart_amount);
		
		int result = 0;
		result = cartService.cartAdd(cartVO);
		
		// 확인확인 :D
		String str = Integer.toString(result);
		logger.info(str);
		System.out.println("결과 : " + result);
		
		return result + ""; // 반환타입을 String 으로 변환
	}
	
	@GetMapping("/cartAdd")
	public String productInsert(CartVO cartVO) {
		logger.info("글 작성 버튼 누름 ProductVO " + cartVO);
		cartService.cartAdd(cartVO);
		return "redirect:cartList.do";
	}

///////////////////////////////////////////////////////////////////////////	
	/*---------------------------- 장바구니 삭제 ----------------------------*/
	@PostMapping("cartDelete.do")
	public String cartDelete(@RequestParam(value="cartProduct_nos", required=false) String cartProduct_nos, Model model) {
		logger.info(cartProduct_nos);
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
