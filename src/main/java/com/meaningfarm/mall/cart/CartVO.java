package com.meaningfarm.mall.cart;

import lombok.Data;

@Data
public class CartVO {
	int cart_no 		= 0;
	int cart_date 		= 0;
	int cart_amount 	= 0;
	int product_price	= 0;
	int product_no		= 0;
	String m_id 		= null;
	String product_name	= null;
	String prudct_img	= null;
	int product_dlvyfee = 0;
	
}
