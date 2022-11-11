package com.vo;

import lombok.Data;

@Data
public class SellerVO {
	private String 	m_id;
	private int 	seller_regino = 0;
	private String 	seller_storename;
	private String 	seller_owner;
	private int 	seller_zipcode = 0;
	private String 	seller_address;
	private String 	seller_address2;
	private String 	seller_email;
	private String 	seller_bank;
	private int 	seller_banknum = 0;
	private String	seller_bankowner;
}
