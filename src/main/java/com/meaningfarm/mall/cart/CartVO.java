package com.meaningfarm.mall.cart;

import lombok.Data;

@Data
public class CartVO {
	private int cart_no 		= 0;
	private int cart_date 		= 0;
	private int cart_amount 	= 0;
	private int product_price	= 0;
	private int product_no		= 0;
	private String m_id 		= null;
	private String product_name	= null;
	private String prudct_img	= null;
	private int product_dlvyfee = 0;
	
}
