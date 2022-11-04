//package com.meaningfarm.mall.mapper;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.meaningfarm.mall.cart.CartDao;
//import com.meaningfarm.mall.cart.CartVO;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//public class CartMapperTest {
//	
//	@Autowired
//	private CartDao CartDao;
//	
//	@Test
//	public void CartAdd() {
//	// given
//		String m_id = "야호랑";
//		int product_no = 1;
//		int cart_amount = 2;
//		
//		CartVO cartVO = new CartVO();
//		cartVO.setM_id(m_id);
//		cartVO.setProduct_no(product_no);
//		cartVO.setCart_amount(cart_amount);
//	
//	// when
//		int result = 0;
//		result = CartDao.cartAdd(cartVO);
//		
//	// then
//		System.out.println("결과 : " + result);
//		
//	}	
//}
